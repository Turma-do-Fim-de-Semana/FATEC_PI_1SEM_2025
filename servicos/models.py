from django.db import models


class Categoria(models.Model):
    """Categorias de serviços (Encanador, Eletricista, etc)"""
    nome = models.CharField(max_length=100, unique=True)
    descricao = models.TextField(blank=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        verbose_name = "Categoria"
        verbose_name_plural = "Categorias"
        ordering = ['nome']
    
    def __str__(self):
        return self.nome


class PrestadorServico(models.Model):
    """Modelo principal de prestador de serviço"""
    
    STATUS_CHOICES = [
        ('ativo', 'Ativo'),
        ('inativo', 'Inativo'),
        ('suspenso', 'Suspenso'),
    ]
    
    # Informações básicas
    nome = models.CharField(max_length=150)
    email = models.EmailField(unique=True)
    telefone = models.CharField(max_length=20)
    cpf = models.CharField(max_length=14, unique=True)
    
    # Profissional
    categoria = models.ForeignKey(Categoria, on_delete=models.PROTECT, related_name='prestadores')
    descricao_servico = models.TextField()
    anos_experiencia = models.IntegerField(default=0)
    
    # Localização
    latitude = models.DecimalField(max_digits=9, decimal_places=6)
    longitude = models.DecimalField(max_digits=9, decimal_places=6)
    endereco = models.CharField(max_length=255)
    cidade = models.CharField(max_length=100)
    estado = models.CharField(max_length=2)
    
    # Status e avaliação
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='ativo')
    avaliacao = models.DecimalField(max_digits=3, decimal_places=2, default=0.00)
    total_avaliacoes = models.IntegerField(default=0)
    
    # Controle
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Prestador de Serviço"
        verbose_name_plural = "Prestadores de Serviço"
        ordering = ['-criado_em']
    
    def __str__(self):
        return f"{self.nome} - {self.categoria.nome}"


class Avaliacao(models.Model):
    """Avaliações dos prestadores"""
    prestador = models.ForeignKey(PrestadorServico, on_delete=models.CASCADE, related_name='avaliacoes')
    cliente_nome = models.CharField(max_length=150)
    cliente_email = models.EmailField()
    nota = models.IntegerField(choices=[(i, str(i)) for i in range(1, 6)])
    comentario = models.TextField()
    criado_em = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        verbose_name = "Avaliação"
        verbose_name_plural = "Avaliações"
        ordering = ['-criado_em']
    
    def __str__(self):
        return f"Avaliação {self.nota} - {self.prestador.nome}"