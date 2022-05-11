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

import Utils.Utils;
import tfg_uoc.dao.Clientes;
import tfg_uoc.dao.HibernateUtil;
import tfg_uoc.dao.Servicio;
import tfg_uoc.dao.Tipousuario;
import tfg_uoc.dao.Usuarioslogin;

/**
 * Servlet implementation class GuardarUsuario
 */
@WebServlet("/GuardarUsuario")
public class GuardarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String nombre = request.getParameter("nombre");
		String usuario = request.getParameter("usuario");
		String pass = request.getParameter("pass");
		String tipo = request.getParameter("tipo");
		int tipoUsuario;
		
		if(tipo.equals("Administrador") || tipo == "Administrador") {
			
			tipoUsuario = 1;
			
		} else {
			
			tipoUsuario = 2;			
			
		} 
		
		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {
 
			Tipousuario tipoUser = (Tipousuario) session.get(Tipousuario.class, tipoUsuario);
			
			Usuarioslogin user = new Usuarioslogin(usuario, tipoUser, nombre, Utils.encriptacionMD5(pass));

			session.save(user);

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
