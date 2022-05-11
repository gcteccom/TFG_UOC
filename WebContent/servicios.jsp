<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>

<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}

	String buscar = request.getParameter("buscar");
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

				<div class="bg-primary">
					<h3 class="text-info">Servicios</h3>
				</div>
				<br>

				<div class="container-fluid">

					<form class="form-inline"  action="servicios.jsp" method="get">

						<input type="text" class="form-control " id="inputBuscar" name="buscar">
						<button type="submit" class="btn btn-primary" id="botonServicioBuscar">Buscar</button>
						<button type="button" id="botonNuevoServicio" class="btn btn-primary">Nuevo</button>

					</form>

				</div>
				<br> <br>
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
								<th><button type="button"
										class=" btn btn-info botonServicioModificar">Modificar</button>
									<button type="button"
										class="btn btn-danger botonServicioEliminar">Eliminar</button></th>

							</tr>

							<%
								}
							%>




						</tbody>
					</table>
				</div>
			</div>
			

		</div>
		
		<%@include file="jspf/footer.jspf"%>
	
	</div>


</body>

<%@include file="jspf/scripts.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src="js/AjaxServicio.js"></script>

</html>
