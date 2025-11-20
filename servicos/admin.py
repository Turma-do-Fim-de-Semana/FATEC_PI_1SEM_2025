from django.contrib import admin
from django.utils.html import format_html
from .models import Categoria, PrestadorServico, Avaliacao


@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ['nome', 'total_prestadores']
    search_fields = ['nome']
    
    def total_prestadores(self, obj):
        count = obj.prestadores.count()
        return format_html('<strong>{}</strong>', count)
    total_prestadores.short_description = 'Total de Prestadores'


class AvaliacaoInline(admin.TabularInline):
    """Inline para editar avaliações dentro do PrestadorServico"""
    model = Avaliacao
    extra = 1


@admin.register(PrestadorServico)
class PrestadorServicoAdmin(admin.ModelAdmin):
    list_display = [
        'nome',
        'categoria',
        'status_badge',
        'cidade',
        'avaliacao_badge',
    ]
    
    list_filter = [
        'status',
        'categoria',
        'cidade',
        'estado',
        'ativo',
    ]
    
    search_fields = [
        'nome',
        'email',
        'telefone',
        'cpf',
        'cidade',
    ]
    
    readonly_fields = [
        'criado_em',
        'atualizado_em',
    ]
    
    fieldsets = (
        ('Informações Pessoais', {
            'fields': ('nome', 'email', 'telefone', 'cpf')
        }),
        ('Profissional', {
            'fields': ('categoria', 'descricao_servico', 'anos_experiencia')
        }),
        ('Localização', {
            'fields': ('latitude', 'longitude', 'endereco', 'cidade', 'estado')
        }),
        ('Status e Controle', {
            'fields': ('status', 'ativo', 'avaliacao', 'total_avaliacoes', 'criado_em', 'atualizado_em')
        }),
    )
    
    inlines = [AvaliacaoInline]
    
    def status_badge(self, obj):
        colors = {
            'ativo': '#28a745',
            'inativo': '#6c757d',
            'suspenso': '#dc3545',
        }
        return format_html(
            '<span style="background-color: {}; color: white; padding: 5px 10px; border-radius: 3px;">{}</span>',
            colors.get(obj.status, '#6c757d'),
            obj.get_status_display()
        )
    status_badge.short_description = 'Status'
    
    def avaliacao_badge(self, obj):
        if obj.avaliacao > 0:
            return format_html('⭐ {} ({} avaliações)', obj.avaliacao, obj.total_avaliacoes)
        return '—'
    avaliacao_badge.short_description = 'Avaliação'


@admin.register(Avaliacao)
class AvaliacaoAdmin(admin.ModelAdmin):
    list_display = ['prestador', 'cliente_nome', 'nota_estrelas', 'criado_em']
    list_filter = ['nota', 'criado_em']
    search_fields = ['prestador__nome', 'cliente_nome']
    
    def nota_estrelas(self, obj):
        return format_html('⭐ {}', obj.nota)
    nota_estrelas.short_description = 'Nota'