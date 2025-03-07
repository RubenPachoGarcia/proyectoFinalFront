package servicios;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import dtos.EliminarUsuarioDto;

/**
 * Servicio que gestiona las operaciones relacionadas con la eliminación de usuarios.
 */
@Service
public class EliminarUsuarioServicio {

    private final RestTemplate restTemplate;
    private final String API_URL = "http://localhost:8099/api/usuarios";

    /**
     * Constructor que inicializa el servicio con el objeto RestTemplate.
     * @param restTemplate El objeto RestTemplate utilizado para hacer solicitudes HTTP.
     */
    public EliminarUsuarioServicio(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    /**
     * Método que obtiene la lista de usuarios desde la API externa.
     * Realiza una solicitud GET a la API para recuperar todos los usuarios disponibles.
     * Si la solicitud es exitosa, devuelve una lista de objetos {@link EliminarUsuarioDto}.
     * Si ocurre un error, devuelve una lista vacía.
     * @return Lista de usuarios obtenidos desde la API. Si hay un error, se retorna una lista vacía.
     */
    public List<EliminarUsuarioDto> obtenerUsuarios() {
        try {
            EliminarUsuarioDto[] listaUsuarios = restTemplate.getForObject(API_URL + "/lista",
                    EliminarUsuarioDto[].class); 
            if (listaUsuarios != null) {
                System.out.println("Usuarios obtenidos en el servicio de la capa web: " + Arrays.toString(listaUsuarios));
            }
            return (listaUsuarios != null) ? Arrays.asList(listaUsuarios) : Collections.emptyList();
        } catch (HttpClientErrorException e) {
            System.err.println("Error al obtener usuarios: " + e.getMessage());
            return Collections.emptyList(); 
        }
    }

    /**
     * Método que elimina un usuario de la base de datos mediante la API.
     * Realiza una solicitud DELETE a la API externa para eliminar un usuario.
     * Si ocurre un error, se captura y se muestra un mensaje de error.
     * @param correoUsuario El correo electrónico del usuario a eliminar.
     */
    public void eliminarUsuario(String correoUsuario) {
        try {
            restTemplate.delete(API_URL + "/eliminar?correoUsuario=" + correoUsuario);
        } catch (HttpClientErrorException e) {
            System.err.println("Error al eliminar usuario: " + e.getMessage());
        }
    }
}