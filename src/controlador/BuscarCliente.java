package controlador;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.google.gson.Gson;

import tfg_uoc.dao.Clientes;
import tfg_uoc.dao.HibernateUtil;

/**
 * Servlet implementation class BuscarCliente
 */
@WebServlet("/BuscarCliente")
public class BuscarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String nif = request.getParameter("nifCliente");
		
		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {

			Clientes cliente = (Clientes) session.get(Clientes.class, nif);
			
			if(!(cliente.getFecha() == null || cliente.getFecha().equals(null))) {
				
				cliente.setFecha(Utils.Utils.stringToDate(new SimpleDateFormat("yyyy-MM-dd").format(cliente.getFecha())));
			
			}
						
					
			Gson gson = new Gson();
									
			tx.commit();
			
			response.getWriter().write(gson.toJson(cliente));
						

		} catch (Exception e) {
			
			e.printStackTrace();
			

		} finally {
			
			session.close();
		}
		
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
