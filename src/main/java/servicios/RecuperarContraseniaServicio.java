package servicios;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;
import dtos.RecuperarContraseniaDto;

public class RecuperarContraseniaServicio {

	public boolean solicitarRecuperacion(String correoUsuario) {
		boolean enviado = false;

		try {
			// URL de la API para la solicitud de recuperación
			URL url = new URL("http://localhost:8099/api/recuperar/solicitar");
			HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
			conexion.setRequestMethod("POST");
			conexion.setRequestProperty("Content-Type", "application/json");
			conexion.setDoOutput(true);

			// DTO con el correo del usuario
			RecuperarContraseniaDto correoDto = new RecuperarContraseniaDto();
			correoDto.setCorreoUsuario(correoUsuario);

			// Convertimos el DTO a JSON
			ObjectMapper mapper = new ObjectMapper();
			String jsonInput = mapper.writeValueAsString(correoDto);

			// Enviar solicitud al servidor
			try (OutputStream ot = conexion.getOutputStream()) {
				ot.write(jsonInput.getBytes());
				ot.flush();
			}

			// Procesar la respuesta del servidor

			// Obtener el código de respuesta HTTP
			int responseCode = conexion.getResponseCode();
			// Obtener el mensaje asociado al código de respuesta
			String responseMessage = conexion.getResponseMessage();

			// Manejar el código de respuesta y el mensaje
			if (responseCode == HttpURLConnection.HTTP_OK) {
				// Respuesta exitosa
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
				// Si la respuesta no es 200 OK, manejamos el código y el mensaje de error
				if (responseMessage == null) {
					System.out.println("ERROR: Código de respuesta fallido: " + responseCode + ": (sin mensaje)");
				} else {
					System.out.println("ERROR: Código de respuesta fallido: " + responseCode + ": " + responseMessage);
				}
			}

		} catch (Exception e) {
			// En caso de excepción, imprimimos el mensaje y la traza
			System.out.println("ERROR: " + e.getMessage());
			e.printStackTrace();
		}

		return enviado;
	}
}