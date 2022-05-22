package controlador;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import tfg_uoc.dao.Factura;
import tfg_uoc.dao.HibernateUtil;
import tfg_uoc.dao.Perchero;


/**
 * Servlet implementation class EntregarTicket
 */
@WebServlet("/EntregarTicket")
public class EntregarTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntregarTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idFactura = request.getParameter("idFactura");
		
		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {

			Factura factura = (Factura) session.get(Factura.class, Integer.parseInt(idFactura));
					
			factura.setFechaEntrega(new Date());
			factura.setEstado(false);
			
			session.update(factura);
			
			String sql = "SELECT p FROM Perchero p where p.factura=" + idFactura;
			
			Query query = session.createQuery(sql);
    		@SuppressWarnings("unchecked")
			List<Perchero> percheros = query.list();
    		
    		for (Perchero perchero : percheros){
    			    			
    			perchero.setEstado(false);
    			perchero.setFactura(null);
    			session.update(perchero);
    			
    		}
												
			tx.commit();
			
			response.getWriter().write("OK");
						

		} catch (Exception e) {
			
			e.printStackTrace();
		
		} finally {
			
			session.close();
		}
		
	}

}
