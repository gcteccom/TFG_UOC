<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>

<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}
	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asignar Perchas</title>
<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="../assets/css/animate.min.css" rel="stylesheet" />

<!--  Light Bootstrap Table core CSS    -->
<link href="../assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="../assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />

</head>
<body>

<div class="content">
			
					<div class="well text-center"><h3 class="text-primary">Seleccione las perchas y pulse aceptar</h3></div>
					
					<div class="container-fluid">

						<form>
	
								<div class="form-group col-xs-2">
									<label for="cantidadPrendasCarrusel">Cantidad servicios:</label> 
									<input type="text" id="cantidadServiciosCarrusel" class="form-control textoAlaDerecha" disabled>
								</div>
	
								<div class="form-group col-xs-2">
									<label for="cantidadPerchasCarrusel">Cantidad perchas:</label> 
									<input type="text" id="cantidadPerchasCarrusel" value="0" class="form-control textoAlaDerecha" disabled>
								</div>
								
								<div class="form-group col-xs-4 pull-right">
									<button type="button" id="aceptarPerchasCarrusel" class="btn btn-primary btn-lg" 
									data-toggle="popoverCarrusel" data-content="Cantidas de perchas seleccionadas no coincide con la cantidad de servicios">Aceptar</button>
								</div>
							
						</form>
					</div>
					<div class="container">
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
									<div class="contenedorImagen imagenSeleccionCarrusel">
										<img src="../images/disponible.jpg" class="img-thumbnail">
										<div class="textoImagen"><%=perchero.getIdPerchero() %></div>
									</div>
									
									<%} else {%>
									
									<div class="contenedorImagen">
										<img src="../images/ocupado.jpg" class="img-thumbnail">
										<div class="textoImagen"><%=perchero.getIdPerchero() %></div>
									</div>
														
									<%} %>
										
								<%}%>
							
					</div>
		</div>				
</body>

<!--   Core JS Files   -->
<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="../assets/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="../assets/js/light-bootstrap-dashboard.js"></script>

<script type="text/javascript" src="../js/PopupCarrusel.js"></script>

</html>