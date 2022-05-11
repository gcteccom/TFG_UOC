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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

</head>

<body>

	<div class="wrapper">
		<%@include file="jspf/sidebar.jspf"%>

		<div class="main-panel">
			<%@include file="jspf/nav.jspf"%>

			<div class="content">

				<h6>Informacion del cliente</h6>

				<div id="areaTicketCliente" class="container">

					<form method="post">

						<div class="row">

							<div class="form-group col-xs-2">
								<label for="nifCliente">NIF:</label> <input type="text"
									id="nifClienteGenerarTicket" class="form-control">
							</div>

							<div class="form-group col-xs-2">
								<button type="button" id="buscarClienteGenerarTicket" class="btn btn-primary posicionBotonesTicket">Buscar</button>
								<button type="reset" id="limpiarCLienteGenerarTicket" class="btn btn-info posicionBotonesTicket">Limpiar</button>
							</div>

							<div class="form-group col-xs-2">
								<label for="nombreCliente">Nombres:</label> <input type="text"
									class="form-control" id="nombreGenerarTicket" disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="apellidoCliente">Apellidos:</label> <input
									type="text" class="form-control" id="apellidoGenerarTicket"
									disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="fechaCliente">Fecha de Nacimiento:</label> <input
									type="date" class="form-control" id="fechaGenerarTicket"
									disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="telefonoCliente">Telefono:</label> <input
									type="text" class="form-control" id="telefonoGenerarTicket"
									disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="movilCliente">Movil:</label> <input type="text"
									class="form-control" id="movilGenerarTicket" disabled>
							</div>

							<div class="form-group col-xs-3">
								<label for="emailCliente">Email:</label> <input type="text"
									class="form-control" id="emailGenerarTicket" disabled>
							</div>

						</div>

					</form>

				</div>

				<h6>Informacion de los servicios</h6>

				<div id="areaTicketServicio" class="table-responsive">

					<button type="button" id="agregarServicioTicket" class="btn btn-primary">Agregar Servicio</button>
					<button type="button" id="asignarCarruselTicket" class="btn btn-primary">Asignar Carrusel</button>


					<table class="table table-striped" id="tablaCentralServicios" style="background-color: white">
						<thead>
							<tr>
								<th class="col-sm-0.5">#</th>
								<th class="col-sm-0.5">Codigo</th>
								<th class="col-sm-6">Descripcion</th>
								<th class="col-sm-1.5">Precio</th>
								<th class="col-sm-1">Cantidad</th>
								<th class="col-sm-1.5">Total</th>
								<th class="col-sm-1">-</th>
								
							</tr>
						</thead>
						<tbody id="cuerpoTabla"></tbody>

					</table>

				</div>
				
				<h6>Resumen</h6>
				
				<div id="areaTicketResumen" class="container-fluid">
				
					<form>

						<div class="row">

							<div class="form-group col-xs-2">
								<label for="nifResumen">NIF:</label> 
								<input type="text" id="nifResumen" class="form-control" disabled>
							</div>

							<div class="form-group col-xs-1">
								<label for="prendaResumen">Servicios:</label> 
								<input type="text" id="prendasResumen" value="0" class="form-control" disabled>
							</div>

							<div class="form-group col-xs-1">
								<label for="perchasResumen">Perchas:</label> 
								<input type="text" id="perchasResumen" value="0" class="form-control" disabled>
							</div>
							
							<div class="form-group col-xs-2">
								<label for="perchasResumen">Perchas seleccionadas:</label> 
								<select class="form-control" id="perchasSeleccionadas"></select>
							</div>
					
							<div class="form-group col-xs-2">
								<label for="tipoPagoResumen">Tipo de pago:</label>
								<div id="posicionamientoRadio">
									<label class="radio-inline"><input type="radio" name="tipoPago" value="contado" checked>Contado</label>
									<label class="radio-inline"><input type="radio" name="tipoPago" value="credito">Credito</label>
								</div>
								
							</div>
					
							<div class="form-group col-xs-2">
								<label for="totalResumen">Total:</label> 
								<input type="text" value="0" id="totalResumen" class="form-control" disabled>
							</div>
														
							<div class="form-group col-xs-1">
								<button type="button" id="enviarResumen" class="btn btn-danger" disabled data-toggle="modal" data-target="#modalGenerarTicket">Generar Ticket</button>
							</div>
					
						</div>
					
					</form>
					
				</div>

			</div>




		</div>

		<%@include file="jspf/footer.jspf"%>

	</div>

	<div class="modal fade" id="modalGenerarTicket">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4>Resumen</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body">
				
					<form method="post">

							<div class="form-group col-xs-12">
								<label for="nifResumen">Cliente:</label> 
								<input type="text" id="nifResumenModal" class="form-control" disabled>
							</div>
														
							<div class="form-group col-xs-6">
								<label for="prendasResumen">Servicios:</label> 
								<select class="form-control" id="prendasSeleccionadasModal"></select>
							</div>
							
							<div class="form-group col-xs-6">
								<label for="perchasResumen">Perchas asignadas:</label> 
								<select class="form-control" id="perchasSeleccionadasModal"></select>
							</div>
							
							<div class="form-group col-xs-12">
								<label for="tipoPago">Tipo de pago:</label> 
								<input type="text" id="tipoPagoModal" class="form-control" disabled>
							</div>
							
							<div class="form-group col-xs-12">
								<label for="tipoPago">Total:</label> 
								<input type="text" id="totalModal" class="form-control" disabled>
							</div>
							
							<div class="form-group col-xs-12">
								<label for="tipoPago">Pagado:</label> 
								<input type="text" id="pagadoModal" class="form-control estiloBotonesModal" disabled>
							</div>
							
							<div class="form-group col-xs-12">
								<label for="tipoPago">Devuelta:</label> 
								<input type="text" id="devueltaModal" class="form-control estiloBotonesModal" disabled>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
								<button type="button" id="botonGenerarTicketmodal" class="btn btn-primary">Generar</button>
							</div>

					</form>
					
				</div>

			</div>
		</div>
	</div>


</body>

<%@include file="jspf/scripts.jspf"%>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src="js/AjaxGenerarTickets.js"></script>

</html>
