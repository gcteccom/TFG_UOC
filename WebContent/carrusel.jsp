<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>

<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}
%>

<!doctype html>
<html lang="en">

<head>
<%@include file="jspf/head.jspf"%>
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">


</head>

<body>

	<div class="wrapper">
		<%@include file="jspf/sidebar.jspf"%>

		<div class="main-panel">
			<%@include file="jspf/nav.jspf"%>

			<div class="content">
			
					<div class="well text-center"><h3 class="text-primary">Estado Carrusel</h3></div>
			
							<%
								SessionFactory sesion = HibernateUtil.getSessionFactory();
								Session sessionHibernate = sesion.openSession();
								Transaction tx = sessionHibernate.beginTransaction();
								String cadena = "SELECT p FROM Perchero p";
								
								Query query = sessionHibernate.createQuery(cadena);
								List<Perchero> percheros = query.list();
								for (Perchero perchero : percheros){
									
									if(!perchero.isEstado()){
																
							%>
									<h4><span class="label label-success pull-left"><%=perchero.getIdPerchero() %> - Libre</span></h4>
									
									<%} else {%>
																								
									<h4><span class="label label-danger pull-left"><%=perchero.getIdPerchero() %>-<%=perchero.getFactura().getClientes().getDni() %></span></h4>
														
									<%} %>
										
								<%}%>
							
				
			</div>


			

		</div>
		
		<%@include file="jspf/footer.jspf"%>
	
	</div>


</body>

<%@include file="jspf/scripts.jspf"%>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

</html>
