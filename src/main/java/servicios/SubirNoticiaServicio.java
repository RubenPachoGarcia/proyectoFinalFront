package servicios;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.SubirNoticiaDto;

public class SubirNoticiaServicio {

    /**
     * Envía una noticia a la API para guardarla en la base de datos.
     *
     * @param subirNoticiaDto Objeto que contiene la información de la noticia.
     * @param sessionId       ID de la sesión para autenticación en la API.
     * @return true si se guarda correctamente, false en caso contrario.
     */
    public boolean registrarNoticia(SubirNoticiaDto subirNoticiaDto) {
    	
    	boolean registroExitoso = false;

        try {
            // Configurar la URL de la API para la subida registro
            URL url = new URL("http://localhost:8099/api/noticias/recibir");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json");
            conexion.setDoOutput(true);

            // Convertimos el DTO a JSON
            ObjectMapper mapper = new ObjectMapper();
            String jsonInput = mapper.writeValueAsString(subirNoticiaDto);

            // Enviar la solicitud al servidor
            try (OutputStream os = conexion.getOutputStream()) {
                os.write(jsonInput.getBytes());
                os.flush();
            }

            // Obtener código de respuesta
            int responseCode = conexion.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_CREATED) { // 201 Created
                // Si el usuario se creó sin problema
                registroExitoso = true;
            } else if (responseCode == HttpURLConnection.HTTP_CONFLICT) { // 409 Conflict
                // Si hubo un problema
                System.out.println("ERROR");
            } else {
                System.out.println("ERROR: Código de respuesta no esperado: " + responseCode);
            }
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }

        return registroExitoso;

		/*
		 * try { // Crear la conexión HTTP URL url = new
		 * URL("http://localhost:8099/api/noticias/recibir"); HttpURLConnection conexion
		 * = (HttpURLConnection) url.openConnection();
		 * conexion.setRequestMethod("POST");
		 * conexion.setRequestProperty("Content-Type", "application/json");
		 * conexion.setRequestProperty("Cookie", "JSESSIONID=" + sessionId); // Enviar
		 * JSESSIONID conexion.setDoOutput(true);
		 * 
		 * // Convertir el objeto NoticiaDto a JSON ObjectMapper objectMapper = new
		 * ObjectMapper(); String jsonInputString =
		 * objectMapper.writeValueAsString(subirNoticiaDto);
		 * 
		 * // Enviar la solicitud con los datos de la noticia try (OutputStream os =
		 * conexion.getOutputStream()) { byte[] input =
		 * jsonInputString.getBytes("utf-8"); os.write(input, 0, input.length); }
		 * 
		 * // Leer la respuesta del servidor int codigoRespuesta =
		 * conexion.getResponseCode(); return codigoRespuesta ==
		 * HttpURLConnection.HTTP_CREATED;
		 * 
		 * } catch (Exception e) { e.printStackTrace(); return false; }
		 */
    }
}
