package dtos;

/**
 * Clase que representa los datos del registro de noticia.
 */
public class SubirNoticiaDto {

	/** Atributos del registro de noticia*/
	private long idNoticia;
	private String titularNoticia;
	private byte[] fotoNoticia;
	private String categoriaNoticia;
	private long idUsuarioNoticia;

	/** Getters y setters
	 * Get-lectura
	 * Set-escritura */
	public long getIdNoticia() {
		return idNoticia;
	}

	public void setIdNoticia(long idNoticia) {
		this.idNoticia = idNoticia;
	}

	public String getTitularNoticia() {
		return titularNoticia;
	}

	public void setTitularNoticia(String titularNoticia) {
		this.titularNoticia = titularNoticia;
	}

	public byte[] getFotoNoticia() {
		return fotoNoticia;
	}

	public void setFotoNoticia(byte[] fotoNoticia) {
		this.fotoNoticia = fotoNoticia;
	}

	public String getCategoriaNoticia() {
		return categoriaNoticia;
	}

	public void setCategoriaNoticia(String categoriaNoticia) {
		this.categoriaNoticia = categoriaNoticia;
	}

	public long getIdUsuarioNoticia() {
		return idUsuarioNoticia;
	}

	public void setIdUsuarioNoticia(long idUsuarioNoticia) {
		this.idUsuarioNoticia = idUsuarioNoticia;
	}
}
