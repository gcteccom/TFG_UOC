package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import Utils.*;
import tfg_uoc.dao.HibernateUtil;
import tfg_uoc.dao.Usuarioslogin;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sesionUsuario;

		try {

			String usu, pass;
			usu = request.getParameter("user");
			pass = Utils.encriptacionMD5(request.getParameter("pass"));

			SessionFactory sesion = HibernateUtil.getSessionFactory();
			Session session = sesion.openSession();
			Transaction tx = session.beginTransaction();

			Usuarioslogin usuariosLogin = (Usuarioslogin) session.get(Usuarioslogin.class, usu);

			if (!(usuariosLogin.getUsuario() == null || usuariosLogin.getUsuario().equals(""))) {

				sesionUsuario = request.getSession();

				if (usu.equals(usuariosLogin.getUsuario()) && pass.equals(usuariosLogin.getPass()) && sesionUsuario.getAttribute("usuario") == null) {

					// si coincide usuario y password y además no hay sesión iniciada
					sesionUsuario.setAttribute("usuario", usuariosLogin.getNombre());
					sesionUsuario.setAttribute("user", usuariosLogin.getUsuario());
					sesionUsuario.setAttribute("acceso", usuariosLogin.getTipousuario().getDescripcion());
					sesionUsuario.setAttribute("tipoAcceso", usuariosLogin.getTipousuario().getIdTipo());
					// redirijo a página con información de login exitoso
					tx.commit();
					response.sendRedirect("generarTicket.jsp");
				
				} else {
					
					sesionUsuario.invalidate();
					response.sendRedirect("index.jsp?pass=nulo");
				
				}

			} 

		} catch (NullPointerException e) {
						
			response.sendRedirect("index.jsp?usu=nulo");
		
		} 
	}

}
