<%@page language="java" import="java.sql.*" %>
<%
   //verifica se a session chamada usuario existe
   if (  session.getAttribute("usuario") == null ) {
        response.sendRedirect("../admin/admin.html") ;
   }
   else
   {
  
%>
<!DOCTYPE html>
<html lang="Pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>
    <link rel="stylesheet" href="style/style.css" media="all">
    
</head>
<body>

    <nav class="menu">
        <img class="logo" src="../imagens/logo_maleficis.png" alt="logo">
        <ul>
            <li><a href="post_blog.jsp">Postar No Blog</a></li>
            <li><a href="post_portfolio.jsp">Postar No Portfolio</a></li>
        </ul>
        <div class="recepcao">
            <%out.print( "Bem vindo(a) " + session.getAttribute("usuario") ) ;%>
            <button type="button" class="sair"><a href='../index.html'>Site</a></button>
            <button type="button" class="sair"><a href='../servidor/logout.jsp'>Sair</a></button>
        </div>
    </nav>

    <section class="postagens" >

        <h2 id="pagina">Postar no Portfolio</h2>
        
        <form id="post_portfolio" action="../servidor/postar_portfolio.jsp" method="post" enctype="multipart/form-data" autocomplete="on">
            Selecione uma imagem para fazer upload:
            <label for="foto">Título:</label>          
            <input type="file" name="foto" id="foto" required>
            

            <input id="enviar" class="botao" type="submit" value="Enviar" >
        </form>
    </section>
</body>
</html>

<%}%>