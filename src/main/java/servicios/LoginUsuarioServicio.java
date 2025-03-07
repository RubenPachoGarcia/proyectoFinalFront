package servicios;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.LoginUsuarioDto;

/**
 * Servicio encargado de gestionar el proceso de login de un usuario.
 */
public class LoginUsuarioServicio {

    private static final String API_URL = "http://localhost:8099/api/usuarios/id";
    
    private String esAdmin = "";

    /**
     * Verifica las credenciales de un usuario en la API.
     * Realiza una solicitud POST a la API para verificar el correo y la contraseña del usuario.
     * Si la verificación es exitosa, se almacena si el usuario tiene rol de administrador o no.
     * @param correoUsuario El correo del usuario.
     * @param contraseniaUsuario La contraseña del usuario.
     * @return true si las credenciales son correctas, false en caso contrario.
     */
    public boolean verificarUsuario(String correoUsuario, String contraseniaUsuario) {
        boolean correcto = false;

        try {
            URL url = new URL("http://localhost:8099/api/login/usuario");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json");
            conexion.setDoOutput(true);

            LoginUsuarioDto loginUsuario = new LoginUsuarioDto();
            loginUsuario.setCorreoUsuario(correoUsuario);
            loginUsuario.setContraseniaUsuario(contraseniaUsuario);

            ObjectMapper mapper = new ObjectMapper();
            String jsonInput = mapper.writeValueAsString(loginUsuario);

            try (OutputStream ot = conexion.getOutputStream()) {
                ot.write(jsonInput.getBytes());
                ot.flush();
            }

            int responseCode = conexion.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conexion.getInputStream()))) {
                    StringBuilder response = new StringBuilder();
                    String inputLine;
                    while ((inputLine = br.readLine()) != null) {
                        response.append(inputLine);
                    }

                    String respuesta = response.toString();
                    System.out.println("Respuesta del servidor: " + respuesta);

                    if ("true".equals(respuesta) || "false".equals(respuesta)) {
                        this.esAdmin = respuesta;
                        correcto = true;
                    } else {
                        System.out.println("Rol desconocido o error de respuesta.");
                    }
                }
            } else {
                System.out.println("ERROR: Código de respuesta fallido: " + responseCode);
            }

        } catch (Exception e) {
            System.out.println("ERROR: " + e);
            e.printStackTrace();
        }

        return correcto;
    }

    /**
     * Obtiene si el usuario tiene el rol de administrador.
     * @return El valor de la variable `esAdmin` que indica si el usuario es admin.
     */
    public String getEsAdmin() {
        return esAdmin;
    }

    /**
     * Obtiene el ID de un usuario a través de la API, usando el correo y la contraseña.
     * Realiza una solicitud GET a la API para obtener el ID del usuario que corresponde a las credenciales proporcionadas.
     * @param correoUsuario El correo del usuario.
     * @param contraseniaUsuario La contraseña del usuario.
     * @return El ID del usuario, o null si ocurre un error.
     */
    public Long obtenerIdUsuario(String correoUsuario, String contraseniaUsuario) {
        try {
            String query = String.format("correoUsuario=%s&contraseniaUsuario=%s", 
                    URLEncoder.encode(correoUsuario, "UTF-8"), 
                    URLEncoder.encode(contraseniaUsuario, "UTF-8"));
            URL url = new URL(API_URL + "?" + query);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "text/plain");

            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                System.out.println("Error: HTTP code " + connection.getResponseCode());
                return null;
            }

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String response = reader.readLine();
            reader.close();

            return Long.parseLong(response.trim());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
