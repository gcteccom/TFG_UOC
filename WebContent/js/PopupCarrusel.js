$(document).ready(function(){
	
	$cantidadPrendas = window.opener.$('#prendasResumen');
	
	$('#cantidadServiciosCarrusel').val($cantidadPrendas.val());
	
	$('#aceptarPerchasCarrusel').click(function(){
	
		$cantidadServicios = $('#cantidadServiciosCarrusel').val();
		$cantidadPerchas = $('#cantidadPerchasCarrusel').val();
		
		
		if($cantidadServicios == $cantidadPerchas){
			
			$(this).popover("destroy");
			
			window.opener.$('#perchasResumen').val($cantidadPerchas);
			
			//En caso de que ya haya seleccion reseteamos para que no agregue demas
			window.opener.$('#perchasSeleccionadas').find('option').each(function(){
				
				$(this).remove();				
				
			})
			
			$perchasSeleccionadas = "";
			
			$('.imagenSeleccionCarrusel').find('img').each(function(){
				
				if($(this).attr("src") == "../images/elegido.jpg"){
					
					$perchasSeleccionadas = $perchasSeleccionadas + "<option>" + $(this).siblings('.textoImagen').html() + "</option>";  
										
				}
				
			})
			
			window.opener.$('#perchasSeleccionadas').append($perchasSeleccionadas);
			
			verificaGenerarTicket();
			
			window.close();
						
			
		} else {
			
			
			$(this).popover("show");
		
		}
		
		
		
	})
	
	
	
		
	
})

$(document).on('click', '.imagenSeleccionCarrusel', function(){
	
	$('[data-toggle="popoverCarrusel"]').popover("hide");
	
	if($(this).find('img').attr('src') == "../images/disponible.jpg"){
		
		$(this).find('img').attr("src","../images/elegido.jpg");
		
		$perchasActuales = $('#cantidadPerchasCarrusel').val();
		
		$perchasActuales++;
		
		$('#cantidadPerchasCarrusel').val($perchasActuales++);
		
			
	} else {
		
		$(this).find('img').attr("src","../images/disponible.jpg");
		
		$perchasActuales = $('#cantidadPerchasCarrusel').val();
		
		$perchasActuales--;
		
		$('#cantidadPerchasCarrusel').val($perchasActuales++);
		
	}
	
});

function verificaGenerarTicket(){
	
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