<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Base64" %>

<%
// variaveis para o banco de dados
String banco = "test";
String endereco = "jdbc:mysql://localhost:3306/" + banco;
String usuario = "root";
String senha = "";

// Variavel para o Driver
String driver = "com.mysql.jdbc.Driver";

// Carregar o driver na memória
Class.forName(driver);

// Cria a variavel para conectar com o banco de dados
Connection conexao;

// Abrir a conexao com o banco de dados
conexao = DriverManager.getConnection(endereco, usuario, senha);

String sql = "SELECT * FROM orcamento";

PreparedStatement stm = conexao.prepareStatement(sql);
ResultSet dados = stm.executeQuery();
%>

<table class='tabela' border=1>
    <thead>
        <tr>
            <th>Código</th>
            <!-- Outras colunas da tabela -->
            <th>Imagem1</th>
        </tr>
    </thead>
    <tbody>

        <%
        while (dados.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(dados.getString("id"));
            out.print("</td>");

            Blob imagemBlob = dados.getBlob("imagem1");
            if (imagemBlob != null) {
                InputStream inputStream = imagemBlob.getBinaryStream();
                byte[] imagemBytes = new byte[(int) imagemBlob.length()];
                inputStream.read(imagemBytes);
                String imagemBase64 = Base64.getEncoder().encodeToString(imagemBytes);
        %>
                <td>
                    <img src="data:image/jpeg;base64, <%= imagemBase64 %>" alt="Imagem1" style="max-width: 50px; max-height: 50px;">
                </td>
        <%
            } else {
                out.print("<td>N/A</td>");
            }

            out.print("</tr>");
        }
        %>

    </tbody>
</table>

<%
// Fechar recursos
dados.close();
stm.close();
conexao.close();
%>
