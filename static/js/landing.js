// Função para scroll suave até o formulário
function scrollToCadastro() {
    document.getElementById('cadastro').scrollIntoView({ 
        behavior: 'smooth' 
    });
}

// Validação e envio do formulário
function handleSubmit(event) {
    event.preventDefault();
    
    // Limpar mensagens de erro anteriores
    clearErrors();
    
    // Obter valores do formulário
    const nome = document.getElementById('nome').value.trim();
    const email = document.getElementById('email').value.trim();
    const telefone = document.getElementById('telefone').value.trim();
    const categoria = document.getElementById('categoria').value;
    const cidade = document.getElementById('cidade').value.trim();
    
    let isValid = true;
    
    // Validar nome
    if (nome === '') {
        showError('nome', 'Nome completo é obrigatório');
        isValid = false;
    }
    
    // Validar email
    if (email === '') {
        showError('email', 'Email é obrigatório');
        isValid = false;
    } else if (!isValidEmail(email)) {
        showError('email', 'Por favor, insira um email válido');
        isValid = false;
    }
    
    // Validar telefone
    if (telefone === '') {
        showError('telefone', 'Telefone é obrigatório');
        isValid = false;
    }
    
    // Validar categoria
    if (categoria === '') {
        showError('categoria', 'Selecione uma categoria');
        isValid = false;
    }
    
    // Validar cidade
    if (cidade === '') {
        showError('cidade', 'Cidade/Região é obrigatória');
        isValid = false;
    }
    
    // Se todos os campos forem válidos
    if (isValid) {
        // Mostrar mensagem de sucesso
        document.getElementById('success-message').style.display = 'block';
        
        // Limpar formulário
        document.getElementById('cadastroForm').reset();
        
        // Esconder mensagem de sucesso após 5 segundos
        setTimeout(() => {
            document.getElementById('success-message').style.display = 'none';
        }, 5000);
        
        // Aqui você pode adicionar código para enviar os dados para um servidor
        console.log('Formulário enviado com sucesso:', {
            nome,
            email,
            telefone,
            categoria,
            cidade
        });
    }
    
    return false;
}

// Função para validar email
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Função para mostrar erro
function showError(fieldId, message) {
    const errorElement = document.getElementById(fieldId + '-error');
    if (errorElement) {
        errorElement.textContent = message;
    }
}

// Função para limpar erros
function clearErrors() {
    const errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(element => {
        element.textContent = '';
    });
    
    // Esconder mensagem de sucesso
    document.getElementById('success-message').style.display = 'none';
}

// Máscara para telefone (opcional)
document.getElementById('telefone').addEventListener('input', function(e) {
    let value = e.target.value.replace(/\D/g, '');
    
    if (value.length <= 11) {
        if (value.length <= 2) {
            e.target.value = value;
        } else if (value.length <= 6) {
            e.target.value = `(${value.slice(0, 2)}) ${value.slice(2)}`;
        } else if (value.length <= 10) {
            e.target.value = `(${value.slice(0, 2)}) ${value.slice(2, 6)}-${value.slice(6)}`;
        } else {
            e.target.value = `(${value.slice(0, 2)}) ${value.slice(2, 7)}-${value.slice(7, 11)}`;
        }
    }
});
