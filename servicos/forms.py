# servicos/forms.py
from django import forms
from .models import Prestador

class PrestadorForm(forms.ModelForm):
    class Meta:
        model = Prestador
        fields = [
            'nome', 'email', 'telefone', 'categoria_servico',
            'descricao', 'experiencia_anos', 'preco_medio',
            'areas_atendimento', 'disponibilidade'
        ]
        widgets = {
            'nome': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'telefone': forms.TextInput(attrs={'class': 'form-control'}),
            'categoria_servico': forms.Select(attrs={'class': 'form-select'}),
            'descricao': forms.Textarea(attrs={'class': 'form-control', 'rows': 4}),
            'experiencia_anos': forms.NumberInput(attrs={'class': 'form-control'}),
            'preco_medio': forms.NumberInput(attrs={'class': 'form-control'}),
            'areas_atendimento': forms.TextInput(attrs={'class': 'form-control'}),
            'disponibilidade': forms.CheckboxSelectMultiple(),
        }