document.getElementById('filtroInput').addEventListener('input', function() {
    const filtro = this.value.toLowerCase();
    const tabela = document.querySelector('.tabela');
    const linhas = tabela.getElementsByTagName('tr');

    for (let i = 1; i < linhas.length; i++) {
        const colunas = linhas[i].getElementsByTagName('td');
        let encontrou = false;

        for (let j = 0; j < colunas.length; j++) {
            const texto = colunas[j].innerText.toLowerCase();
            if (texto.indexOf(filtro) > -1) {
                encontrou = true;
                break;
            }
        }

        linhas[i].style.display = encontrou ? '' : 'none';
    }
});

function ordenarTabela(coluna) {
    const tabela = document.querySelector('.tabela');
    const linhas = tabela.getElementsByTagName('tr');
    const switcher = 1;

    const ordenar = function (index, switcher) {
        return function() {
            const shouldSwitch = switcher * (index > 0 ? -1 : 1);
            const colunaTexto = linhas[index].getElementsByTagName('td')[coluna].innerText.toLowerCase();
            const proximaColunaTexto = linhas[index + 1].getElementsByTagName('td')[coluna].innerText.toLowerCase();
            
            if (shouldSwitch > 0 ? colunaTexto > proximaColunaTexto : colunaTexto < proximaColunaTexto) {
                linhas[index].parentNode.insertBefore(linhas[index + 1], linhas[index]);
                shouldSwitching = true;
            }
        }
    }

    for (let i = 1; i < linhas.length - 1; i++) {
        switcher = true;
        
        linhas[i].addEventListener('click', ordenar(i, switcher));
    }
}