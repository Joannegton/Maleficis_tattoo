function tem_foto(){
    var foto = document.querySelector('#foto')
    var aparecer = querySelector('div#imagem')

    if (foto){
        //fazer aparecer uma foto na div#foto
    }
}





function postar(){
    let tittle = document.querySelector('.titulo')
    let description = document.querySelector('.descricao')

    tittle.innerHTML = 'titulo'
    description.innerHTML = descricao
}



//Validação de Login admin/admin.html

function validarLogin() {
    var username = document.getElementById('login').value;
    var password = document.getElementById('senha').value;

    // Simples validação de usuário e senha (substitua isso com sua lógica de validação real)
    if (username === 'usuario' && password === 'senha') {
        document.getElementById('error-message').innerText = 'Login bem-sucedido!';
    } else {
        document.getElementById('error-message').innerText = 'Login falhou. Verifique suas credenciais.';
    }
}

