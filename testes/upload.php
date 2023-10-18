<?php
// Configurações do banco de dados
$host = 'localhost';
$usuario = 'MySQL80';
$senha = '131998Wel@';
$banco = 'portfolio';

// Conecta ao banco de dados
$mysqli = new mysqli($host, $usuario, $senha, $banco);

// Verifica se a conexão foi estabelecida corretamente
if ($mysqli->connect_errno) {
    die("Erro na conexão com o banco de dados: " . $mysqli->connect_error);
}

// Verifica se um arquivo de imagem foi enviado
if (isset($_FILES['imagem'])) {
    $imagem = $_FILES['imagem'];

    // Verifica se o arquivo é uma imagem
    if (getimagesize($imagem['tmp_name'])) {
        // Prepara a imagem para ser armazenada no banco de dados
        $dadosImagem = file_get_contents($imagem['tmp_name']);
        $dadosImagem = $mysqli->real_escape_string($dadosImagem);

        // Insere a imagem no banco de dados
        $sql = "INSERT INTO imagens (conteudo) VALUES ('$dadosImagem')";
        if ($mysqli->query($sql) === true) {
            echo "Imagem enviada com sucesso!";
        } else {
            echo "Erro ao enviar a imagem: " . $mysqli->error;
        }
    } else {
        echo "O arquivo não é uma imagem válida.";
    }
} else {
    echo "Nenhuma imagem foi enviada.";
}

// Fecha a conexão com o banco de dados
$mysqli->close();
?>
