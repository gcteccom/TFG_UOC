<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>


<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}
%>

<!doctype html>
<html lang="es">

<head>
<%@include file="jspf/head.jspf" %>
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

</head>

<body>

    <div class="wrapper">
       <%@include file="jspf/sidebar.jspf" %>

        <div class="main-panel">
           <%@include file="jspf/nav.jspf" %>

            <div class="content">
            
            	<div class="container">
            		
            		<img id="imagenUsuario" src="images/usuario.png"><figure>Gestion de usuario</figure></img>
										
				</div>

            </div>

			<%@include file="jspf/footer.jspf" %>
           
        </div>
    </div>


</body>

<%@include file="jspf/scripts.jspf" %>
<script type="text/javascript" src="js/AjaxMantenimiento.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>


</html>
