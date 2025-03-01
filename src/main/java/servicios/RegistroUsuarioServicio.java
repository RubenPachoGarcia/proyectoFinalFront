package servicios;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.RegistroUsuarioDto;

public class RegistroUsuarioServicio {
	
	public boolean registrarUsuario(RegistroUsuarioDto registroUsuarioDto) {
        
		boolean registroExitoso = false;

        try {
            // Configurar la URL de la API para el registro
            URL url = new URL("http://localhost:8099/api/registro/usuario");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json");
            conexion.setDoOutput(true);

            // Convertimos el DTO a JSON
            ObjectMapper mapper = new ObjectMapper();
            String jsonInput = mapper.writeValueAsString(registroUsuarioDto);

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
                System.out.println("ERROR: El correo ya existe.");
            } else {
                System.out.println("ERROR: Código de respuesta no esperado: " + responseCode);
            }
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }

        return registroExitoso;
    }
}