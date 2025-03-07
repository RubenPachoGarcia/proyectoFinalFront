package servicios;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.RegistroUsuarioDto;

/**
 * Servicio encargado de registrar un usuario en la base de datos.
 */
public class RegistroUsuarioServicio {

    /**
     * Registra un nuevo usuario en el sistema.
     * Realiza una solicitud HTTP POST a la API para registrar el usuario con los datos del DTO proporcionado.
     * Si el registro es exitoso, devuelve true. Si el correo electrónico ya está registrado, devuelve false.
     * @param registroUsuarioDto El DTO con los datos del usuario a registrar.
     * @return true si el usuario se registra correctamente, false en caso de error o conflicto (correo duplicado).
     */
    public boolean registrarUsuario(RegistroUsuarioDto registroUsuarioDto) {

        boolean registroExitoso = false;

        try {
            URL url = new URL("http://localhost:8099/api/registro/usuario");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json");
            conexion.setDoOutput(true);

            ObjectMapper mapper = new ObjectMapper();
            String jsonInput = mapper.writeValueAsString(registroUsuarioDto);

            try (OutputStream os = conexion.getOutputStream()) {
                os.write(jsonInput.getBytes());
                os.flush();
            }

            int responseCode = conexion.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_CREATED) { // 201 Created
                registroExitoso = true;
            } else if (responseCode == HttpURLConnection.HTTP_CONFLICT) { // 409 Conflict
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