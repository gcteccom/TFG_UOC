$(document).ready(function(){
	
	$('#imagenUsuario').click(function(){
		
		var y=parseInt((window.screen.height/2)-(600/2));
		var x=parseInt((window.screen.width/2)-(780/2));
			
		window.open("Popups/PopupUsuario.jsp","Gestion de Usuario", "width=780, height=600, resizable=no, top="+ y + " ,left=" + x);
		
		
	});
	
	
	
});