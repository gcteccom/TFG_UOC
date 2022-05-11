$(document).ready(function() {
	
	cambiaDisabled(true);

	$('#botonGuardar').click(function() {
		
		var formData = {
				'nif' 		: $('#nifCliente').val(),
				'nombre' 	: $('#nombreCliente').val(),
				'apellido' 	: $('#apellidoCliente').val(),
				'fecha' 	: $('#fechaCliente').val(),
				'telefono' 	: $('#telefonoCliente').val(),
				'movil' 	: $('#movilCliente').val(),
				'direccion' : $('#direccionCliente').val(),
				'poblacion' : $('#poblacionCliente').val(),
				'provincia' : $('#provinciaCliente').val(),
				'email' 	: $('#emailCliente').val()
			};
		var esCorrecto = false;
	
		if($('#nifCliente').val() === ''){
			
			esCorrecto = true;
			$('#nifCliente').css('background-color', '#FF7E62');
				
		}
		
		if($('#nombreCliente').val() === ''){
						
			esCorrecto = true;
			$('#nombreCliente').css('background-color', '#FF7E62');
		
		}
		
		if($('#apellidoCliente').val() === ''){
			
			esCorrecto = true;
			$('#apellidoCliente').css('background-color', '#FF7E62');
			
		}
		
		if(!esCorrecto){
			
			$.alert({
			    content: function () {
			        var self = this;
			        return $.ajax({
			            url: 'GuardarCliente',
			            dataType: 'html',
			            method: 'post',
			            data : formData
			            
			        }).done(function (response) {
			             
			        	if(response ==='OK'){
			        		
			        		self.setContent('Se ha guardado el cliente');
				            self.setTitle('Correcto');
				            self.setType('green');
				            $('#guardarCliente')[0].reset();
			        					        		
			        	} else if (response === 'EXISTE') {
			        		
			        		self.setContent('Ese cliente ya existe');
				            self.setTitle('Error');
				            self.setType('red');
			        		
			        	} else if (response === 'LARGO'){
			        		
			        		self.setContent('El nif es muy largo, maximo 20 caracteres');
				            self.setTitle('Error');
				            self.setType('red');
			        		
			        	}
			        				        	
			        	
			        }).fail(function(){
			           
			        	self.setContent('Contacte con el administrador');
			            self.setTitle('ERROR INESPERADO');
			            self.setType('red');
			        });
			    }
			});
	
		}

	});
	
	$('#buscarCliente').click(function() {
				
		var formData = {
				'nifCliente' 		: $('#nifClienteModificar').val(),
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
		        		
						$('#nifClienteModificar').prop('disabled', true);
						$('#buscarCliente').prop('disabled', true);
						cambiaDisabled(false);
						
						$('#nombreClienteModificar').val(response.nombre);
						$('#apellidoClienteModificar').val(response.apellido);
						$('#fechaClienteModificar').val(formatDate(response.fecha));
						$('#telefonoClienteModificar').val(response.telefono);
						$('#movilClienteModificar').val(response.movil);
						$('#direccionClienteModificar').val(response.direccion);
						$('#poblacionClienteModificar').val(response.poblacion);
						$('#provinciaClienteModificar').val(response.provincia);
						$('#emailClienteModificar').val(response.email);
										
						$('#limpiarModificar').click(function(){
							
							$('#modificarCliente')[0].reset();
							$('#nifClienteModificar').prop('disabled', false);
							$('#buscarCliente').prop('disabled', false);
							resetColorInput();
							cambiaDisabled(true);
																			
						})
		        		
		        		self.setContent('Cargando datos del cliente');
		        		self.setTitle('Espere');
			            self.setType('green');
			            jc.close();
			         		        		       				        				        	
		        	} 
		        				        	
		        	
		        }).fail(function(){
		           
		        	self.setContent('Contacte con el administrador');
		            self.setTitle('ERROR INESPERADO');
		            self.setType('red');
		        
		        });
		    }
					
		});
			
	});
	
	$('#botonModificarCliente').click(function() {
		
		var formData = {
				'nif' 		: $('#nifClienteModificar').val(),
				'nombre' 	: $('#nombreClienteModificar').val(),
				'apellido' 	: $('#apellidoClienteModificar').val(),
				'fecha' 	: $('#fechaClienteModificar').val(),
				'telefono' 	: $('#telefonoClienteModificar').val(),
				'movil' 	: $('#movilClienteModificar').val(),
				'direccion' : $('#direccionClienteModificar').val(),
				'poblacion' : $('#poblacionClienteModificar').val(),
				'provincia' : $('#provinciaClienteModificar').val(),
				'email' 	: $('#emailClienteModificar').val()
			};
		
		var esCorrecto = false;
	
		if($('#nombreClienteModificar').val() === ''){
						
			esCorrecto = true;
			$('#nombreClienteModificar').css('background-color', '#FF7E62');
		
		}
		
		if($('#apellidoClienteModificar').val() === ''){
			
			esCorrecto = true;
			$('#apellidoClienteModificar').css('background-color', '#FF7E62');
			
		}
		
		if(!esCorrecto){
			
			$.alert({
			    content: function () {
			        var self = this;
			        return $.ajax({
			            url: 'ModificarCliente',
			            dataType: 'html',
			            method: 'POST',
			            data : formData
			            
			        }).done(function (response) {
			            
			        	if(response === 'OK'){
			        		
			        		self.setContent('Se ha modificado correctamente el cliente');
				            self.setTitle('Correcto');
				            self.setType('green');
							$('#modificarCliente')[0].reset();
							$('#nifClienteModificar').prop('disabled', false);
							$('#buscarCliente').prop('disabled', false);
							cambiaDisabled(true);
			        					        		
			        	} else {
			        		
			        		self.setContent('Ha surgido un error al actualizar el cliente');
				            self.setTitle('Error');
				            self.setType('red');
			        		
			        	} 
			        				        	
			        }).fail(function(){
			           
			        	self.setContent('Contacte con el administrador');
			            self.setTitle('ERROR INESPERADO');
			            self.setType('red');
			       
			        });
			    }
			});

		}

	});
	
	$('#botonEliminarCliente').click(function() {
		
		$.confirm({
		    title: 'Eliminar',
		    content: '&iquest;Seguro que quiere eliminar este cliente?',
		    type:	'red',
		    buttons: {
		        Ok: function () {
		        	
		        	var formData = {
		        			
		        			'nif' 		: $('#nifClienteModificar').val(),
					
		        	};
		           
		        	$.alert({
					    content: function () {
					        var self = this;
					        return $.ajax({
					            url: 'EliminarCliente',
					            dataType: 'html',
					            method: 'POST',
					            data : formData
					            
					        }).done(function (response) {
					            
					        	if(response === 'OK'){
					        		
					        		self.setContent('Se ha eliminado correctamente el cliente');
						            self.setTitle('Correcto');
						            self.setType('green');
									$('#modificarCliente')[0].reset();
									$('#nifClienteModificar').prop('disabled', false);
									$('#buscarCliente').prop('disabled', false);
									cambiaDisabled(true);
					        					        		
					        	} else {
					        		
					        		self.setContent('Ha surgido un error al eliminar el cliente');
						            self.setTitle('Error');
						            self.setType('red');
					        		
					        	} 
					        				        	
					        }).fail(function(){
					           
					        	self.setContent('Contacte con el administrador');
					            self.setTitle('ERROR INESPERADO');
					            self.setType('red');
					       
					        });
					    }
					});
		        
		        },
		        
		        cancel: function () {
		           
		        }

		    }
		});
		
	});
		
});

function cambiaColor(objeto, color){
	
	$("#" + objeto).css('background-color', color);
	
}

function resetColorInput(){
	
	$('#nifCliente').css('background-color', 'white');
	$('#nombreCliente').css('background-color', 'white');
	$('#apellidoCliente').css('background-color', 'white');
	$('#nifClienteModificar').css('background-color', 'white');
	$('#nombreClienteModificar').css('background-color', 'white');
	$('#apellidoClienteModificar').css('background-color', 'white');
	
}

function cambiaDisabled(propiedad){
	
	$('#nombreClienteModificar').prop('disabled', propiedad);
	$('#apellidoClienteModificar').prop('disabled', propiedad);
	$('#fechaClienteModificar').prop('disabled', propiedad);
	$('#telefonoClienteModificar').prop('disabled', propiedad);
	$('#movilClienteModificar').prop('disabled', propiedad);
	$('#direccionClienteModificar').prop('disabled', propiedad);
	$('#poblacionClienteModificar').prop('disabled', propiedad);
	$('#provinciaClienteModificar').prop('disabled', propiedad);
	$('#emailClienteModificar').prop('disabled', propiedad);
	$('#limpiarModificar').prop('disabled', propiedad);
	$('#botonModificarCliente').prop('disabled', propiedad);
	$('#botonEliminarCliente').prop('disabled', propiedad);
		
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}






