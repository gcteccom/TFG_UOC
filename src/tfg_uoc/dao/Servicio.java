package tfg_uoc.dao;
// Generated 23-mar-2018 19:41:08 by Hibernate Tools 5.2.6.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Servicio generated by hbm2java
 */
@SuppressWarnings("serial")
public class Servicio implements java.io.Serializable {

	private int idServicio;
	private String descripcion;
	private float precio;
	@SuppressWarnings("rawtypes")
	private Set<?> userviciofacturas = new HashSet(0);

	public Servicio() {
	}

	public Servicio(String descripcion, float precio) {
		
		this.descripcion = descripcion;
		this.precio = precio;
	}
	
	public Servicio(int id, String descripcion, float precio, Set<?> userviciofacturas) {
		this.idServicio = id;
		this.descripcion = descripcion;
		this.precio = precio;
		this.userviciofacturas = userviciofacturas;
	}

	public int getIdServicio() {
		return this.idServicio;
	}

	public void setIdServicio(int id) {
		this.idServicio = id;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public float getPrecio() {
		return this.precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public Set<?> getUserviciofacturas() {
		return this.userviciofacturas;
	}

	public void setUserviciofacturas(Set<?> userviciofacturas) {
		this.userviciofacturas = userviciofacturas;
	}

}
