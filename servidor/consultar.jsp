<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>

        .tabela{
            font-size: .8em;
            border: 1px solid black;
        }
        tr:nth-child(even) {
            background-color: lightgray;
        }
        tr:hover{
            background-color: #6495ED;
        }
    </style>
</head>
<body>
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

        String sql = "SELECT * FROM orcamento" ;

        //Cria o statement para executar o comando no banco
        PreparedStatement stm = conexao.prepareStatement(sql) ;

        ResultSet  dados = stm.executeQuery() ; 

        out.print("<table class='tabela' border=1>");
        out.print("<tr>");
            out.print("<th>Código</th>");
            out.print("<th>Nome</th>");
            out.print("<th>Whatsapp</th>");
            out.print("<th>Tom de pele</th>");
            out.print("<th>Dimensões</th>");
            out.print("<th>Data do Agendamento</th>");
            out.print("<th>Imagem1</th>");
            out.print("<th>Imagem2</th>");
            out.print("<th>Historia</th>");
            out.print("<th>Local</th>");
        out.print("</tr>"); 

        while(dados.next())
        {
            out.print("<tr>") ;
                out.print("<td>") ;
                    out.print( dados.getString("id") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("nome_completo") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("numero") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("tom_pele") ) ;
                out.print("</td>") ; 
                
                out.print("<td>") ;
                    out.print( dados.getString("dimensoes") ) ;
                out.print("</td>") ; 

                out.print("<td>") ;
                    out.print( dados.getString("data_hora") ) ;
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
                    out.print( dados.getString("local") ) ;
                out.print("</td>") ; 

            out.print("</tr>") ;            
        }

        out.print("</table>");
    %>
</body>
</html>
