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
import tfg_uoc.dao.Factura;
import tfg_uoc.dao.HibernateUtil;
import vo.SalidaTicket;

/**
 * Servlet implementation class BuscarTicket
 */
@WebServlet("/BuscarTicket")
public class BuscarTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarTicket() {
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
	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		Integer ticket = Integer.parseInt(request.getParameter("numeroTicket"));
		
		SessionFactory sesion = HibernateUtil.getSessionFactory();
		Session session = sesion.openSession();
		Transaction tx = session.beginTransaction();
		
		try {

			Factura factura = (Factura) session.get(Factura.class, ticket);
			
			SalidaTicket salidaTicket = Utils.facturaToSalidaTicket(factura);
												
			tx.commit();
			
			Gson gson = new Gson();
			
			response.getWriter().write(gson.toJson(salidaTicket));
						

		} catch (NumberFormatException e) {
			
			response = null;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			response = null;
			

		}finally {
			
			session.close();
		}
		
		
	}

}
