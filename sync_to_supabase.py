import os
import django
import logging
from datetime import datetime
from dotenv import load_dotenv
from supabase import create_client, Client

# --- 1. Configuração do Ambiente Django ---
load_dotenv()

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from servicos.models import Categoria, PrestadorServico, Avaliacao

# --- 2. Configuração do Supabase ---
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    raise ValueError("As variáveis de ambiente SUPABASE_URL e SUPABASE_KEY não estão configuradas no .env")

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# --- 3. Configuração de Logging ---
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def sync_categories():
    """Sincroniza categorias do Django para o Supabase."""
    logging.info("Iniciando sincronização de categorias...")
    django_categories = Categoria.objects.all()
    
    for cat in django_categories:
        try:
            response = supabase.table('category').select('id_category').eq('name', cat.nome).execute()
            
            if response.data:
                supabase_id = response.data[0]['id_category']
                update_data = {
                    'description': cat.descricao,
                }
                supabase.table('category').update(update_data).eq('id_category', supabase_id).execute()
                logging.info(f"✅ Categoria '{cat.nome}' atualizada no Supabase.")
            else:
                insert_data = {
                    'name': cat.nome,
                    'description': cat.descricao,
                }
                supabase.table('category').insert(insert_data).execute()
                logging.info(f"✅ Categoria '{cat.nome}' inserida no Supabase.")
        except Exception as e:
            logging.error(f"❌ Erro ao sincronizar categoria '{cat.nome}': {e}")
    logging.info("Sincronização de categorias concluída.\n")

def sync_professionals():
    """Sincroniza prestadores de serviço do Django para o Supabase."""
    logging.info("Iniciando sincronização de prestadores de serviço...")
    django_professionals = PrestadorServico.objects.all()
    
    for prof in django_professionals:
        try:
            category_response = supabase.table('category').select('id_category').eq('name', prof.categoria.nome).execute()
            if not category_response.data:
                logging.warning(f"⚠️ Categoria '{prof.categoria.nome}' não encontrada no Supabase. Pulando profissional '{prof.nome}'...")
                continue
            supabase_category_id = category_response.data[0]['id_category']

            professional_data = {
                'name': prof.nome,
                'email': prof.email,
                'phone': prof.telefone,
                'category_id': supabase_category_id,
                'description': prof.descricao_servico,
                'is_provider': True,
            }

            response = supabase.table('professional').select('id').eq('email', prof.email).execute()
            
            if response.data:
                supabase_id = response.data[0]['id']
                supabase.table('professional').update(professional_data).eq('id', supabase_id).execute()
                logging.info(f"✅ Profissional '{prof.nome}' atualizado no Supabase.")
            else:
                supabase.table('professional').insert(professional_data).execute()
                logging.info(f"✅ Profissional '{prof.nome}' inserido no Supabase.")
        except Exception as e:
            logging.error(f"❌ Erro ao sincronizar profissional '{prof.nome}': {e}")
    logging.info("Sincronização de prestadores de serviço concluída.\n")

def get_or_create_client(client_email: str, client_name: str) -> str:
    """
    Busca um cliente pelo email no Supabase.
    Se não existir, cria um novo cliente.
    Retorna o ID do cliente.
    """
    try:
        # Busca cliente existente
        response = supabase.table('client').select('id').eq('email', client_email).execute()
        
        if response.data:
            return response.data[0]['id']
        
        # Cliente não existe, criar novo
        new_client_data = {
            'name': client_name,
            'email': client_email,
            'password': 'temp_password',  # 🔐 IMPORTANTE: Trocar depois!
            'is_client': True,
        }
        
        insert_response = supabase.table('client').insert(new_client_data).execute()
        if insert_response.data:
            new_client_id = insert_response.data[0]['id']
            logging.info(f"✅ Cliente '{client_name}' ({client_email}) criado no Supabase com ID: {new_client_id}")
            return new_client_id
        else:
            logging.error(f"❌ Erro ao criar cliente '{client_name}': resposta vazia")
            return None
    except Exception as e:
        logging.error(f"❌ Erro ao obter/criar cliente '{client_email}': {e}")
        return None

def sync_reviews():
    """Sincroniza avaliações do Django para o Supabase."""
    logging.info("Iniciando sincronização de avaliações...")
    django_reviews = Avaliacao.objects.all()
    
    for review in django_reviews:
        try:
            # Busca o ID do profissional no Supabase
            professional_response = supabase.table('professional').select('id').eq('email', review.prestador.email).execute()
            if not professional_response.data:
                logging.warning(f"⚠️ Profissional '{review.prestador.nome}' não encontrado no Supabase. Pulando avaliação...")
                continue
            supabase_professional_id = professional_response.data[0]['id']

            # 🔑 NOVO: Obter ou criar cliente
            supabase_client_id = get_or_create_client(review.cliente_email, review.cliente_nome)
            if not supabase_client_id:
                logging.warning(f"⚠️ Falha ao obter/criar cliente '{review.cliente_nome}'. Pulando avaliação...")
                continue

            # Prepara os dados com o client_id incluído
            review_data = {
                'professional_id': supabase_professional_id,
                'client_id': supabase_client_id,  # 🔑 CAMPO OBRIGATÓRIO
                'rating': float(review.nota),  # Converter para float
                'comment': review.comentario,
            }

            # Verifica se a avaliação já existe (usando professional_id + client_id + rating)
            response = supabase.table('review').select('id').eq('professional_id', supabase_professional_id).eq('client_id', supabase_client_id).execute()
            
            if response.data:
                # Avaliação existe, atualiza
                supabase_id = response.data[0]['id']
                supabase.table('review').update(review_data).eq('id', supabase_id).execute()
                logging.info(f"✅ Avaliação do profissional '{review.prestador.nome}' atualizada no Supabase.")
            else:
                # Avaliação não existe, insere
                supabase.table('review').insert(review_data).execute()
                logging.info(f"✅ Avaliação do profissional '{review.prestador.nome}' inserida no Supabase.")
        except Exception as e:
            logging.error(f"❌ Erro ao sincronizar avaliação: {e}")
    logging.info("Sincronização de avaliações concluída.\n")

if __name__ == "__main__":
    logging.info("=" * 60)
    logging.info("🚀 Iniciando processo de sincronização completo...")
    logging.info("=" * 60 + "\n")
    
    sync_categories()
    sync_professionals()
    sync_reviews()
    
    logging.info("=" * 60)
    logging.info("✅ Processo de sincronização completo finalizado!")
    logging.info("=" * 60)