<%

	if(session.getAttribute("usuario")!=null){
		
		response.sendRedirect("generarTicket.jsp");
		
	}

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>TFG - Sistema de Gestion de Lavanderia</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
	
		<img id="logo_geisa" alt="" src="images/LOGO_GEISA2.png">
		
		<div class="container-login100">
	
		<div class="container">
		    <div class="row">
		        <div class="col-md-12">
		            <div class="well well-sm">
		                <form class="form-horizontal" method="post">
		                    <fieldset>
		                        <legend class="text-center header">Formulario de solicitud de servicio</legend>
		
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="fname" name="name" type="text" placeholder="Nombre" class="form-control">
		                            </div>
		                        </div>
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="lname" name="name" type="text" placeholder="Apellidos" class="form-control">
		                            </div>
		                        </div>
		
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="email" name="email" type="text" placeholder="Correo Electronico" class="form-control">
		                            </div>
		                        </div>
		
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="phone" name="phone" type="text" placeholder="Telefono" class="form-control">
		                            </div>
		                        </div>
		                        
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-address-card bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="direccion" name="direccion" type="text" placeholder="Dirección" class="form-control">
		                            </div>
		                        </div>
		                        
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-wrench bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="direccion" name="direccion" type="text" placeholder="Tipo de servicio" class="form-control">
		                            </div>
		                        </div>
		                        
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-calendar bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="direccion" name="direccion" type="text" placeholder="Disponibilidad" class="form-control">
		                            </div>
		                        </div>
		
		                        <div class="form-group d-flex flex-row justify-content-center alig-items-center">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
		                            <div class="col-md-8">
		                                <textarea class="form-control" id="message" name="message" placeholder="Por favor, indique a continuación los detalles por el cual nos esta solicitando el servicio" rows="7"></textarea>
		                            </div>
		                        </div>
		
		                        <div class="form-group">
		                            <div class="col-md-12 text-center">
		                                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
		                            </div>
		                        </div>
		                    </fieldset>
		                </form>
		            </div>
		        </div>
		    	</div>
		    </div>
		</div>
		
		<footer id="footer">
			<div style="min-height: 6.6vh; background-color: #46b24b;" >
				<p style="padding-top: 20px; color: white; font-family: Trebuche MS; font-size: 16px">Todos los derechos reservados 2020 © Geisa SRL | Diseñado por Jaime Gómez.</p>
			</div>
		</footer>
		
	</div>
	

	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>