package controlador;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import tfg_uoc.dao.Clientes;
import tfg_uoc.dao.Factura;
import tfg_uoc.dao.HibernateUtil;
import tfg_uoc.dao.Perchero;
import tfg_uoc.dao.Servicio;
import tfg_uoc.dao.Upercherofactura;
import tfg_uoc.dao.Userviciofactura;
import tfg_uoc.dao.Usuarioslogin;

/**
 * Servlet implementation class GenerarTicket
 */
@WebServlet("/GenerarTicket")
public class GenerarTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerarTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessionUsuario = request.getSession();
				
		String nifCliente = request.getParameter("nifCliente");
		String tipoPago = request.getParameter("tipoPago");
		Float total = Float.parseFloat(request.getParameter("total"));
		String servicios = request.getParameter("codServicio");
		String perchas = request.getParameter("perchasAsignadas");
		String usuario = (String) sessionUsuario.getAttribute("user");
		Integer cantidadServicios = Integer.parseInt(request.getParameter("cantidadServicio")); 
		
		JsonParser parser = new JsonParser();
		JsonElement servicioElement = parser.parse(servicios);
		JsonArray arrayServicios = servicioElement.getAsJsonArray();
		
		JsonElement perchaElement = parser.parse(perchas);
		JsonArray arrayPerchas = perchaElement.getAsJsonArray();
				
		Date fechaPago = null;
		
		if(tipoPago.equals("contado") || tipoPago == "contado") {
			
			fechaPago = new Date();
		}
				
		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {

			Clientes cliente = (Clientes) session.get(Clientes.class, nifCliente);
			
			Usuarioslogin usuariosLogin = (Usuarioslogin) session.get(Usuarioslogin.class, usuario);
						
			Factura factura = new Factura(cliente, usuariosLogin, new Date(), fechaPago, cantidadServicios, arrayPerchas.size(), total, true);
					
			session.save(factura);
			
			for(int i = 0; i < arrayPerchas.size(); i++) {
				
				Perchero perchero = (Perchero) session.get(Perchero.class, arrayPerchas.get(i).getAsInt());
				perchero.setFactura(factura);
				perchero.setEstado(true);
				session.save(perchero);
				
				Upercherofactura uPercheroFactura = new Upercherofactura(factura, perchero);
				session.save(uPercheroFactura);
								
			}
			
			for(int i = 0; i < arrayServicios.size(); i++) {
				
				Servicio servicio = (Servicio) session.get(Servicio.class, arrayServicios.get(i).getAsInt());
				
				Userviciofactura uServicioFactura = new Userviciofactura(factura, servicio);
				
				session.save(uServicioFactura);
								
			}
												
			tx.commit();
			
			response.setContentType("text/plain");
						
			response.getWriter().write("" + factura.getIdFactura());
						

		} catch (Exception e) {
			
			e.printStackTrace();
			

		} finally {
			
			session.close();
		}
		
	}

}
