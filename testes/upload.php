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