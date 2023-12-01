<%@page language="java" import="java.sql.*" %>

<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário no formulario da pagina orcamentos.html
    String fnome = request.getParameter("nome");
    String ftel = request.getParameter("tel");
    int fpele = Integer.parseInt(request.getParameter("tom_pele"));
    String flocal = request.getParameter("local");
    String fdimensoes = request.getParameter("dimensoes");
    String fdata = request.getParameter("data");
    String farquivo1 = request.getParameter("arquivo1");
    String farquivo2 = request.getParameter("arquivo2");
    String fhistoria = request.getParameter("historia");

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

    //variavel query sql
    String sql = "INSERT INTO orcamento (nome_completo, numero, tom_pele, dimensoes, data_hora, imagem1, imagem2, historia, local) values (?,?,?,?,?,?,?,?,?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, fnome);
    stm.setString(2, ftel);
    stm.setInt(3, fpele);
    stm.setString(4, fdimensoes);
    stm.setString(5, fdata);
    stm.setString(6, farquivo1);
    stm.setString(7, farquivo2);
    stm.setString(8, fhistoria);
    stm.setString(9, flocal);

    stm.execute();
    stm.close() ;

    response.sendRedirect("../orcamentos.html") ;

%>