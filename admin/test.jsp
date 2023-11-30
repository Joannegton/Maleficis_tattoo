<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Base64" %>

<%
// Variáveis para o banco de dados
String banco = "test";
String endereco = "jdbc:mysql://localhost:3306/" + banco;
String usuario = "root";
String senha = "";

// Variável para o Driver
String driver = "com.mysql.jdbc.Driver";

// Carregar o driver na memória
Class.forName(driver);

// Criar a variável para conectar com o banco de dados
Connection conexao;

// Abrir a conexão com o banco de dados
conexao = DriverManager.getConnection(endereco, usuario, senha);

// Verificar se o formulário foi submetido
if (request.getMethod().equalsIgnoreCase("post")) {
    // Obter os dados do formulário

    Part imagemPart = request.getPart("imagem1");

    // Preparar a consulta SQL para inserir os dados e a imagem
    String sql = "INSERT INTO imagens (conteudo) VALUES (?)";
    try (PreparedStatement statement = conexao.prepareStatement(sql)) {

        // Ler os bytes da imagem
        InputStream imagemStream = imagemPart.getInputStream();
        byte[] imagemBytes = new byte[imagemStream.available()];
        imagemStream.read(imagemBytes);

        // Configurar o parâmetro BLOB
        statement.setBytes(1, imagemBytes);

        // Executar a inserção
        statement.executeUpdate();
    } catch (SQLException | IOException e) {
        e.printStackTrace();
    }
}
%>

<form action="test.jsp" method="post" enctype="multipart/form-data">



    <input type="file" name="imagem1" accept="image/*">

    <input type="submit" value="Enviar">
</form>

