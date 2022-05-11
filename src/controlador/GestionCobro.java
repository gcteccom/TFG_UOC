package controlador;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.DataException;

import tfg_uoc.dao.Factura;
import tfg_uoc.dao.HibernateUtil;
import tfg_uoc.dao.Servicio;

/**
 * Servlet implementation class GestionCobro
 */
@WebServlet("/GestionCobro")
public class GestionCobro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionCobro() {
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

			factura.setFechaPago(new Date());
			
			session.update(factura);

			tx.commit();
			
			response.getWriter().write("OK");

		} catch (Exception e){
			
			response.getWriter().write("ERROR");
			
		}
				
		finally {
			
			session.close();
		}
	}

}
