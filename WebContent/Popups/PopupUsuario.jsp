<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Gestion de usuario</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

</head>
<body>

	<div class="content">
		
		<div class="container">
		
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#nuevoUsuario">Nuevo</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#modificaUsuario">Eliminar</a></li>
		</ul>

		<!-- GUARDAR USUARIO -->

		<div class="tab-content">
			<div id="nuevoUsuario" class="container tab-pane active pull-left">
				<br>
				<form id="guardarUsuario" method="post">

					<div class="row">
						<div class="form-group col-xs-4">
							<label for="nombreUsuario">Nombre:</label> 
							<input type="text" class="form-control" id="nombreUsuario" onfocus="cambiaColor(this.id, 'white')">
						</div>
						<div class="form-group col-xs-4">
							<label for="idUsuario">Usuario:</label> <input type="text"
								class="form-control" id="idUsuario" onfocus="cambiaColor(this.id, 'white')">
						</div>
					</div>

					<div class="row">
						<div class="form-group col-xs-4">
							<label for="passUsuario">Contraseña:</label> <input
								type="password" class="form-control" id="passUsuario" onfocus="cambiaColor(this.id, 'white')">
						</div>
						<div class="form-group col-xs-4">
							<label for="passUsuarioRepetir">Repite contraseña:</label> <input
								type="password" class="form-control" id="passUsuarioRepetir" onfocus="cambiaColor(this.id, 'white')">
						</div>
					</div>

					<div class="row">
						<div class="form-group col-xs-4">
							<label for="accesoUsuario">Tipo de acceso:</label>
								<select class="form-control" id="accesoUsuario">
									<option>Usuario</option>
									<option>Administrador</option>
								</select>
						</div>
					</div>

					<div class="row">
						&nbsp&nbsp&nbsp&nbsp
						<!-- Se llama desde el js AjaxUsuario -->
						<button type="button" id="botonGuardar" class="btn btn-primary btn-lg">Guardar</button>
						<button type="reset" class="btn btn-info btn-lg" onclick="resetColorInput()">Limpiar</button>
					</div>

				</form>
				<br>

			</div>

			<!-- MODIFICAR CLIENTE -->

			<div id="modificaUsuario" class="container tab-pane fade pull-left">
				<br>
				<form id="modificarUsuario" method="post">

					<div class="row">
						<div class="form-group col-xs-4">
							<label for="buscaUsuario">Usuario:</label> 
								<select class="form-control" id="listaUsuarios">
									<option></option>
							<%
								SessionFactory sesion = HibernateUtil.getSessionFactory();
								Session sessionHibernate = sesion.openSession();
								Transaction tx = sessionHibernate.beginTransaction();

								Query query = sessionHibernate.createQuery("SELECT u FROM Usuarioslogin u");
								List<Usuarioslogin> usuarios = query.list();
								for (Usuarioslogin usuario : usuarios) {%>
							
									<%if(!session.getAttribute("user").equals(usuario.getUsuario())){ %>
							
										<option><%=usuario.getUsuario() %></option>	
								
								<%
									}
									
								} %>
							
								</select>
							

						</div>
						
					</div>

					<div class="row">
						<div class="form-group col-xs-4">
							<label for="nombreUsuario">Nombre:</label> 
							<input type="text" class="form-control" id="nombreUsuarioModificar" disabled>
						</div>
						<div class="form-group col-xs-4">
							<label for="nombreUsuario">Tipo de acceso:</label> 
							<input type="text" class="form-control" id="tipoUsuarioModificar" disabled>
						</div>
						
					</div>
					
					<div class="row">
						&nbsp&nbsp&nbsp&nbsp
						<!-- Los eventos se gestionan desde js -->
						<button type="button" id="botonEliminarUsuario" disabled class="btn btn-danger btn-lg">Eliminar</button>
					</div>

				</form>

			</div>

		</div>
		
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
<!-- <script src="../assets/js/light-bootstrap-dashboard.js"></script> -->

<script type="text/javascript" src="../js/PopupUsuario.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

</html>