package servicios;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.LoginUsuarioDto;

public class LoginUsuarioServicio {
	 private String esAdmin = "";
	 
	 public boolean verificarUsuario(String correoUsuario, String contraseniaUsuario) {
	        boolean correcto = false;

	        try {
	            // URL de la API para la verificación
	            URL url = new URL("http://localhost:8099/api/login/usuario");
	            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
	            conexion.setRequestMethod("POST");
	            conexion.setRequestProperty("Content-Type", "application/json");
	            conexion.setDoOutput(true);

	            // DTO con las credenciales del usuario
	            LoginUsuarioDto loginUsuario = new LoginUsuarioDto();
	            loginUsuario.setCorreoUsuario(correoUsuario);
	            loginUsuario.setContraseniaUsuario(contraseniaUsuario);

	            // Convertimos el DTO a JSON
	            ObjectMapper mapper = new ObjectMapper();
	            String jsonInput = mapper.writeValueAsString(loginUsuario);

	            // Enviar solicitud al servidor
	            try (OutputStream ot = conexion.getOutputStream()) {
	                ot.write(jsonInput.getBytes());
	                ot.flush();
	            }

	            // Procesar la respuesta del servidor
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
	 public String getEsAdmin() {
	        return esAdmin;
	    }
}