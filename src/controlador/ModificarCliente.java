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

import com.google.gson.Gson;

import Utils.Utils;
import tfg_uoc.dao.Clientes;
import tfg_uoc.dao.HibernateUtil;

/**
 * Servlet implementation class ModificarCliente
 */
@WebServlet("/ModificarCliente")
public class ModificarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarCliente() {
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
		String nif = request.getParameter("nif");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String fecha = request.getParameter("fecha");
		String telefono = request.getParameter("telefono");
		String movil = request.getParameter("movil");
		String direccion = request.getParameter("direccion");
		String poblacion = request.getParameter("poblacion");
		String provincia = request.getParameter("provincia");
		String email = request.getParameter("email");

		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {

			Clientes cliente = new Clientes(nif, nombre, apellido, Utils.stringToDate(fecha), telefono, movil,direccion, poblacion, provincia, email);
					
			session.update(cliente);
						
			tx.commit();
			
			response.getWriter().write("OK");
		
		} catch (Exception e) {
			
			e.printStackTrace();
			

		} finally {
			
			session.close();
		}
		
		
	}

}
