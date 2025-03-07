package controladores;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import servicios.RegistroUsuarioServicio;
import servicios.SubirNoticiaServicio;
import dtos.RegistroUsuarioDto;
import dtos.SubirNoticiaDto;

/**
 * Controlador que maneja el proceso de subir una noticia.
 */
@WebServlet("/subirNoticia")
public class SubirNoticiaControlador extends HttpServlet {
    
    private SubirNoticiaServicio subirNoticiaServicio;

    /**
     * Método de inicialización que se llama una vez al iniciar el servlet.
     * Inicializa el servicio de subir noticias.
     * @throws ServletException Si ocurre un error al inicializar el servlet.
     */
    @Override
    public void init() throws ServletException {
        this.subirNoticiaServicio = new SubirNoticiaServicio();
    }

    /**
     * Método que maneja las solicitudes POST para subir una noticia.
     * Verifica si el usuario está autenticado, valida los datos del formulario, 
     * procesa la foto y, si todo es correcto, registra la noticia.
     * Si ocurre algún error, redirige a la página de subir noticia con un mensaje de error.
     * @param request La solicitud HTTP que contiene los parámetros enviados por el usuario.
     * @param response La respuesta HTTP para enviar al cliente.
     * @throws ServletException Si ocurre un error en la ejecución del servlet.
     * @throws IOException Si ocurre un error al procesar la solicitud o respuesta.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession(true); // Obtiene la sesión sin crear una nueva
            if (session == null || session.getAttribute("idUsuario") == null) {
                System.out.println("No hay sesión");
                response.sendRedirect("login.jsp");
                return;
            }

            Long idUsuario = (Long) session.getAttribute("idUsuario");

            if (request.getContentType() == null || !request.getContentType().toLowerCase().startsWith("multipart/")) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El contenido no es multipart/form-data.");
                return;
            }

            String titularNoticia = request.getParameter("titularNoticia");
            String categoriaNoticia = request.getParameter("categoriaNoticia");
            
            byte[] fotoNoticia = obtenerBytesDeArchivo(request.getPart("fotNoticia"));

            if (fotoNoticia == null) {
                request.setAttribute("ERROR", "No se ha encontrado la foto.");
                request.getRequestDispatcher("subirNoticia.jsp").forward(request, response);
                return;
            }

            SubirNoticiaDto subirNoticiaDto = new SubirNoticiaDto();
            subirNoticiaDto.setTitularNoticia(titularNoticia);
            subirNoticiaDto.setCategoriaNoticia(categoriaNoticia);
            subirNoticiaDto.setFotoNoticia(fotoNoticia);
            subirNoticiaDto.setIdUsuarioNoticia(idUsuario); 

            boolean registroExitoso = subirNoticiaServicio.registrarNoticia(subirNoticiaDto);

            if (registroExitoso) {
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("ERROR", "Se ha producido un error");
                request.getRequestDispatcher("subirNoticia.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
        }
    }

    /**
     * Método auxiliar que convierte la foto de usuario en un array de bytes.
     * @param foto de la noticia recibida en la solicitud HTTP.
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
