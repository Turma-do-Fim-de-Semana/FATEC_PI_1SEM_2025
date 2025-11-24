# servicos/views.py
from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import JsonResponse
from .forms import PrestadorForm
from .models import Prestador

def landing_page(request):
    """View principal da landing page"""
    if request.method == 'POST':
        form = PrestadorForm(request.POST)
        if form.is_valid():
            prestador = form.save()
            
            # Sincronizar com Supabase
            try:
                sync_prestador_to_supabase(prestador)
                messages.success(request, 'Cadastro realizado com sucesso!')
                return redirect('cadastro_sucesso')
            except Exception as e:
                messages.error(request, 'Erro ao sincronizar dados')
                
        else:
            messages.error(request, 'Erro no formulário. Verifique os dados.')
    else:
        form = PrestadorForm()
    
    return render(request, 'landing/index.html', {'form': form})

def cadastro_sucesso(request):
    """Página de sucesso após cadastro"""
    return render(request, 'landing/success.html')

def api_cadastro(request):
    """API endpoint para cadastro via AJAX"""
    if request.method == 'POST':
        form = PrestadorForm(request.POST)
        if form.is_valid():
            prestador = form.save()
            return JsonResponse({
                'success': True,
                'message': 'Cadastro realizado com sucesso!'
            })
        else:
            return JsonResponse({
                'success': False,
                'errors': form.errors
            })
    
    return JsonResponse({'success': False, 'message': 'Método não permitido'})