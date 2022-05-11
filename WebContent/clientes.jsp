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

<%@include file="jspf/head.jspf" %>
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

</head>

<body>

	<div class="wrapper">
		<%@include file="jspf/sidebar.jspf"%>

		<div class="main-panel">
			<%@include file="jspf/nav.jspf"%>

			<div class="content">

				<!-- 				<div class="container"> -->
				<br>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#nuevoCliente">Nuevo</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#modificaCliente">Modificar</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#consultaCliente">Consultar</a></li>
				</ul>

				<!-- GUARDAR CLIENTE -->

				<div class="tab-content">
					<div id="nuevoCliente" class="container tab-pane active pull-left">
						<br>
						<form id="guardarCliente" method="post">

							<div class="row">
								<div class="form-group col-xs-4">
									<label for="nifCliente">NIF:</label> <input type="text"
										class="form-control" id="nifCliente"
										onfocus="cambiaColor(this.id, 'white')">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-xs-4">
									<label for="nombreCliente">Nombres:</label> <input type="text"
										class="form-control" id="nombreCliente"
										onfocus="cambiaColor(this.id, 'white')">
								</div>

								<div class="form-group col-xs-4">
									<label for="apellidoCliente">Apellidos:</label> <input
										type="text" class="form-control" id="apellidoCliente"
										onfocus="cambiaColor(this.id, 'white')">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-4">
									<label for="fechaCliente">Fecha de Nacimiento:</label> <input
										type="date" class="form-control" id="fechaCliente">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-xs-4">
									<label for="telefonoCliente">Telefono:</label> <input
										type="text" class="form-control" id="telefonoCliente">
								</div>

								<div class="form-group col-xs-4">
									<label for="movilCliente">Movil:</label> <input type="text"
										class="form-control" id="movilCliente">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-4">
									<label for="direccionCliente">Direccion:</label> <input
										type="text" class="form-control" id="direccionCliente">
								</div>

								<div class="form-group col-xs-4">
									<label for="poblacionCliente">Poblacion:</label> <input
										type="text" class="form-control" id="poblacionCliente">
								</div>

								<div class="form-group col-xs-4">
									<label for="provinciaCliente">Provincia:</label> <input
										type="text" class="form-control" id="provinciaCliente">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-4">
									<label for="emailCliente">E-Mail:</label> <input type="text"
										class="form-control" id="emailCliente">
								</div>
							</div>
							<div class="row">
								&nbsp&nbsp&nbsp&nbsp
								<!-- 								Se llama desde el js AjaxCliente -->
								<button type="button" id="botonGuardar"
									class="btn btn-primary btn-lg">Guardar</button>
								<button type="reset" class="btn btn-info btn-lg"
									onclick="resetColorInput()">Limpiar</button>
							</div>
							
						</form>
						<br>

					</div>

					<!-- 					MODIFICAR CLIENTE -->


					<div id="modificaCliente" class="container tab-pane fade pull-left">
						<br>
						<form id="modificarCliente" method="post">

							<div class="row">
								<div class="form-group col-xs-4">
									<label for="nifCliente">NIF:</label> <input type="text"
										class="form-control" id="nifClienteModificar"
										onfocus="cambiaColor(this.id, 'white')">
								</div>

								<div class="form-group" style="margin-top: 25px">
									<button type="button" class="btn btn-primary"
										id="buscarCliente">Buscar</button>
									<button type="button" disabled class="btn btn-info"
										id="limpiarModificar">Limpiar</button>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-xs-4">
									<label for="nombreCliente">Nombres:</label> <input type="text"
										class="form-control" id="nombreClienteModificar"
										onfocus="cambiaColor(this.id, 'white')">
								</div>

								<div class="form-group col-xs-4">
									<label for="apellidoCliente">Apellidos:</label> <input
										type="text" class="form-control" id="apellidoClienteModificar"
										onfocus="cambiaColor(this.id, 'white')">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-4">
									<label for="fechaCliente">Fecha de Nacimiento:</label> <input
										type="date" class="form-control" id="fechaClienteModificar">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-xs-4">
									<label for="telefonoCliente">Telefono:</label> <input
										type="text" class="form-control" id="telefonoClienteModificar">
								</div>

								<div class="form-group col-xs-4">
									<label for="movilCliente">Movil:</label> <input type="text"
										class="form-control" id="movilClienteModificar">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-4">
									<label for="direccionCliente">Direccion:</label> <input
										type="text" class="form-control"
										id="direccionClienteModificar">
								</div>

								<div class="form-group col-xs-4">
									<label for="poblacionCliente">Poblacion:</label> <input
										type="text" class="form-control"
										id="poblacionClienteModificar">
								</div>

								<div class="form-group col-xs-4">
									<label for="provinciaCliente">Provincia:</label> <input
										type="text" class="form-control"
										id="provinciaClienteModificar">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-4">
									<label for="emailCliente">E-Mail:</label> <input type="email"
										class="form-control" id="emailClienteModificar">
								</div>
							</div>
							<div class="row">
								&nbsp&nbsp&nbsp&nbsp
								<!-- Los eventos se gestionan desde js -->
								<button type="button" id="botonModificarCliente" disabled
									class="btn btn-primary btn-lg">Modificar</button>
								<button type="button" id="botonEliminarCliente" disabled
									class="btn btn-danger btn-lg">Eliminar</button>
							</div>
							
						</form>

					</div>

					<!-- 					CONSULTAR BASE DE DATOS CLIENTES -->


					<div id="consultaCliente" class="container tab-pane fade pull-left">

						<h2>Clientes</h2>
						<table class="table table-hover" style="background-color:white">
						<thead>
								<tr>
									<th>NIF</th>
									<th>Nombres</th>
									<th>Apellidos</th>
									<th>Fecha de Nacimiento</th>
									<th>Telefono</th>
									<th>Movil</th>
									<th>Direccion</th>
									<th>Poblacion</th>
									<th>Provincia</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
						
						<%
							SessionFactory sesion = HibernateUtil.getSessionFactory();
							Session sessionHibernate = sesion.openSession();
							Transaction tx = sessionHibernate.beginTransaction();

							Query query = sessionHibernate.createQuery("SELECT c FROM Clientes c");
							List<Clientes> clientes = query.list();
							for (Clientes cliente : clientes) {%>

								<tr>
									<td><%=cliente.getDni() %></td>
									<td><%=cliente.getNombre() %></td>
									<td><%=cliente.getApellido() %></td>
									<td><%=cliente.getFecha() %></td>
									<td><%=cliente.getTelefono() %></td>
									<td><%=cliente.getMovil() %></td>
									<td><%=cliente.getDireccion() %></td>
									<td><%=cliente.getPoblacion() %></td>
									<td><%=cliente.getProvincia() %></td>
									<td><%=cliente.getEmail() %></td>
															
								</tr>
							
							<% }%>

							</tbody>
						</table>


					</div>
				</div>
			</div>
			
			

		</div>
		
		<%@include file="jspf/footer.jspf"%>

	</div>



</body>

<%@include file="jspf/scripts.jspf" %>


<script type="text/javascript" src="js/AjaxCliente.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>


</html>
