<%@page language="java" import="java.sql.*" %>
//Servidor da pagina admin/post.html
<%

    String ftitulo = request.getParameter("titulo");
    String fdescricao = request.getParameter("descricao");
    String ffoto1 = request.getParameter("foto1");
    String ffoto2 = request.getParameter("foto2");
    String ffoto3 = request.getParameter("foto3");

    //variaveis para o banco de dados mysql(xampp)
    String banco = "maleficis_tattoo";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

    //variavel para o driver mysql-connector-java
    String driver = "com.mysql.jdbc.Driver";
    Class.forName(driver); //carrega o driver na memoria
    Connection conexao; //cria variavel para conectar com o DB
    conexao = DriverManager.getConnection(endereco, usuario, senha); //Conexão com credenciais no DB 

    String sql = "INSERT INTO postagens (imagem1, imagem2, imagem3, texto, titulo) values (?,?,?,?,?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, ffoto1);
    stm.setString(2, ffoto2);
    stm.setString(3, ffoto3);
    stm.setString(4, fdescricao);
    stm.setString(5, ftitulo);

    stm.execute();
    stm.close();

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>") ;
    out.print("<a href='../admin/post.html'>Voltar</a>") ;








%>