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
<title>Tickets Activos</title>

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
			<div class="well"><h5>Seleccione el ticket y pulse en agregar</h5></div>
			
			<br>
	
			<form class="form-inline" action="PopupAgregarTicket.jsp" method="get">
				<label>Busqueda por NIF</label>
				<input type="text" class="form-control" name="buscar">
				<button type="submit" class="btn btn-primary">Buscar</button>
				
			</form>
	
		</div>
	
		<br>
		
		<div class="table-responsive">
			<table class="table table-hover" style="background-color: white">
				<thead>
					<tr>
						<th>Ticket No.</th>
						<th>NIF</th>
						<th>Fecha</th>
						<th>Prendas</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
	
					<%
						SessionFactory sesion = HibernateUtil.getSessionFactory();
						Session sessionHibernate = sesion.openSession();
						Transaction tx = sessionHibernate.beginTransaction();
						String cadena = "SELECT f FROM Factura f WHERE f.estado = 1";
						
						if (buscar != null && buscar != "") {

							cadena += " AND f.clientes LIKE '%" + buscar + "%'";

						}
	
						cadena += " ORDER BY f.idFactura";
	
						Query query = sessionHibernate.createQuery(cadena);
						List<Factura> facturas = query.list();
						for (Factura factura : facturas) {
					%>
	
					<tr>
						<td><%=factura.getIdFactura()%></td>
						<td><%=factura.getClientes().getDni()%></td>
						<td><%=factura.getFecha()%></td>
						<td><%=factura.getPrendas()%></td>
						<td><%=factura.getTotal()%></td>
						<th><span class="agregarTicketModal">Agregar</span></th>
	
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

<script type="text/javascript" src="../js/AjaxSalidaTicket.js"></script>


</html>