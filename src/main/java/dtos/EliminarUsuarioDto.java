package dtos;

public class EliminarUsuarioDto {
    
	private Long idUsuario;
    
	private String nombreCompletoUsuario;
    
	private String correoUsuario;

    public Long getIdUsuario() { return idUsuario; }
    public void setIdUsuario(Long idUsuario) { this.idUsuario = idUsuario; }

    public String getNombreCompletoUsuario() { return nombreCompletoUsuario; }
    public void setNombreCompletoUsuario(String nombreCompletoUsuario) { this.nombreCompletoUsuario = nombreCompletoUsuario; }

    public String getCorreoUsuario() { return correoUsuario; }
    public void setCorreoUsuario(String correoUsuario) { this.correoUsuario = correoUsuario; }
}