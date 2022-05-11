<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>

<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}

	String buscar = request.getParameter("buscar");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Servicio</title>

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
	
		<div class="container-fluid">
			<div class="well"><h5>Seleccione los servicios y pulse en agregar</h5></div>
			
			<br>
	
			<form class="form-inline" action="PopupAgregarServicio.jsp" method="get">
	
				<input type="text" class="form-control" name="buscar">
				<button type="submit" class="btn btn-primary">Buscar</button>
				
			</form>
	
		</div>
	
		<br>
		
		<div class="table-responsive">
			<table class="table table-hover" style="background-color: white">
				<thead>
					<tr>
						<th>COD</th>
						<th>Descripcion</th>
						<th>Precio</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
	
					<%
						SessionFactory sesion = HibernateUtil.getSessionFactory();
						Session sessionHibernate = sesion.openSession();
						Transaction tx = sessionHibernate.beginTransaction();
						String cadena = "SELECT s FROM Servicio s";
						
						if (buscar != null && buscar != "") {

							cadena += " WHERE s.descripcion LIKE '%" + buscar + "%'";

						}
	
						cadena += " ORDER BY s.descripcion";
	
						Query query = sessionHibernate.createQuery(cadena);
						List<Servicio> servicios = query.list();
						for (Servicio servicio : servicios) {
					%>
	
					<tr>
						<td><%=servicio.getIdServicio()%></td>
						<td><%=servicio.getDescripcion()%></td>
						<td><%=servicio.getPrecio()%></td>
						<th><span class="agregarServicioModal" data-toggle="popover" data-content="Servicio ya esta agregado">Agregar</span></th>
	
					</tr>
	
					<%
						}
					%>
	
				</tbody>
			</table>
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

<script type="text/javascript" src="../js/AjaxGenerarTickets.js"></script>


</html>