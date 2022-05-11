<%

	if(session.getAttribute("usuario")!=null){
		
		response.sendRedirect("generarTicket.jsp");
		
	}

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sistema de Gestion de Lavanderia</title>
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
	
		<img id="logo" alt="" src="">
	
		<div class="container-login100">
		
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" method="post" action="login">
					<span class="login100-form-title p-b-33">Acceso</span>

					<div class="wrap-input100" data-validate = "Se requiere nombre de usuario">
						<input class="input100" type="text" name="user" placeholder="Usuario" required oninvalid="setCustomValidity('Introduzca su Usuario')" oninput="setCustomValidity('')">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1" data-validate="Password es requerido">
						<input class="input100" type="password" name="pass" placeholder="Password" required oninvalid="setCustomValidity('Introduzca la contraseña')" oninput="setCustomValidity('')">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">Acceder</button>
					</div>
					<div class="mensajeError">
					<%
					
						if(!(request.getParameter("usu")==null)){
							
							out.println("Usuario no existe");
													
						}
					
						if(!(request.getParameter("pass")==null)){
						
						out.println("La contraseña no es correcta");
												
						}
										
					%>
					</div>
				</form>
			</div>
		</div>
		<footer id="footer">
			<div style="min-height: 6.6vh; background-color: #46b24b;" >
				<p style="padding-top: 20px; color: white; font-family: Trebuche MS; font-size: 16px">TFG - Diseñado por Jaime Gómez.</p>
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