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
});
});

