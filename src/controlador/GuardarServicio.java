package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.DataException;

import tfg_uoc.dao.HibernateUtil;
import tfg_uoc.dao.Servicio;

/**
 * Servlet implementation class GuardarServicio
 */
@WebServlet("/GuardarServicio")
public class GuardarServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarServicio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String desc = request.getParameter("desc");
		String precio = request.getParameter("precio");
		
		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {

			Servicio servicio = new Servicio(desc, Float.parseFloat(precio));

			session.save(servicio);

			tx.commit();
			
			response.getWriter().write("OK");

		} catch (ConstraintViolationException e) {
			
			response.getWriter().write("EXISTE");
			

		} catch (DataException e){
			
			response.getWriter().write("LARGO");
			
		}
				
		finally {
			
			session.close();
		}
				
	}

}
