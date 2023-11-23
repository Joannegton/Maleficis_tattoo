<%@ page language="java" import="java.sql.*" %>

<% //validação de login da pagina admin/admin.html
    String banco = "maleficis_tattoo";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

    String driver = "com.mysql.jdbc.Driver";

    try {
        Class.forName(driver);
        Connection conexao = DriverManager.getConnection(endereco, usuario, senha);

        String sql = "SELECT * FROM usuario";
        PreparedStatement stm = conexao.prepareStatement(sql);
        ResultSet dados = stm.executeQuery();

        boolean autenticado = false;

        while (dados.next()) {
            String email = dados.getString("email");
            String senhaBanco = dados.getString("senha");
            String flogin = request.getParameter("login");
            String fsenha = request.getParameter("senha");
            if (email.equals(flogin) && senhaBanco.equals(fsenha)) {
                autenticado = true;
                break;
            }
        }

        if (autenticado) {
            out.print("arrasou");
        } else {
            out.print("deu ruim");
        }

        // Fechar a conexão
        conexao.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Erro: " + e.getMessage());
    }

%>