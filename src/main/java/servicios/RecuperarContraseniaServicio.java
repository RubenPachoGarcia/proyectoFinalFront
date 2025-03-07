package servicios;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.databind.ObjectMapper;

import dtos.RecuperarContraseniaDto;

/**
 * Servicio encargado de gestionar la solicitud de recuperación de contraseña para un usuario.
 */
public class RecuperarContraseniaServicio {

    /**
     * Solicita la recuperación de contraseña enviando un correo al usuario.
     * Realiza una solicitud POST a la API de recuperación, pasando el correo del usuario como parámetro.
     * Si la solicitud es exitosa y el correo ha sido enviado, devuelve true.
     * @param correoUsuario El correo del usuario que solicita la recuperación de contraseña.
     * @return true si el correo de recuperación fue enviado correctamente, false en caso contrario.
     */
    public boolean solicitarRecuperacion(String correoUsuario) {
        boolean enviado = false;

        try {
            URL url = new URL("http://localhost:8099/api/recuperar/solicitar");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json");
            conexion.setDoOutput(true);

            RecuperarContraseniaDto correoDto = new RecuperarContraseniaDto();
            correoDto.setCorreoUsuario(correoUsuario);

            ObjectMapper mapper = new ObjectMapper();
            String jsonInput = mapper.writeValueAsString(correoDto);

            try (OutputStream ot = conexion.getOutputStream()) {
                ot.write(jsonInput.getBytes());
                ot.flush();
            }

            int responseCode = conexion.getResponseCode();
            String responseMessage = conexion.getResponseMessage();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conexion.getInputStream()))) {
                    StringBuilder response = new StringBuilder();
                    String inputLine;
                    while ((inputLine = br.readLine()) != null) {
                        response.append(inputLine);
                    }

                    String respuesta = response.toString();
                    System.out.println("Respuesta del servidor: " + respuesta);

                    if (respuesta.contains("Correo de recuperación enviado")) {
                        enviado = true;
                    }
                }
            } else {
                if (responseMessage == null) {
                    System.out.println("ERROR: Código de respuesta fallido: " + responseCode + ": (sin mensaje)");
                } else {
                    System.out.println("ERROR: Código de respuesta fallido: " + responseCode + ": " + responseMessage);
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            e.printStackTrace();
        }

        return enviado;
    }
}
