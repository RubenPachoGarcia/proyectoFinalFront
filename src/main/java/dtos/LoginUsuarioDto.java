package dtos;

/**
 * Clase DTO para representar los datos de un usuario al momento de iniciar sesión.
 * Este objeto se utiliza para enviar y recibir los datos de inicio de sesión a través de la API.
 */
public class LoginUsuarioDto {

	//Atributos
	
    private long idUsuario;
    private String nombreCompletoUsuario;
    private String correoUsuario;
    private String contraseniaUsuario;
    private String esAdmin;
    
    // Getters y Setters
    
    public long getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(long idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getnombreCompletoUsuario() {
		return nombreCompletoUsuario;
	}
	public void setnombreCompletoUsuario(String nombreCompletoUsuario) {
		this.nombreCompletoUsuario = nombreCompletoUsuario;
	}
	public String getCorreoUsuario() {
		return correoUsuario;
	}
	public void setCorreoUsuario(String correoUsuario) {
		this.correoUsuario = correoUsuario;
	}
	public String getContraseniaUsuario() {
		return contraseniaUsuario;
	}
	public void setContraseniaUsuario(String contraseniaUsuario) {
		this.contraseniaUsuario = contraseniaUsuario;
	}
	public String getEsAdmin() {
		return esAdmin;
	}
	public void setEsAdmin(String esAdmin) {
		this.esAdmin = esAdmin;
	}

}   