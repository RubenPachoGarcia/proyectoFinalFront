package controladores;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpSession;
import dtos.EliminarUsuarioDto;
import servicios.EliminarUsuarioServicio;

/**
 * Controlador para la gestión de usuarios en la aplicación.
 * Los métodos en este controlador están protegidos para que solo los administradores puedan acceder
 * a las funcionalidades de listado y eliminación.
 */
@Controller
@RequestMapping("/usuarios")
public class EliminarUsuarioControlador {

    private static final Logger logger = LoggerFactory.getLogger(EliminarUsuarioControlador.class);
    private final EliminarUsuarioServicio eliminarUsuarioServicio;

    /**
     * Constructor para la inyección de dependencias del servicio de eliminación de usuarios.
     * @param eliminarUsuarioServicio Servicio para manejar las operaciones de eliminación de usuarios.
     */
    public EliminarUsuarioControlador(EliminarUsuarioServicio eliminarUsuarioServicio) {
        this.eliminarUsuarioServicio = eliminarUsuarioServicio;
    }

    /**
     * Obtiene la lista de usuarios en formato JSON.
     * Este método es accesible solo para administradores. Si el usuario no es un administrador,
     * se devuelve una lista vacía.
     * @param session La sesión HTTP del usuario actual.
     * @return Una lista de objetos {@link EliminarUsuarioDto} en formato JSON.
     */
    @GetMapping("/api/lista")
    @ResponseBody
    public List<EliminarUsuarioDto> obtenerUsuariosJson(HttpSession session) {
        String esAdmin = (String) session.getAttribute("esAdmin");

        // Verifica si el usuario es un administrador
        if (esAdmin == null || !esAdmin.equals("true")) {
            logger.warn("Intento de acceso no autorizado");
            return List.of(); // Retorna lista vacía si no es admin
        }

        try {
            List<EliminarUsuarioDto> listaUsuarios = eliminarUsuarioServicio.obtenerUsuarios();
            return listaUsuarios;
        } catch (Exception e) {
            logger.error("Error al obtener usuarios", e);
            return List.of(); // Evita errores en el cliente
        }
    }

    /**
     * Muestra el dashboard de administración de usuarios.
     * Este método solo es accesible para administradores. Si el usuario no es un administrador,
     * será redirigido a otra página.
     * @param session La sesión HTTP del usuario actual.
     * @return Un objeto {@link ModelAndView} que renderiza la vista del dashboard o redirige en caso de no ser administrador.
     */
    @GetMapping("/eliminarUsuario")
    public ModelAndView adminSupremoDashboard(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        String esAdmin = (String) session.getAttribute("esAdmin");

        // Verifica si el usuario tiene permisos de administrador
        if (esAdmin == null || !esAdmin.equals("true")) {
            logger.warn("Intento de acceso no autorizado");
            modelAndView.setViewName("redirect:/usuarios/index");
        } else {
            logger.info("Acceso autorizado al dashboard");
            modelAndView.setViewName("dashboard"); // Carga la vista del dashboard
        }

        return modelAndView;
    }

    /**
     * Lista todos los usuarios para su visualización en una vista HTML.
     * Este método solo es accesible para administradores.
     * @param model El modelo que se pasa a la vista.
     * @param session La sesión HTTP del usuario actual.
     * @return El nombre de la vista que muestra la lista de usuarios.
     */
    @GetMapping("/lista")
    public String listarUsuarios(Model model, HttpSession session) {
        String esAdmin = (String) session.getAttribute("esAdmin");

        // Verifica si el usuario tiene permisos de administrador
        if (esAdmin == null || !esAdmin.equals("true")) {
            logger.warn("Intento de acceso no autorizado a la lista de usuarios");
            return "redirect:/usuarios/index"; // Redirige si no es admin
        }

        List<EliminarUsuarioDto> listaUsuarios = eliminarUsuarioServicio.obtenerUsuarios();
        model.addAttribute("listaUsuarios", listaUsuarios); // Agrega la lista de usuarios al modelo
        logger.info("Lista de usuarios cargada correctamente");

        return "listaUsuarios"; // Vista donde se muestran los usuarios
    }

    /**
     * Elimina un usuario del sistema.
     * Este método solo es accesible para administradores.
     * @param correoUsuario El correo electrónico del usuario que se va a eliminar.
     * @param session La sesión HTTP del usuario actual.
     * @return Un mensaje que indica si la eliminación fue exitosa o si hubo un error.
     */
    @PostMapping("/eliminar")
    @ResponseBody
    public String eliminarUsuario(@RequestParam("correoUsuario") String correoUsuario, HttpSession session) {
        String esAdmin = (String) session.getAttribute("esAdmin");

        // Verifica si el usuario tiene permisos de administrador
        if (esAdmin == null || !esAdmin.equals("true")) {
            logger.warn("Intento de eliminación de usuario sin permisos");
            return "No tienes permisos para eliminar usuarios."; // Mensaje si no tiene permisos
        }

        try {
            eliminarUsuarioServicio.eliminarUsuario(correoUsuario);
            logger.info("Usuario eliminado: " + correoUsuario);
            return "Usuario eliminado correctamente."; // Mensaje si la eliminación es exitosa
        } catch (Exception e) {
            logger.error("Error al eliminar usuario: " + correoUsuario, e);
            return "Error al eliminar usuario: " + e.getMessage(); // Mensaje de error si ocurre una excepción
        }
    }
}
