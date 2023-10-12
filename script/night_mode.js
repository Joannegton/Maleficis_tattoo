
const cor_visualizacao = document.querySelector("#cor_visualizacao")

cor_visualizacao.addEventListener("change", function(){
    const night_mode = document.querySelector('.css')
    const opcao_selecionada = cor_visualizacao.options[cor_visualizacao.selectedIndex].value;

    if (opcao_selecionada === 'escuro'){
        night_mode.setAttribute("href", 'style/escuro.css');
    }
})