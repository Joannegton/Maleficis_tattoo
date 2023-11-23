<%@ page language="java" import="java.sql.*" %>

<% //validação de login da pagina admin/admin.html
    String banco = "maleficis_tattoo";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

    //Variaveis que armazena informações digitadas pelo usuário
    String vlogin = request.getParameter("login") ;
    String vsenha = request.getParameter("senha") ;

    String driver = "com.mysql.jdbc.Driver";

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql = "SELECT * FROM usuario WHERE email=? AND senha=?" ;

    //Cria o statement para executar o comando no banco
    PreparedStatement stm = conexao.prepareStatement(sql) ;

    stm.setString( 1 , vlogin ) ;
    stm.setString( 2 , vsenha ) ;

    ResultSet  dados = stm.executeQuery() ;

    if ( dados.next()) {
        //cria a session chamada usuario
        session.setAttribute("usuario" , dados.getString("nome_completo") ) ;
        response.sendRedirect("../admin/post_blog.jsp") ;
    }else{
        response.sendRedirect("../admin/admin.html") ;
    }


%>


