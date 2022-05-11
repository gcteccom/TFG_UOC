$(document).ready(function(){
	
	$('#botonGuardar').click(function(){
		
		var formData = {
				'nombre' 		: $('#nombreUsuario').val(),
				'usuario'	 	: $('#idUsuario').val(),
				'pass'	 		: $('#passUsuario').val(),
				'tipo' 			: $('#accesoUsuario').val(),
				
			};
		
		var esCorrecto = false;
	
		if($('#nombreUsuario').val() === ''){
			esCorrecto = true;
			$('#nombreUsuario').css('background-color', '#FF7E62');
				
		}
		
		if($('#idUsuario').val() === ''){
						
			esCorrecto = true;
			$('#idUsuario').css('background-color', '#FF7E62');
		
		}
		
		if($('#passUsuario').val() === ''){
			
			esCorrecto = true;
			$('#passUsuario').css('background-color', '#FF7E62');
			
		}
		
		if($('#passUsuarioRepetir').val() === ''){
			
			esCorrecto = true;
			$('#passUsuarioRepetir').css('background-color', '#FF7E62');
			
		}
		
		if($('#passUsuario').val() != $('#passUsuarioRepetir').val()){
			
			esCorrecto = true;
			$('#passUsuario').css('background-color', '#FF7E62');
			$('#passUsuarioRepetir').css('background-color', '#FF7E62');
			
		}
		
		if(!esCorrecto){
			
			$.alert({
				onClose: function (){
					
					location.reload();
					
				},	
				content: function () {
			        var self = this;
			        return $.ajax({
			            url: '../GuardarUsuario',
			            dataType: 'html',
			            method: 'post',
			            data : formData
			            
			        }).done(function (response) {
			             
			        	if(response ==='OK'){
			        		
			        		self.setContent('Se ha guardado el usuario');
				            self.setTitle('Correcto');
				            self.setType('green');
				            			        					        		
			        	} else if (response === 'EXISTE') {
			        		
			        		self.setContent('Ese usuario ya existe');
				            self.setTitle('Error');
				            self.setType('red');
			        		
			        	} else if (response === 'LARGO'){
			        		
			        		self.setContent('Los datos son muy largos');
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
	
	$('#listaUsuarios').change(function(){
		
		var formData = {
				'usuario' 		: $('#listaUsuarios').val(),
		};
		
		if($('#listaUsuarios').val() != ''){
		
			var jc = $.alert({
						
				content: function () {
			        var self = this;
			        return $.ajax({
			            url: '../BuscarUsuario',
			            dataType: 'json',
			            method: 'get',
			            data : formData
			            
			        }).done(function (response) {
			             
			        	if(response === null){
			        		
			        		self.setContent('Error al recuperar los datos');
				            self.setTitle('Intente de nuevo');
				            self.setType('red');
			        			        					        		
			        	} else {
			        		
							$('#nombreUsuarioModificar').val(response.nombre);
							$('#tipoUsuarioModificar').val(response.tipoAcceso);
							$('#botonEliminarUsuario').prop('disabled', false);
									        		
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
				
		} else {
			
			$('#nombreUsuarioModificar').val('');
			$('#tipoUsuarioModificar').val('');
			$('#botonEliminarUsuario').prop('disabled', true);
						
		}
		
	});
	
	$('#botonEliminarUsuario').click(function() {
		
		$.confirm({
		    title: 'Eliminar',
		    content: '&iquest;Seguro que quiere eliminar este usuario?',
		    type:	'red',
		    buttons: {
		        Ok: function () {
		        	
		        	var formData = {
		        			
		        			'usuario' 		: $('#listaUsuarios').val(),
					
		        	};
		           
		        	$.alert({
		        		onClose: function (){
	    					
	    					location.reload();
	    					
	    				},	
					    content: function () {
					        var self = this;
					        return $.ajax({
					            url: '../EliminarUsuario',
					            dataType: 'html',
					            method: 'POST',
					            data : formData
					            
					        }).done(function (response) {
					            
					        	if(response === 'OK'){
					        		
					        		self.setContent('Se ha eliminado correctamente el usuario');
						            self.setTitle('Correcto');
						            self.setType('green');
						            														        					        		
					        	} else {
					        		
					        		self.setContent('Ha surgido un error al eliminar el usuario');
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
	
	$('#nombreUsuario').css('background-color', 'white');
	$('#idUsuario').css('background-color', 'white');
	$('#passUsuario').css('background-color', 'white');
	$('#passUsuarioRepetir').css('background-color', 'white');
		
}