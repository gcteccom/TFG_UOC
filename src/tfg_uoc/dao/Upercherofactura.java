package tfg_uoc.dao;
// Generated 23-mar-2018 19:41:08 by Hibernate Tools 5.2.6.Final

/**
 * Upercherofactura generated by hbm2java
 */
public class Upercherofactura implements java.io.Serializable {

	private Integer id;
	private Factura factura;
	private Perchero perchero;

	public Upercherofactura() {
	}

	public Upercherofactura(Factura factura, Perchero perchero) {
		this.factura = factura;
		this.perchero = perchero;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Factura getFactura() {
		return this.factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

	public Perchero getPerchero() {
		return this.perchero;
	}

	public void setPerchero(Perchero perchero) {
		this.perchero = perchero;
	}

}