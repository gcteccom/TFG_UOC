<%@page import="Utils.Utils"%>
<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="vo.*"%>

<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}

	String numTicket = request.getParameter("salidaTicket");
	Integer numeroTicket = 0;
	boolean noExiste = false;
	
	SalidaTicket salidaTicket = new SalidaTicket(); 
		
	if(!(numTicket == "" || numTicket == null)){
		
		numeroTicket = Integer.parseInt(numTicket);
	
	} 
		
	SessionFactory sesion = HibernateUtil.getSessionFactory();
	Session sessionHibernate = sesion.openSession();
	Transaction tx = sessionHibernate.beginTransaction();
	
	Factura factura = (Factura) sessionHibernate.get(Factura.class, numeroTicket);
	
	if(!(factura == null || factura.equals(null))){
		
		salidaTicket = Utils.facturaToSalidaTicket(factura);
	
	}  else if (numeroTicket != 0){
		
		noExiste = true;
		
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
      <%@include file="jspf/sidebar.jspf" %>

        <div class="main-panel">
            <%@include file="jspf/nav.jspf" %>

            <div class="content">
            
            	<h6>Informacion del Ticket</h6>
            
            	<div id="areaSalidaTicket" class="container">
            	
            		<form method="get">

						<div class="row">

							<div class="form-group col-xs-2">
								<label for="salidaTicket">Ticket No.:</label> 
								<input type="text" id="salidaTicket" name="salidaTicket" onkeypress="return valida(event)" class="form-control" <%if(factura != null){%>disabled<%} %> value="<%if(numeroTicket!=0){out.print(numeroTicket);} %>">
							</div>

							<div class="form-group col-xs-2">
								<button type="submit" id="buscarSalidaTicket" class="btn btn-primary posicionBotonesTicket">Buscar</button>
								<button type="reset" id="limpiarSalidaTicket" class="btn btn-info posicionBotonesTicket">Limpiar</button>
								<button type="button" id="buscarTicketAuxiliar" class="btn btn-default posicionBotonesTicket">...</button>
							</div>

							<div class="form-group col-xs-2">
								<label for="nifSalidaTicket">NIF:</label> 
								<input type="text" class="form-control" id="nifSalidaTicket" value="<%=salidaTicket.getNifCliente() %>" disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="nombreSalidaTicket">Nombre:</label> 
								<input type="text" class="form-control" id="nombreSalidaTicket" value="<%=salidaTicket.getNombreCliente() %>" disabled>
							</div>
							
							<div class="form-group col-xs-2">
								<label for="apellidoSalidaTicket">Apellidos:</label> 
								<input type="text" class="form-control" id="apellidoSalidaTicket" value="<%=salidaTicket.getApellidoCliente() %>" disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="fechaSalidaTicket">Fecha Ticket:</label> 
								<input type="date" class="form-control" id="fechaSalidaTicket" value="<%=salidaTicket.getFecha() %>" disabled>
							</div>
							
						</div>
						
						<%
							if(noExiste){%>
								
									<div class="alert alert-danger">
								  		<strong>Error!</strong> El numero de Ticket no existe o ya esta gestionado, verifique en el historico de tickets si existe.
									</div>		
								
						<% 
							}
						%>
						
						<div class="row">
							
							<div class="form-group col-xs-2">
								<label for="fechaPagoTicket">Fecha Pago:</label> 
								<input type="date" class="form-control" id="fechaPagoTicket" value="<%=salidaTicket.getFechaPago() %>" disabled>
							</div>
							
							<div class="form-group col-xs-2">
								<label for="fechaEntregaTicket">Fecha Entrega:</label> 
								<input type="date" class="form-control" id="fechaEntregaTicket" value="<%=salidaTicket.getFechaEntrega() %>" disabled>
							</div>

							<div class="form-group col-xs-2">
								<label for="cantidadServicios">Cantidad de Servicios:</label> 
								<input type="text" class="form-control" id="cantidadServicios" value="<%=salidaTicket.getCantidadServicios() %>" disabled>
							</div>
							
							<div class="form-group col-xs-2">
								<label for="cantidadPrendas">Cantidad de Prendas:</label> 
								<input type="text" class="form-control" id="cantidadPrendas" value="<%=salidaTicket.getCantidadPrendas() %>" disabled>
							</div>
							
							<div class="form-group col-xs-2">
								<label for="TotalSalidaTicket">Total:</label> 
								<input type="text" class="form-control" id="TotalSalidaTicket" value="<%=salidaTicket.getTotalFactura() %>" disabled>
							</div>
							
							<div class="form-group col-xs-2">
								<label for="estadoTicket">Estado:</label> 
								<input type="text" class="form-control" id="estadoTicket" value="<%=salidaTicket.isEstado() %>" disabled>
							</div>

						</div>
						
					</form>
            	
            	
            	</div>
            	
            	<h6>Detalles</h6>
            	
            	<div class="container-fluid contenedorSalidaCentrales">
            		
	            	<div id="areaSalidaServicios" class="col-md-6 contenedorSalidaCentrales">
	            	
	            		<% 
	            			            		
	            			String cadena = "SELECT u FROM Userviciofactura u where u.factura=" + numeroTicket;
	            		
		            		Query query = sessionHibernate.createQuery(cadena);
							List<Userviciofactura> uServicioFacturas = query.list();
						
						%>
						    
	            		<h6>Servicios</h6>
	            		
	            		<select multiple class="form-control" id="seleccionServicios">
	            		
	            		<% 
							for (Userviciofactura uServicioFactura : uServicioFacturas){
	            		            		
	            		%>
	            			<option><%=uServicioFactura.getServicio().getIdServicio() + " - " +  uServicioFactura.getServicio().getDescripcion()%></option>
	            		
	            		
	            		<%}  %>
							
						</select>
						
	            	
	            	</div>
	            	
	            	<div id="areaSalidaCarrusel" class="col-md-6 contenedorSalidaCentrales">
	            	
	            		<% 
	            			            		
	            			cadena = "SELECT up FROM Upercherofactura up where up.factura=" + numeroTicket;
	            		
		            		query = sessionHibernate.createQuery(cadena);
							List<Upercherofactura> uPercheroFacturas = query.list();
						
						%>
	            	
						<h6>Carrusel</h6>
						
						<% 
							for (Upercherofactura uPercheroFactura : uPercheroFacturas){
	            		            		
	            		%>
	            			<div class="contenedorImagen">
								<img src="images/ocupado.jpg" class="img-thumbnail">
								<div class="textoImagen"><%=uPercheroFactura.getPerchero().getIdPerchero() %></div>
							</div>
	            		
	            		
	            		<%}  
	            		
	            			tx.commit();
	            		
	            		%>
	            	
	            	</div>
            	
            	</div>
            	
            	<h6>Acciones</h6>
            	
            	<div id="areaResumenSalidaTicket" class="container">
            	
            			<%
            			
            				boolean estadoCobrar = true;
            				boolean estadoEntregar = true;
            				
            				if(salidaTicket.getFecha() == null || salidaTicket.getFechaPago() != null){
            					
            					estadoCobrar = false;
            					
            				}
            				
							if(salidaTicket.getFechaPago() == null || salidaTicket.getFechaEntrega() != null){
            					
            					estadoEntregar = false;
            					
            				}
            			
            			
            			
            			%>
            	               		
            			<button type="button" id="cobrarTicket" class="btn <%if(estadoCobrar){%>btn-primary<%}else{%>btn-danger<%} %> btn-lg" <%if(!estadoCobrar){%> disabled <%} %>>Cobrar</button>
            			<button type="button" id="entregarTicket" class="btn <%if(estadoEntregar){%>btn-primary<%}else{%>btn-danger<%} %> btn-lg" <%if(!estadoEntregar){%> disabled <%} %>>Entregar</button>
            		
            	</div>
            
            </div>

        </div>
        
        <%@include file="jspf/footer.jspf" %>
    
    </div>


</body>

<%@include file="jspf/scripts.jspf"%>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src="js/AjaxSalidaTicket.js"></script>

</html>
