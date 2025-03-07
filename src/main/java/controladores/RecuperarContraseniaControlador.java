package controladores;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servicios.RecuperarContraseniaServicio;

/**
 * Controlador para manejar las solicitudes de recuperación de contraseña.
 */
@WebServlet("/recuperar")
public class RecuperarContraseniaControlador extends HttpServlet {

    private RecuperarContraseniaServicio recuperarContraseniaServicio;

    /**
     * Método de inicialización que se llama una vez al iniciar el servlet.
     * Se inicializa el servicio encargado de la recuperación de la contraseña.
     * @throws ServletException Si ocurre un error al inicializar el servlet.
     */
    @Override
    public void init() throws ServletException {
        // Inicializamos el servicio de recuperación de contraseña
        this.recuperarContraseniaServicio = new RecuperarContraseniaServicio();
    }

    /**
     * Método que maneja las solicitudes POST para la recuperación de la contraseña.
     * Recibe el correo del usuario y solicita la recuperación de la contraseña.
     * Si el correo es válido, se envía un mensaje de éxito; si no, se muestra un mensaje de error.
     * @param request La solicitud HTTP que contiene los parámetros enviados por el usuario.
     * @param response La respuesta HTTP para enviar al cliente.
     * @throws ServletException Si ocurre un error en la ejecución del servlet.
     * @throws IOException Si ocurre un error al procesar la respuesta.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correoUsuario = request.getParameter("correoUsuario");
        
        if (correoUsuario == null || correoUsuario.isEmpty()) {
            request.setAttribute("mensaje", "El correo no puede estar vacío.");
            request.getRequestDispatcher("recuperarContrasenia.jsp").forward(request, response);
            return;
        }

        boolean enviado = recuperarContraseniaServicio.solicitarRecuperacion(correoUsuario);

        if (enviado) {
            request.setAttribute("mensaje", "Correo de recuperación enviado.");
        } else {
            request.setAttribute("mensaje", "Error: No se encontró el correo.");
        }

        request.getRequestDispatcher("enviarCorreoContrasenia.jsp").forward(request, response);
    }
}
