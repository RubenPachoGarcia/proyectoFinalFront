package servicios;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.SubirNoticiaDto;

/**
 * Servicio encargado de registrar una noticia en la base de datos.
 */
public class SubirNoticiaServicio {

    /**
     * Envía una noticia a la API para guardarla en la base de datos.
     * Realiza una solicitud HTTP POST al servidor para almacenar la noticia.
     * Si la noticia se guarda correctamente, devuelve true. En caso contrario, devuelve false.
     * @param subirNoticiaDto Objeto que contiene la información de la noticia a registrar.
     * @return true si la noticia se guarda correctamente, false en caso contrario.
     */
    public boolean registrarNoticia(SubirNoticiaDto subirNoticiaDto) {
    	
    	boolean registroExitoso = false;

        try {
            URL url = new URL("http://localhost:8099/api/noticias/recibir");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json");
            conexion.setDoOutput(true);

            ObjectMapper mapper = new ObjectMapper();
            String jsonInput = mapper.writeValueAsString(subirNoticiaDto);

            try (OutputStream os = conexion.getOutputStream()) {
                os.write(jsonInput.getBytes());
                os.flush();
            }

            int responseCode = conexion.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_CREATED) { 
                registroExitoso = true;
            } else if (responseCode == HttpURLConnection.HTTP_CONFLICT) { 
                System.out.println("ERROR: Conflicto al guardar la noticia.");
            } else {
                System.out.println("ERROR: Código de respuesta no esperado: " + responseCode);
            }
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }

        return registroExitoso;
    }
}
