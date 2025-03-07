package controladores;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import dtos.RegistroUsuarioDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import servicios.RegistroUsuarioServicio;

/**
 * Controlador que maneja el registro de nuevos usuarios.
 */
@WebServlet("/registroUsuario")
@MultipartConfig //(maxFileSize = 1024 * 1024 * 5) // Tamaño máximo de archivo: 5 MB
public class RegistroUsuarioControlador extends HttpServlet {

    private RegistroUsuarioServicio registroUsuarioServicio;

    /**
     * Método de inicialización que se llama al iniciar el servlet.
     * Inicializa el servicio encargado del registro del usuario.
     * @throws ServletException Si ocurre un error al inicializar el servlet.
     */
    @Override
    public void init() throws ServletException {
        this.registroUsuarioServicio = new RegistroUsuarioServicio();
    }

    /**
     * Método que maneja las solicitudes POST para el registro de un usuario.
     * Valida los parámetros de entrada, verifica si las contraseñas coinciden, y guarda los datos del usuario
     * en el sistema. Si el registro es exitoso, redirige al usuario a la página de login.
     * Si ocurre un error, se redirige de nuevo a la página de registro con un mensaje de error.
     * @param request La solicitud HTTP que contiene los parámetros enviados por el usuario.
     * @param response La respuesta HTTP para enviar al cliente.
     * @throws ServletException Si ocurre un error en la ejecución del servlet.
     * @throws IOException Si ocurre un error al procesar la solicitud o respuesta.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (request.getContentType() == null || !request.getContentType().toLowerCase().startsWith("multipart/")) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El contenido no es multipart/form-data.");
                return;
            }

            String nombreCompletoUsuario = request.getParameter("nombreCompletoUsuario");
            String correoUsuario = request.getParameter("correoUsuario");
            String telefonoUsuario = request.getParameter("telefonoUsuario");
            String contraseniaUsuario = request.getParameter("contraseniaUsuario");
            String confirmarContraseniaUsuario = request.getParameter("confirmarContraseniaUsuario");

            if (!contraseniaUsuario.equals(confirmarContraseniaUsuario)) {
                request.setAttribute("ERROR", "Las contraseñas no coinciden.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return;
            }

            byte[] fotoUsuario = obtenerBytesDeArchivo(request.getPart("fotoUsuario"));

            if (fotoUsuario == null) {
                request.setAttribute("ERROR", "No se ha encontrado la foto.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return;
            }

            RegistroUsuarioDto registroUsuarioDto = new RegistroUsuarioDto();
            registroUsuarioDto.setNombreCompletoUsuario(nombreCompletoUsuario);
            registroUsuarioDto.setCorreoUsuario(correoUsuario);
            registroUsuarioDto.setTelefonoUsuario(telefonoUsuario);
            registroUsuarioDto.setFotoUsuario(fotoUsuario);
            registroUsuarioDto.setContraseniaUsuario(new BCryptPasswordEncoder().encode(contraseniaUsuario));

            boolean registroExitoso = registroUsuarioServicio.registrarUsuario(registroUsuarioDto);

            if (registroExitoso) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("ERROR", "El correo ya existe.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
        }
    }

    /**
     * Método auxiliar que convierte la foto de usuario en un array de bytes.
     * @param foto de usuario recibida en la solicitud HTTP.
     * @return Un array de bytes que representa el archivo. Si no hay archivo, devuelve null.
     * @throws IOException Si ocurre un error al leer el archivo.
     */
    private byte[] obtenerBytesDeArchivo(Part archivo) throws IOException {
        if (archivo != null && archivo.getSize() > 0) {
            try (InputStream inputStream = archivo.getInputStream();
                 ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                return outputStream.toByteArray();
            }
        }
        return null;
    }
}