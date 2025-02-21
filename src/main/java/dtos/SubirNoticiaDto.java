package dtos;

public class SubirNoticiaDto {

    private long idNoticia;
    private String titularNoticia;
    // Foto como un array de bytes
    private byte[] fotoNoticia;
    private String categoriaNoticia;
    private long idUsuarioNoticia;

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
