<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Base64"%>

<%
String banco = "test";
String endereco = "jdbc:mysql://localhost:3306/" + banco;
String usuario = "root";
String senha = "";

String sql = "INSERT INTO orcamento (imagem1) VALUES (?)";

try {
    Connection conexao = DriverManager.getConnection(endereco, usuario, senha);
    Part imagemPart = request.getPart("foto");

    try (PreparedStatement statement = conexao.prepareStatement(sql)) {
        // Ler os bytes da imagem
        InputStream imagemStream = imagemPart.getInputStream();
        byte[] imagemBytes = new byte[imagemStream.available()];
        imagemStream.read(imagemBytes);

        // Configurar o parâmetro BLOB
        statement.setBytes(1, imagemBytes);

        // Executar a inserção
        statement.executeUpdate();
    }

    out.println("Upload de imagem bem-sucedido!");

} catch (SQLException | IOException e) {
    out.println("Erro durante o upload de imagem: " + e.getMessage());
    e.printStackTrace();
}
%>

