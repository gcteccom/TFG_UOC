package tfg_uoc.dao;
// Generated 23-mar-2018 19:41:08 by Hibernate Tools 5.2.6.Final

/**
 * Perchero generated by hbm2java
 */
@SuppressWarnings("serial")
public class Perchero implements java.io.Serializable {

	private Integer idPerchero;
	private Factura factura;
	private boolean estado;
	

	public Perchero() {
	}

	public Perchero(boolean estado) {
		this.estado = estado;
	}

	public Perchero(Integer id, Factura factura, boolean estado) {
		this.idPerchero = id;
		this.factura = factura;
		this.estado = estado;
		
	}

	public Integer getIdPerchero() {
		return this.idPerchero;
	}

	public void setIdPerchero(Integer id) {
		this.idPerchero = id;
	}

	public Factura getFactura() {
		return this.factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

	public boolean isEstado() {
		return this.estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

}
