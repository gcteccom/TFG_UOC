package vo;

public class Usuario {
	
	public String nombre;
	public String tipoAcceso;
	
	public Usuario(String nombre, String tipoAcceso) {
		super();
		this.nombre = nombre;
		this.tipoAcceso = tipoAcceso;
	}

	public String getNombre() {
		return nombre;
	}

	public String getTipoAcceso() {
		return tipoAcceso;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setTipoAcceso(String tipoAcceso) {
		this.tipoAcceso = tipoAcceso;
	}
	
}
