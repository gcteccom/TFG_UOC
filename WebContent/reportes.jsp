<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.*"%>
<%@page import="tfg_uoc.dao.*"%>
<%@page import="java.util.*"%>

<%
	if (session.getAttribute("usuario") == null) {

		response.sendRedirect("index.jsp");

	}

	Double totalFacturasContado;
	Double totalFacturasCredito;
	Integer totalCantidadContado;
	Integer totalCantidadCredito;
%>

<!doctype html>
<html lang="en">

<head>
   <%@include file="jspf/head.jspf"%>
   <link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

</head>

<body>

				<%
				
				try{
				
					SessionFactory sesion = HibernateUtil.getSessionFactory();
					Session sessionHibernate = sesion.openSession();
					Transaction tx = sessionHibernate.beginTransaction();
					
					SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
				    
				    String fechaActual = sm.format(new Date());
				    					
					String cadena = "SELECT sum(total) FROM Factura f where f.fecha = '" + fechaActual + "' AND f.fechaPago != NULL";
            		
            		totalFacturasContado = (Double)sessionHibernate.createQuery(cadena).uniqueResult();
            		
            		cadena = "SELECT sum(total) FROM Factura f where f.fecha = '" + fechaActual + "' AND f.fechaPago is NULL";
            		
            		totalFacturasCredito = (Double)sessionHibernate.createQuery(cadena).uniqueResult();
            		
					cadena = "SELECT count(idFactura) FROM Factura f where f.fecha = '" + fechaActual + "' AND f.fechaPago != NULL";
            		
            		totalCantidadContado = ((Long)sessionHibernate.createQuery(cadena).uniqueResult()).intValue();
            		
            		cadena = "SELECT count(idFactura) FROM Factura f where f.fecha = '" + fechaActual + "' AND f.fechaPago is NULL";
            		
            		totalCantidadCredito = ((Long)sessionHibernate.createQuery(cadena).uniqueResult()).intValue();
					            		
				
				} catch (Exception e){
					
					e.printStackTrace();
					totalFacturasContado = 0.00;
					totalFacturasCredito = 0.00;
					totalCantidadContado = 0;
					totalCantidadCredito = 0;
					
				}
							
				
				%>

    <div class="wrapper">
       <%@include file="jspf/sidebar.jspf" %>

        <div class="main-panel">
           <%@include file="jspf/nav.jspf" %>

            <div class="content">
            
            	<div class="container-fluid">

					<div class="pull-left" id="graficaVentasDelDia" style="width: 50%; height: 500px;"></div>
					<div class="pull-right" id="graficaCantidadVentasDelDia" style="width: 50%; height: 500px;"></div>
				
					<input type="hidden" id="ventasContado" value="<%=totalFacturasContado %>">
					<input type="hidden" id="ventasCredito" value="<%=totalFacturasCredito %>">
					<input type="hidden" id="cantidadContado" value="<%=totalCantidadContado %>">
					<input type="hidden" id="cantidadCredito" value="<%=totalCantidadCredito %>">
				
				</div>	

            </div>

			
           
        </div>
        
        <%@include file="jspf/footer.jspf" %>
    
    </div>


</body>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Tipo', 'Cantidad en $'],
          ['Contado', parseFloat(document.getElementById('ventasContado').value)],
          ['Credito', parseFloat(document.getElementById('ventasCredito').value)]
         ]);

        var options = {
          title: 'Ventas del dia en $',
        	is3D: true
        };

        var chartVentas = new google.visualization.PieChart(document.getElementById('graficaVentasDelDia'));

        chartVentas.draw(data, options);
        
        var dataCantidad = google.visualization.arrayToDataTable([
            ['Tipo', 'Cantidad de Ventas'],
            ['Contado', parseInt(document.getElementById('cantidadContado').value)],
            ['Credito', parseInt(document.getElementById('cantidadCredito').value)]
           ]);

          var optionsCantidad = {
            title: 'Cantidad de Ventas del dia',
          	is3D: true
          };

          var chartCantidad = new google.visualization.PieChart(document.getElementById('graficaCantidadVentasDelDia'));

          chartCantidad.draw(dataCantidad, optionsCantidad);
      }
    </script>

<%@include file="jspf/scripts.jspf"%>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

</html>
