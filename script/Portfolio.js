//Aumenta a imagem ao passar o mouse
const imagem_pura = document.querySelectorAll(".foto")

imagem_pura.forEach((img) => {
    img.addEventListener('mouseover', () =>{
        img.style.transform = 'scale(1.05)';
    })
    img.addEventListener('mouseout', () =>{
        img.style.transform = '';
    });
});

// Adicione um evento de clique a todas as imagens com a classe .imagem-ampliavel
const imagensAmpliaveis = document.querySelectorAll(".foto");

imagensAmpliaveis.forEach((imagem) => {
imagem.addEventListener("click", () => {
    // Cria um elemento de div para exibir a imagem em tela cheia
    const telaCheia = document.createElement("div");
    telaCheia.classList.add("tela-cheia");

    // Cria uma imagem dentro da div de tela cheia
    const imagemAmpliada = document.createElement("img");
    imagemAmpliada.src = imagem.src;

    // Adiciona a imagem ampliada à div de tela cheia
    telaCheia.appendChild(imagemAmpliada);

    // Adiciona a div de tela cheia ao corpo do documento
    document.body.appendChild(telaCheia);

    // Adiciona um evento de clique à div de tela cheia para fechá-la
    telaCheia.addEventListener("click", () => {
    document.body.removeChild(telaCheia);
    });
})
})

// Slider
let imgSlider = document.querySelector(".img_slider");
let ball1 = document.querySelector(".ball1");
let ball2 = document.querySelector(".ball2");

function slide1() {
    imgSlider.src = "imagens/slider/banner.png"; 
    setTimeout(slide2(), 5000)
 }

function slide2() {
   imgSlider.src = "imagens/slider/flash_dark.jpeg";
   setTimeout(slide1(), 5000)
}
slide2();

ball1.addEventListener("click", () => {
    slide1();
});

ball2.addEventListener("click", () => {
    slide2();
});


//night_mode

const cor_visualizacao = document.querySelector("#cor_visualizacao")

cor_visualizacao.addEventListener("change", function(){
    const night_mode = document.querySelector('.css')
    const opcao_selecionada = cor_visualizacao.options[cor_visualizacao.selectedIndex].value;

    if (opcao_selecionada === 'escuro'){
        night_mode.setAttribute("href", 'style/escuro.css');
    }
})

// Formulario verificações
function form_orcamentos(){
    var nome = document.getElementById('nome').value;
    if(nome.length == 0){
        document.querySelector("#erro_nome").textContent = "Preenchimento Obrigatório!";
        document.getElementById('nome').style.background = "#ffc1c1";
        return false;
    } 

    var tel = document.querySelector("#tel").value;
    if( tel.length == 0){
        document.querySelector("#erro_whats").textContent = "Preenchimento Obrigatório!";
        document.getElementById('tel').style.background = "#ffc1c1";
        return false;
    }   

    var dimensoes = document.querySelector("#dimensoes").value;
    if( dimensoes.length == 0){
        document.querySelector("#erro_dimensoes").textContent = "Preenchimento Obrigatório!";
        document.getElementById('dimensoes').style.background = "#ffc1c1";
        return false;
    }   

    var data = document.querySelector("#data").value;
    if( data.length == 0){
        document.querySelector("#erro_data").textContent = "Preenchimento Obrigatório!";
        document.getElementById('data').style.background = "#ffc1c1";
        return false;
    }   

    var img1 = document.querySelector("#arquivo1").value;
    if( img1.length == 0){
        document.querySelector("#erro_img1").textContent = "Preenchimento Obrigatório!";
        document.getElementById('arquivo1').style.background = "#ffc1c1";
        return false;
    }   

    var img2 = document.querySelector("#arquivo2").value;
    if( img2.length == 0){
        document.querySelector("#erro_img2").textContent = "Preenchimento Obrigatório!";
        document.getElementById('arquivo2').style.background = "#ffc1c1";
        return false;
    }   

    var historia = document.querySelector("#historia").value;
    if( historia.length == 0){
        document.querySelector("#erro_historia").textContent = "Preenchimento Obrigatório!";
        document.getElementById('historia').style.background = "#ffc1c1";
        return false;
    }   

    document.form1.submit();
}

//Validação de Login admin/admin.html

function validarLogin() {
    var username = document.getElementById('').value;
    var password = document.getElementById('password').value;

    // Simples validação de usuário e senha (substitua isso com sua lógica de validação real)
    if (username === 'usuario' && password === 'senha') {
        document.getElementById('error-message').innerText = 'Login bem-sucedido!';
    } else {
        document.getElementById('error-message').innerText = 'Login falhou. Verifique suas credenciais.';
    }
}











