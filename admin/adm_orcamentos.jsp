<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
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
    <link rel="shortcut icon" href="../imagens/Agulha.png" type="image/x-icon">

    
    
</head>
<body>

    <nav class="menu">
        <img class="logo" src="../imagens/logo_maleficis.png" alt="logo">
        <ul>
            <li><a href="post_blog.jsp">Postar No Blog</a></li>
            <li><a href="post_portfolio.jsp">Postar No Portfolio</a></li>
            <li><a href="adm_orcamentos.jsp">Orçamentos</a></li>
            
        </ul>
        <div class="recepcao">
            <%out.print( "<p>Bem vinda " + "<strong>" + session.getAttribute("usuario") + "</strong></p>" ) ;%>
            <button type="button" class="sair"><a href='../index.html' target="_blank">Site</a></button>
            <button type="button" class="sair"><a href='../servidor/logout.jsp'>Sair</a></button>
        </div>
    </nav>

    <section class="postagens">
        <h2 id="pagina">Orçamentos</h2>
        <%
        //variaveis para o banco de dados
        String banco    = "maleficis_tattoo" ;
        String endereco = "jdbc:mysql://localhost:3306/"+banco;
        String usuario  = "root";
        String senha    = "" ;

        //Variavel para o Driver
        String driver = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com o banco de dados
        Connection conexao ;

        //Abrir a conexao com o banco de dados
        conexao = DriverManager.getConnection(endereco, usuario, senha) ;
        %>
            <div class="filtro">
                <h4>Filtro</h4>
                <form action="adm_orcamentos.jsp" id="adm_orcamentos" method="post">
                    <select name='filtro' id='selecionador'  onchange="this.form.submit()">
                        <option value='' selected disabled>Selecione uma opção</option>
                        <option value='1'>Código</option>
                        <option value='2'>Nome</option>
                        <option value='3'>Data</option>
                        <option value='4'>Dimensões</option>
                    </select>
                </form>
            </div>

        <%
        String filtroParam = request.getParameter("filtro");

        if (filtroParam != null) {
            try {
                int option = Integer.parseInt(filtroParam);
                // Agora você pode usar 'option' como um valor numérico
                

                String sql = "";
                switch (option) {
                    case 1:
                        sql = "SELECT * FROM orcamento ORDER BY id ASC";
                        out.println("<p class= 'txtfiltro'><strong>Ordenado por:</strong> Chegada</p>");
                        break;
                    case 2:
                        sql = "SELECT * FROM orcamento ORDER BY nome_completo ASC";
                        out.println("<p class= 'txtfiltro'><strong>Ordenado por:</strong> Nome</p>");
                        break;
                    case 3:
                        sql = "SELECT * FROM orcamento ORDER BY data_hora ASC";
                        out.println("<p class= 'txtfiltro'><strong>Ordenado por:</strong> Data do Trampo</p>");
                        break;
                    case 4:
                        sql = "SELECT * FROM orcamento ORDER BY dimensoes ASC";
                        out.println("<p class= 'txtfiltro'><strong>Ordenado por:</strong> Dimensões</p>");
                        break;
                }
                PreparedStatement stm = conexao.prepareStatement(sql) ; //Cria o statement para executar o comando no banco
                ResultSet  dados = stm.executeQuery() ;

                out.print("<table class='tabela' border=1>");
                    out.print("<thead>");
                        out.print("<tr>");
                            out.print("<th>Código</th>");
                            out.print("<th class='coluna'>Nome</th>");
                            out.print("<th>Whatsapp</th>");
                            out.print("<th>Local</th>");
                            out.print("<th>Dimensões</th>");
                            out.print("<th class='coluna'>Data do Agendamento</th>");
                            out.print("<th class='coluna'>Imagem1</th>");
                            out.print("<th class='coluna'>Imagem2</th>");
                            out.print("<th>Historia</th>");
                            out.print("<th>Pele</th>");
                        out.print("</tr>");
                    out.print("</thead>") ;

                    while(dados.next())
                    {
                        out.print("<tr>") ;
                            out.print("<td>") ;
                                out.print( dados.getString("id") ) ;
                            out.print("</td>") ;
                            
                            out.print("<td>") ;
                                java.sql.Timestamp timestamp = dados.getTimestamp("data_hora"); 
                                    if (timestamp != null) { 
                                        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                        String data_agnd = dateFormat.format(timestamp);
                                        out.print(data_agnd);
                                    }                                 
                            out.print("</td>") ;

                            out.print("<td>") ;
                                out.print( dados.getString("nome_completo") ) ;
                            out.print("</td>") ;

                            out.print("<td>") ;
                                out.print( dados.getString("numero") ) ;
                            out.print("</td>") ;

                            out.print("<td>") ;
                                out.print( dados.getString("local") ) ;
                            out.print("</td>") ; 
                            
                            out.print("<td>") ;
                                out.print( dados.getString("dimensoes") ) ;
                            out.print("</td>") ;  

                            out.print("<td>") ;
                                out.print( dados.getString("imagem1") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("imagem2") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("historia") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("tom_pele") ) ;
                            out.print("</td>") ; 

                        out.print("</tr>") ;            
                    }

                    out.print("</table>");
            } catch (NumberFormatException e) {
                out.println("Valor inválido para 'filtro'.");
            }
        } else{

            String sql = "SELECT * FROM orcamento ORDER BY data_hora ASC";
            PreparedStatement stm = conexao.prepareStatement(sql) ; //Cria o statement para executar o comando no banco
                ResultSet  dados = stm.executeQuery() ;

                out.print("<table class='tabela' border=1>");
                    out.print("<thead>");
                        out.print("<tr>");
                            out.print("<th>Código</th>");
                            out.print("<th>Data do Agendamento</th>");
                            out.print("<th>Nome</th>");
                            out.print("<th>Whatsapp</th>");
                            out.print("<th>Local</th>");
                            out.print("<th>Dimensões</th>");
                            out.print("<th>Imagem1</th>");
                            out.print("<th>Imagem2</th>");
                            out.print("<th>Historia</th>");
                            out.print("<th>Pele</th>");
                        out.print("</tr>");
                    out.print("</thead>") ;

                    while(dados.next())
                    {
                        out.print("<tr>") ;
                            out.print("<td>") ;
                                out.print( dados.getString("id") ) ;
                            out.print("</td>") ;

                            out.print("<td>") ;
                                out.print( dados.getString("data_hora") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("nome_completo") ) ;
                            out.print("</td>") ;

                            out.print("<td>") ;
                                out.print( dados.getString("numero") ) ;
                            out.print("</td>") ;

                            out.print("<td>") ;
                                out.print( dados.getString("local") ) ;
                            out.print("</td>") ; 
                            
                            out.print("<td>") ;
                                out.print( dados.getString("dimensoes") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("imagem1") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("imagem2") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("historia") ) ;
                            out.print("</td>") ; 

                            out.print("<td>") ;
                                out.print( dados.getString("tom_pele") ) ;
                            out.print("</td>") ; 

                        out.print("</tr>") ;            
                    }

                    out.print("</table>");
        }
    %>
        
    </section>
</body>
</html>

<%}%>