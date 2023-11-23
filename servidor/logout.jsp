<%
    if( session != null){
        session.invalidate() ;
        response.sendRedirect("../admin/admin.html") ;
    }

%>