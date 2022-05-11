package Utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import tfg_uoc.dao.Factura;
import vo.SalidaTicket;

public class Utils {

	public static String encriptacionMD5(String textoPlano) {

		try {

			final char[] HEXADECIMALES = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e',
					'f' };

			MessageDigest msgdgt = MessageDigest.getInstance("MD5");
			byte[] bytes = msgdgt.digest(textoPlano.getBytes());
			StringBuilder strCryptMD5 = new StringBuilder(2 * bytes.length);
			for (int i = 0; i < bytes.length; i++) {

				int low = (int) (bytes[i] & 0x0f);
				int high = (int) ((bytes[i] & 0xf0) >> 4);
				strCryptMD5.append(HEXADECIMALES[high]);
				strCryptMD5.append(HEXADECIMALES[low]);

			}

			return strCryptMD5.toString();

		} catch (NoSuchAlgorithmException e) {

			return null;

		}

	}

	public static double WIDTH;

	public static double HEIGHT;

	public static double BALANCE_ANCHO = 13.71;

	public static double BALANCE_ALTO = 10.8;

	public static Date stringToDate(String cadena) {

		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		
		Date fechaDate = null;
		
		try {
			fechaDate = formato.parse(cadena);
		
		} catch (Exception ex) {
		
			System.out.println(ex);
		
		}
		
		return fechaDate;

	}
	
	public static SalidaTicket facturaToSalidaTicket(Factura factura) {
		
		SalidaTicket salidaTicket = new SalidaTicket();
		
		salidaTicket.setNifCliente(factura.getClientes().getDni());
		salidaTicket.setNombreCliente(factura.getClientes().getNombre());
		salidaTicket.setApellidoCliente(factura.getClientes().getApellido());
		salidaTicket.setFecha(factura.getFecha());
		salidaTicket.setFechaPago(factura.getFechaPago());
		salidaTicket.setFechaEntrega(factura.getFechaEntrega());
		salidaTicket.setCantidadServicios(factura.getPrendas());
		salidaTicket.setCantidadPrendas(factura.getPerchas());
		salidaTicket.setTotalFactura(factura.getTotal());
				
		if(factura.isEstado()) {
			
			if(salidaTicket.getFechaPago() == null) {
				
				salidaTicket.setEstado("Ticket pendiente de Pago");
				
			} else if (salidaTicket.getFechaEntrega() == null) {
						
				salidaTicket.setEstado("Ticket pendiente de Entrega");
			
			} else {
				
				salidaTicket.setEstado("Ticket no esta correctamente gestionado");
				
			}
		
		} else {
			
			salidaTicket.setEstado("Ticket gestionado");
		}
				
		
		return salidaTicket;
		
		
	}

}
