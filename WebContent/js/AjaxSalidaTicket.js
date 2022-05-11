$(document).ready(function() {
	
	$('#cobrarTicket').click(function(){
		                        	
    		$.confirm({
    		    title: 'Cobrar',
    		    type: 'blue',
    		    content: '' +
    		    '<form action="" class="formName">' +
    		    '<div class="form-group">' +
    		    '<label>Cantidad a cobrar</label>' +
    		    '<input type="text" class="desc form-control" disabled value="' + $('#TotalSalidaTicket').val() + '"/>' +
    		    '<label>Pagado</label>' +
    		    '<input type="number" class="pagado form-control" required min="0" step=".05"/>' +
    		    '<label>Devuelta</label>' +
    		    '<input type="number" class="devuelta form-control" disabled required min="0" step=".05"/>' +
    		    '</div>' +
    		    '</form>',
    		    buttons: {
    		        formSubmit: {
    		            text: 'Cobrar',
    		            btnClass: 'btn-blue',
    		            action: function () {
    		                    		                
    		                var formData = {
    		        				'idFactura'			: $('#salidaTicket').val(),
    		        				
    		        		};
    		                
    		    			$.alert({
    		    				onClose: function (){
    		    					
    		    					location.reload(true);
    		    					
    		    				},	
    		    				content: function () {
    		    			        var self = this;
    		    			        return $.ajax({
    		    			            url: 'GestionCobro',
    		    			            dataType: 'html',
    		    			            method: 'post',
    		    			            data : formData
    		    			            
    		    			        	}).done(function (response) {
    		    			             
    		    			        		if(response ==='OK'){
    		    			        		
	    		    			        		self.setContent('Se ha cobrado correctamente el ticket');
	    		    				            self.setTitle('Correcto');
	    		    				            self.setType('green');
    		    				               		    				            		    			        					        		
    		    			        		} else if (response === 'ERROR'){
    		    			        		
	    		    			        		self.setContent('Error al realizar el pago');
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
		
	})
	
	$('#entregarTicket').click(function() {
		
		$.confirm({
		    title: 'Entregar',
		    content: '&iquest;Confirma entrega al cliente?',
		    type:	'blue',
		    buttons: {
		        Ok: function () {
		        	
		        	var formData = {
		        			
		        			'idFactura' 		: $('#salidaTicket').val(),
					
		        	};
		           
		        	$.alert({
		        		onClose: function (){
	    					
	    					location.reload(true);
	    					
	    				},	
					    content: function () {
					        var self = this;
					        return $.ajax({
					            url: 'EntregarTicket',
					            dataType: 'html',
					            method: 'POST',
					            data : formData
					            
					        }).done(function (response) {
					            
					        	if(response === 'OK'){
					        		
					        		self.setContent('Se ha entregado correctamente');
						            self.setTitle('Informacion');
						            self.setType('green');
					        		
					        					        		
					        	} else {
					        		
					        		self.setContent('Ha surgido un error al hacer la entrega');
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
	
	$('#limpiarSalidaTicket').click(function(){
	
		location.href = "salidaTicket.jsp";
			
	})
	
	$('#buscarTicketAuxiliar').click(function(){
		
		var y=parseInt((window.screen.height/2)-(700/2));
		var x=parseInt((window.screen.width/2)-(900/2));
			
		window.open("Popups/PopupAgregarTicket.jsp","Agregar Ticket", "width=900, height=700, resizable=no, top="+ y + " ,left=" + x);
				
	})
	
	

	
});

$(document).on('keyup', '.pagado', function(){
    
	$totalDevuelta = $('.pagado').val() -  $('#TotalSalidaTicket').val();
	
	$('.devuelta').val($totalDevuelta);
	
});

$('.agregarTicketModal').click(function(){

	$codSeleccionado = $(this).parents("tr").find("td:first").html();
	
	window.opener.location.href = "../salidaTicket.jsp?salidaTicket=" + $codSeleccionado;
	
	window.close();
		
	
})



function formatDate(date) {
    var auxDate = new Date(date),
        month = '' + (auxDate.getMonth() + 1),
        day = '' + auxDate.getDate(),
        year = auxDate.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

function valida(e){
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar, siempre la permite
    if (tecla==8){
        return true;
    }
    
    if (tecla==13){
        return true;
    }
        
    // Patron de entrada, en este caso solo acepta numeros
    patron =/[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}