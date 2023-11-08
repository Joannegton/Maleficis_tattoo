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























