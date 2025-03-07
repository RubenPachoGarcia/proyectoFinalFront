package controladores;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import servicios.LoginUsuarioServicio;

/**
 * Controlador para gestionar el inicio de sesión de los usuarios.
 * Permite a los usuarios iniciar sesión, mantener su sesión activa y cerrar sesión.
 */
@WebServlet("/loginUsuario")
public class LoginUsuarioControlador extends HttpServlet {

    private LoginUsuarioServicio usuarioServicio;

    /**
     * Inicializa el controlador de login y crea una instancia del servicio de login.
     * @throws ServletException Si ocurre un error durante la inicialización.
     */
    @Override
    public void init() throws ServletException {
        this.usuarioServicio = new LoginUsuarioServicio();
    }

    /**
     * Maneja las solicitudes POST de login de los usuarios.
     * Verifica el correo y la contraseña proporcionados, y si son correctos,
     * inicia una sesión para el usuario. Dependiendo de si el usuario es administrador,
     * redirige a la página correspondiente.
     * @param request La solicitud HTTP que contiene los datos del formulario de login.
     * @param response La respuesta HTTP para redirigir al usuario según el resultado.
     * @throws ServletException Si ocurre un error durante el procesamiento de la solicitud.
     * @throws IOException Si ocurre un error de entrada/salida al enviar la respuesta.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correoUsuario = request.getParameter("correoUsuario");
        String contraseniaUsuario = request.getParameter("contraseniaUsuario");

        // Obtiene el ID del usuario tras verificar su autenticidad
        Long idUsuario = usuarioServicio.obtenerIdUsuario(correoUsuario, contraseniaUsuario);

        // Verifica si las credenciales son correctas
        boolean usuarioValido = usuarioServicio.verificarUsuario(correoUsuario, contraseniaUsuario);

        if (usuarioValido) {
            // Si el usuario es válido, establece los atributos de sesión
            String esAdmin = usuarioServicio.getEsAdmin();
            
            HttpSession session = request.getSession();
            session.setAttribute("correoUsuario", correoUsuario);
            session.setAttribute("esAdmin", esAdmin);
            session.setAttribute("idUsuario", idUsuario);
            session.setMaxInactiveInterval(-1); // Sesión indefinida

            // Redirige según si el usuario es administrador o no
            if ("true".equals(esAdmin)) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            // Si las credenciales no son correctas, muestra un mensaje de error
            request.setAttribute("ERROR", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Maneja las solicitudes GET. Permite cerrar sesión si se pasa el parámetro "action" con valor "logout".
     * Si no se especifica la acción, redirige a la página de login.
     * @param request La solicitud HTTP que puede contener una acción de logout.
     * @param response La respuesta HTTP que redirige o redirige a la página de login.
     * @throws ServletException Si ocurre un error durante el procesamiento de la solicitud.
     * @throws IOException Si ocurre un error de entrada/salida al enviar la respuesta.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Si la acción es "logout", se cierra la sesión
        if ("logout".equals(action)) {
            // Se invalida la sesión si existe
            HttpSession session = request.getSession(false); 
            if (session != null) {
                session.invalidate();  // Cierra la sesión del usuario
            }
            // Redirige al usuario a la página de login
            response.sendRedirect("index.jsp");
        } else {
            // Si la acción no es logout, redirige al login
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
