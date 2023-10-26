const mysql = require('mysql2');

//criando conexao
const conexao = mysql.createConnection({
    host: '127.0.0.1',
    user:'root',
    password: '131998Wel@',
    database: 'portifolio',
});

//fazendo a conexão e criando a função de erro
conexao.connect((erro) =>{
    if (erro){
        console.error('Erro de conexão com o Mysql: ' + erro.message);
        return;
    }
    console.log("Conexão com o Mysql estabelecida com sucesso.");
});

conexao.query("SELECT * FROM portifolio", (erro, resultado) => {
    if (erro){
        console.error("Erro na consulta: ", erro.message);
        return;
    }
    console.log("Resultados da consulta: ", resultado)
});

conexao.end();