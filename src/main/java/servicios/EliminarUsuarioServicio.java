package servicios;

import java.util.Arrays;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import dtos.EliminarUsuarioDto;

@Service
public class EliminarUsuarioServicio {

    private final String API_URL = "http://localhost:8099/api/administrador";
    private final RestTemplate restTemplate;

    public EliminarUsuarioServicio(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<EliminarUsuarioDto> obtenerUsuarios() {
        try {
            ResponseEntity<EliminarUsuarioDto[]> response = 
                restTemplate.getForEntity(API_URL + "/usuarios", EliminarUsuarioDto[].class);

            System.out.println("Usuarios obtenidos del servicio: " + response.getBody().length);
            
            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                return Arrays.asList(response.getBody());
            }
        } catch (RestClientException e) {
            System.err.println("Error al obtener usuarios: " + e.getMessage());
        }
        return List.of();
    }


    public boolean eliminarUsuario(Long idUsuario) {
        try {
            restTemplate.delete(API_URL + "/eliminar/" + idUsuario);
            System.out.println("Usuario eliminado: " + idUsuario);
            return true;
        } catch (RestClientException e) {
            System.err.println("Error en la eliminación del usuario: " + e.getMessage());
        }
        return false;
    }
}
