$(document).ready(function() {
	
	$("#botonNuevoServicio").click(function(){
		$.confirm({
		    title: 'Agregar Servicio',
		    type: 'blue',
		    content: '' +
		    '<form action="" class="formName">' +
		    '<div class="form-group">' +
		    '<label>Descripcion</label>' +
		    '<input type="text" class="desc form-control" required />' +
		    '<label>Precio</label>' +
		    '<input type="number" class="precio form-control" required min="0" step=".05" placeholder="0.00" />' +
		    '</div>' +
		    '</form>',
		    buttons: {
		        formSubmit: {
		            text: 'Guardar',
		            btnClass: 'btn-blue',
		            action: function () {
		                var desc = this.$content.find('.desc').val();
		                var precio = this.$content.find('.precio').val();
		                if(!desc){
		                    $.alert('Ingrese una descripcion del servicio');
		                    return false;
		                }
		                if(!precio){
		                    $.alert('Ingrese precio valido para el servicio');
		                    return false;
		                }
		                
		                var formData = {
		        				'desc' 		: desc,
		        				'precio' 	: precio
		        				
		        		};
		                
		    			$.alert({
		    			    content: function () {
		    			        var self = this;
		    			        return $.ajax({
		    			            url: 'GuardarServicio',
		    			            dataType: 'html',
		    			            method: 'post',
		    			            data : formData
		    			            
		    			        }).done(function (response) {
		    			             
		    			        	if(response ==='OK'){
		    			        		
		    			        		self.setContent('Se ha guardado el servicio');
		    				            self.setTitle('Correcto');
		    				            self.setType('green');
		    				            location.reload();
		    				            		    			        					        		
		    			        	} else if (response === 'EXISTE') {
		    			        		
		    			        		self.setContent('Ese servicio ya existe');
		    				            self.setTitle('Error');
		    				            self.setType('red');
		    			        		
		    			        	} else if (response === 'LARGO'){
		    			        		
		    			        		self.setContent('La descripcion del servicio es muy largo, maximo 50 caracteres');
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
		        },
		        cancel: function () {
		            // close
		        },
		    },

		});
    });

	
	$(".botonServicioModificar").click(function(){
		 
        var valores= new Array();
        var contador = 0;

        // Obtenemos todos los valores contenidos en los <td> de la fila
		// seleccionada
        
        $(this).parents("tr").find("td").each(function(){
            
            valores[contador] = $(this).html();
            contador++;
                    
        });
                	
    		$.confirm({
    		    title: 'Modificar Servicio',
    		    type: 'blue',
    		    content: '' +
    		    '<form action="" class="formName">' +
    		    '<div class="form-group">' +
    		    '<label>Descripcion</label>' +
    		    '<input type="text" class="desc form-control" required placeholder="' + valores[1] + '"/>' +
    		    '<label>Precio</label>' +
    		    '<input type="number" class="precio form-control" required min="0" step=".05" placeholder="' + valores[2] + '"/>' +
    		    '</div>' +
    		    '</form>',
    		    buttons: {
    		        formSubmit: {
    		            text: 'Modificar',
    		            btnClass: 'btn-blue',
    		            action: function () {
    		                var desc = this.$content.find('.desc').val();
    		                var precio = this.$content.find('.precio').val();
    		                if(!desc){
    		                    $.alert('Ingrese una descripcion del servicio');
    		                    return false;
    		                }
    		                if(!precio){
    		                    $.alert('Ingrese precio valido para el servicio');
    		                    return false;
    		                }
    		                
    		                var formData = {
    		        				'id' 			: valores[0],
    		        				'descripcion' 	: this.$content.find('.desc').val(),
    		        				'precio'	 	: this.$content.find('.precio').val()
    		        		};
    		                
    		    			$.alert({
    		    				onClose: function (){
    		    					
    		    					location.reload();
    		    					
    		    				},	
    		    				content: function () {
    		    			        var self = this;
    		    			        return $.ajax({
    		    			            url: 'ModificarServicio',
    		    			            dataType: 'html',
    		    			            method: 'post',
    		    			            data : formData
    		    			            
    		    			        	}).done(function (response) {
    		    			             
    		    			        		if(response ==='OK'){
    		    			        		
	    		    			        		self.setContent('Se ha modificado correctamente el servicio');
	    		    				            self.setTitle('Correcto');
	    		    				            self.setType('green');
    		    				               		    				            		    			        					        		
    		    			        		} else if (response === 'LARGO'){
    		    			        		
	    		    			        		self.setContent('La descripcion del servicio es muy largo, maximo 50 caracteres');
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
    		        },
    		        
    		        cancel: function () {
    		            // close
    		        },
    		    },

    		});
    		                    
    });
	
	
	$(".botonServicioEliminar").click(function(){
		 
        var valores= new Array();
        var contador = 0;

        // Obtenemos todos los valores contenidos en los <td> de la fila
		// seleccionada
        
        $(this).parents("tr").find("td").each(function(){
            
            valores[contador] = $(this).html();
            contador++;
                    
        });
                	
    		$.confirm({
    		    title: 'Eliminar Servicio',
    		    type: 'red',
    		    content: '&iquest;Seguro que quiere eliminar este servicio?',
    		    buttons: {
    		        Ok: function() {
    		        	
    		        	var formData = {
		        				'id' 			: valores[0]
		        				
		        		};
    		            
    		            $.alert({
    		    		
    		            	onClose: function (){
    		    					
    		    				location.reload();
    		    					
    		    			},	
    		    			content: function () {
    		    		        var self = this;
    		    		        return $.ajax({
    		    		            url: 'EliminarServicio',
    		    		            dataType: 'html',
    		    		            method: 'post',
    		    		            data : formData
    		    			            
    		    		        	}).done(function (response) {
    		    			             
    		    		        		if(response ==='OK'){
    		    			        		
	    		    		        		self.setContent('Se ha eliminado correctamente el servicio');
	    		    			            self.setTitle('Correcto');
	    		    			            self.setType('green');
    		    				               		    				            		    			        					        		
    		    		        		} else {
    		    		        			
    		    		        			self.setContent('Este servicio no puede ser borrado, verifique si esta asignado a un ticket activo. Si no es asi, contacte con el administrador del sistema.');
	    		    			            self.setTitle('Informacion');
	    		    			            self.setType('blue');
    		    		        			
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
    		 				// close
    		 			},
    		
    		
    		        },
    		        
    		       
    		    
    		});
    		                    
    
	});
		
	
});
