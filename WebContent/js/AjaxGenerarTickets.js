$(document).ready(function() {
	
	$('#buscarClienteGenerarTicket').click(function() {
		
		var formData = {
				'nifCliente' 		: $('#nifClienteGenerarTicket').val(),
		};
		
		var jc = $.alert({
						
			content: function () {
		        var self = this;
		        return $.ajax({
		            url: 'BuscarCliente',
		            dataType: 'json',
		            method: 'get',
		            data : formData
		            
		        }).done(function (response) {
		             
		        	if(response === null){
		        		
		        		self.setContent('Ese cliente no existe');
			            self.setTitle('Intente de nuevo');
			            self.setType('blue');
		        		
		        					        		
		        	} else {
		        		
		        		$('#nifResumen').val($('#nifClienteGenerarTicket').val());
						$('#nifClienteGenerarTicket').prop('disabled', true);
						$('#buscarClienteGenerarTicket').prop('disabled', true);
												
						$('#nombreGenerarTicket').val(response.nombre);
						$('#apellidoGenerarTicket').val(response.apellido);
						$('#fechaGenerarTicket').val(formatDate(response.fecha));
						$('#telefonoGenerarTicket').val(response.telefono);
						$('#movilGenerarTicket').val(response.movil);
						$('#emailGenerarTicket').val(response.email);
																
						$('#limpiarCLienteGenerarTicket').click(function(){
														
							$('#nifClienteGenerarTicket').prop('disabled', false);
							$('#buscarClienteGenerarTicket').prop('disabled', false);
							$('#nifResumen').val('');
							verificaGenerarTicket();
																										
						})
		        		
		        		self.setContent('Cargando datos del cliente');
		        		self.setTitle('Espere');
			            self.setType('green');
			            jc.close();
			            
			            verificaGenerarTicket();
			         		        		       				        				        	
		        	} 
		        				        	
		        	
		        }).fail(function(){
		           
		        	self.setContent('Ese cliente no existe');
		            self.setTitle('Intente de nuevo');
		            self.setType('red');
		        
		        });
		    }
					
		});
					
	});
		
	
	$('#agregarServicioTicket').click(function(){
		
		var y=parseInt((window.screen.height/2)-(600/2));
		var x=parseInt((window.screen.width/2)-(780/2));
			
		window.open("Popups/PopupAgregarServicio.jsp","Agregar Servicio", "width=780, height=600, resizable=no, top="+ y + " ,left=" + x);
		
		
	});
	
	$('#asignarCarruselTicket').click(function(){
		
		var y=parseInt((window.screen.height/2)-(800/2));
		var x=parseInt((window.screen.width/2)-(1200/2));
			
		window.open("Popups/PopupCarrusel.jsp","Asignar Perchas", "width=1200, height=800, resizable=no, top="+ y + " ,left=" + x);
		
		
	});
	
});

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

$('.agregarServicioModal').click(function(){
		
	$contadorIgual = 0; 
	
	$codSeleccionado = $(this).parents("tr").find("td:first").html();
			
	window.opener.$('#cuerpoTabla tr').find('td:eq(1)').each(function(){
	
		if($(this).html() == $codSeleccionado){
			
			$contadorIgual++;
			
		}
		
	})
		
	
	if($contadorIgual>0){
		
		$(this).popover("show"); 
				
	} else {
		
		$indice = 1;
		
		window.opener.$('#cuerpoTabla tr').find('td:eq(0)').each(function(){
			
			$indice++;
			
		})
		
		$('[data-toggle="popover"]').popover("hide");
		
		var $fila = "<tr><td>" + $indice + "</td>";
				
		var $contadorTotal = 0;
		
		var $total = 0;
		
		$(this).parents("tr").find("td").each(function(){
	  
			$fila = $fila + "<td>" + $(this).html() + "</td>";
			
			$contadorTotal++;
			
			if($contadorTotal == 3){
				
				$total = $(this).html();
			}
	  	                
		});
		
		$fila = $fila + "<td><select class='modificarCantidadPrenda' onchange='cambiaTotal(this)'>";
		
		for (var i=1; i<21; i++) {
	  
			$fila = $fila + "<option>" + i + "</option>";
	  
		}
		
		$fila = $fila + "</select></td>";
		
		$fila = $fila + "<td class='montoTotal'>" + $total + "</td>";
		
		$fila = $fila + "<td class='eliminarFila'>Eliminar</td>";
			
		$fila = $fila + "</tr>";
		
		window.opener.$('#cuerpoTabla').append($fila);
		
		$cantidadPrenda = window.opener.$('#prendasResumen').val();
		
		$cantidadPrenda++;
		
		window.opener.$('#prendasResumen').val($cantidadPrenda);
		
		$valorAnterior = window.opener.$('#totalResumen');
		
		$calculaMontoTotal = parseFloat($valorAnterior.val()) + parseFloat($total);
		
		window.opener.$('#totalResumen').val($calculaMontoTotal);
		
		verificaGenerarTicketOpener();
				
	}
	
	
		
});

function cambiaTotal(obj){
	
	var montoTotal = obj.parentNode.previousSibling.innerText;
	
	$total = obj.value * montoTotal;
	
	obj.parentNode.nextSibling.innerText = $total;
	
	verificaGenerarTicket();
		
}

$(document).on('click', '.eliminarFila', function(){
    
	$(this).parents('tr').remove();
	
	$indice = 1;
	
	$('#cuerpoTabla tr').find('td:eq(0)').each(function(){
		
		$(this).text($indice);
				
		$indice++;
		
	})
	
	calculaTotalPrendas();
	calculaTotal();
	verificaGenerarTicket();
	
});

$(document).on('change', '.modificarCantidadPrenda', function(){
	
		calculaTotalPrendas();
		calculaTotal();
		verificaGenerarTicket();
	
});

function calculaTotalPrendas(){
	
	$cantidadPrendas = 0;
	
	$('#cuerpoTabla tr').find('.modificarCantidadPrenda').each(function(){
	
		$cantidadPrendas = $cantidadPrendas + parseInt($(this).val());	
	
	})

	$('#prendasResumen').val($cantidadPrendas);
	
}

function calculaTotal(){
	
	$cantidadTotal = 0;
	
	$('#cuerpoTabla tr').find('.montoTotal').each(function(){
	
		$cantidadTotal = $cantidadTotal + parseFloat($(this).text());	
	
	})

	$('#totalResumen').val($cantidadTotal);
	
	
}

function verificaGenerarTicket(){
		
	$nifResumen = $('#nifResumen').val();
	$prendaResumen = $('#prendasResumen').val();
	$perchasResumen = $('#perchasResumen').val();
	$totalResumen = $('#totalResumen').val();
	
	if(!$nifResumen == ""){
		
		if($prendaResumen == $perchasResumen){
			
			if(parseFloat($totalResumen) > 0){
				
				$('#enviarResumen').removeClass('btn-danger').addClass('btn-primary');
				$('#enviarResumen').removeAttr("disabled");				
			
			} else {
				
				$('#enviarResumen').removeClass('btn-primary').addClass('btn-danger');
				$('#enviarResumen').attr("disabled", "disabled");
				
			}
						
		} else {
			
			$('#enviarResumen').removeClass('btn-primary').addClass('btn-danger');
			$('#enviarResumen').attr("disabled", "disabled");
			
		}
			
	} else {
		
		$('#enviarResumen').removeClass('btn-primary').addClass('btn-danger');
		$('#enviarResumen').attr("disabled", "disabled");
		
	}
	
}

function verificaGenerarTicketOpener(){
	
	$nifResumen = window.opener.$('#nifResumen').val();
	$prendaResumen = window.opener.$('#prendasResumen').val();
	$perchasResumen = window.opener.$('#perchasResumen').val();
	$totalResumen = window.opener.$('#totalResumen').val();
	
	if(!$nifResumen == ""){
		
		if($prendaResumen == $perchasResumen){
			
			if(parseFloat($totalResumen) > 0){
				
				window.opener.$('#enviarResumen').removeClass('btn-danger').addClass('btn-primary');
				window.opener.$('#enviarResumen').removeAttr("disabled");				
			
			} else {
				
				window.opener.$('#enviarResumen').removeClass('btn-primary').addClass('btn-danger');
				window.opener.$('#enviarResumen').attr("disabled", "disabled");
				
			}
						
		} else {
			
			window.opener.$('#enviarResumen').removeClass('btn-primary').addClass('btn-danger');
			window.opener.$('#enviarResumen').attr("disabled", "disabled");
			
		}
			
	} else {
		
		window.opener.$('#enviarResumen').removeClass('btn-primary').addClass('btn-danger');
		window.opener.$('#enviarResumen').attr("disabled", "disabled");
		
	}
	
}
//abre el modal del resumen del ticket
$('#enviarResumen').click(function(){
	//Asignamos el nif al campo del modal
	$('#nifResumenModal').val($('#nifResumen').val());
	//Array para el codigo y nombre de los servicios
	var codServicios = new Array();
	var nombreServicios = new Array();
	//Recuperamos los valores de los codigos de los servicios de la tabla principal
	$('#cuerpoTabla tr').find('td:eq(1)').each(function(){
		
		codServicios.push($(this).html());
		
	});
	//Recuperamos los valores de los nombres de los servicios de la tabla principal
	$('#cuerpoTabla tr').find('td:eq(2)').each(function(){
		
		nombreServicios.push($(this).html());
		
	});
	//Reseteamos las prendas seleccionadas para que no se repitan las opciones en caso que se abra el modal dos veces
	$('#prendasSeleccionadasModal').find('option').each(function(){
		
		$(this).remove();				
		
	})
	$filaServicios = '';
	//Formamos la fila y vamos rellenando con los codigos y nombres de los servicios
	for(var i=0; i < codServicios.length; i++){
		
		$filaServicios = $filaServicios + "<option>" + codServicios[i] + " - " + nombreServicios[i] + "</option>";
		
		
	}
	//Añadimos la fila de servicios al campo del modal
	$('#prendasSeleccionadasModal').append($filaServicios);
	
	//Reseteamos las perchas seleccionadas para que no se repitan las opciones en caso que se abra el modal dos veces
	$('#perchasSeleccionadasModal').find('option').each(function(){
		
		$(this).remove();				
		
	})
	
	$filaPerchas = '';
	//Recorremos las opciones de la seleccion y lo guardamos
	$("#perchasSeleccionadas option").each(function(){
	
		$filaPerchas = $filaPerchas + "<option>" + $(this).text() + "</option>"; 
			
	});
	//Se lo asignamos a la seleccion del modal
	$('#perchasSeleccionadasModal').append($filaPerchas);
	
	//Obtenemos el valor del tipo de pago
	$('#tipoPagoModal').val($('input:radio[name=tipoPago]:checked').val());
	
	//Obtenemos el total de la venta
	$('#totalModal').val($('#totalResumen').val());
	//Reseteamos la devuelta en caso de que tenia un valor anterior
	$('#devueltaModal').val('');
	
	//Si es pago a contado activamos casillas de pago y devuelta
	if($('#tipoPagoModal').val() == 'contado'){
		
		$('#pagadoModal').removeAttr('disabled');
				
	} else {
		
		$('#pagadoModal').attr('disabled', 'disabled');
		$('#pagadoModal').val('');
		$('#devueltaModal').val('');
		
	}
	
})

//Captura evento teclado para calcular la devuelta en caso de pago a contado
$('#pagadoModal').keyup(function(){
	
	$total = $('#totalModal').val();
	$pagado = $('#pagadoModal').val();
	
	if(parseFloat($pagado) >= parseFloat($total)){
	
		$devuelta = parseFloat($pagado) - parseFloat($total);  
		
		$('#devueltaModal').val($devuelta);
		
	} else {
		
		$('#devueltaModal').val('');
		
	}
	
	
		
})

$('#botonGenerarTicketmodal').click(function(){
	
	var codServicios = new Array();
	var perchasAsignadas = new Array();
		
	$('#cuerpoTabla tr').find('td:eq(1)').each(function(){
		
		codServicios.push($(this).html());
		
	});
	
	$('#perchasSeleccionadasModal option').each(function(){
	
		perchasAsignadas.push($(this).html());
		
	})
	
	var jsonServicio = JSON.stringify(codServicios);
	var jsonPerchas = JSON.stringify(perchasAsignadas);
	
	var formData = {
			'nifCliente' 		: $('#nifResumenModal').val(),
			'tipoPago'			: $('#tipoPagoModal').val(),
			'total'				: $('#totalModal').val(),
			'cantidadServicio'	: $('#prendasResumen').val(),
			'codServicio'		: jsonServicio,
			'perchasAsignadas'	: jsonPerchas
						
	};
	
	var jc = $.alert({
		
		onClose: function (){
			
			location.reload(true);
			
		},	
		
		content: function () {
	        var self = this;
	        return $.ajax({
	            url: 'GenerarTicket',
	            method: 'post',
	            data : formData
	            
	        }).done(function (response) {
	             
	        	if(response === null){
	        		
	        		self.setContent('Hubo un problema al generar el Ticket');
		            self.setTitle('Intentelo de nuevo');
		            self.setType('red');
	        		        					        		
	        	} else {
	        		       			        		
	        		self.setContent('Se ha generado correctamente el Ticket No.' + response);
	        		self.setTitle('Correcto');
	        		self.setType('green');
	        				            	        		       				        				        	
	        	} 
	        	        	
	        }).fail(function(){
	           
	        	self.setContent('Contacte con el administrador');
	            self.setTitle('ERROR INESPERADO');
	            self.setType('red');
	        
	        });
	    }
				
	});
		
	
})














