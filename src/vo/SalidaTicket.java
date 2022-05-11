package vo;

import java.util.Date;

@SuppressWarnings("serial")
public class SalidaTicket implements java.io.Serializable {
	
	private String nifCliente;
	private String nombreCliente;
	private String apellidoCliente;
	private Date fecha;
	private Date fechaPago;
	private Date fechaEntrega;
	private Integer cantidadServicios;
	private Integer cantidadPrendas;
	private Float totalFactura;
	private String estado;
	
	public SalidaTicket(String nifCliente, String nombreCliente, String apellidoCliente, Date fecha, Date fechaPago,
			Date fechaEntrega, Integer cantidadServicios, Integer cantidadPrendas, Float totalFactura, String estado) {
		super();
		this.nifCliente = nifCliente;
		this.nombreCliente = nombreCliente;
		this.apellidoCliente = apellidoCliente;
		this.fecha = fecha;
		this.fechaPago = fechaPago;
		this.fechaEntrega = fechaEntrega;
		this.cantidadServicios = cantidadServicios;
		this.cantidadPrendas = cantidadPrendas;
		this.totalFactura = totalFactura;
		this.estado = estado;
	}

	public SalidaTicket() {
		
		this.nifCliente = "";
		this.nombreCliente = "";
		this.apellidoCliente = "";
		this.fecha = null;
		this.fechaPago = null;
		this.fechaEntrega = null;
		this.cantidadServicios = 0;
		this.cantidadPrendas = 0;
		this.totalFactura = (float) 0;
		this.estado = "";
		
	}

	public String getNifCliente() {
		return nifCliente;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public String getApellidoCliente() {
		return apellidoCliente;
	}

	public Date getFecha() {
		return fecha;
	}

	public Date getFechaPago() {
		return fechaPago;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public Integer getCantidadServicios() {
		return cantidadServicios;
	}

	public Integer getCantidadPrendas() {
		return cantidadPrendas;
	}

	public Float getTotalFactura() {
		return totalFactura;
	}

	public String isEstado() {
		return estado;
	}

	public void setNifCliente(String nifCliente) {
		this.nifCliente = nifCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public void setApellidoCliente(String apellidoCliente) {
		this.apellidoCliente = apellidoCliente;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public void setCantidadServicios(Integer cantidadServicios) {
		this.cantidadServicios = cantidadServicios;
	}

	public void setCantidadPrendas(Integer cantidadPrendas) {
		this.cantidadPrendas = cantidadPrendas;
	}

	public void setTotalFactura(Float totalFactura) {
		this.totalFactura = totalFactura;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
