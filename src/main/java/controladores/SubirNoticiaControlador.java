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

@WebServlet("/subirNoticia")
public class SubirNoticiaControlador extends HttpServlet {
	
    private SubirNoticiaServicio subirNoticiaServicio;
    
    @Override
    public void init() throws ServletException {
        this.subirNoticiaServicio = new SubirNoticiaServicio();
    }

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

            Long idUsuario = (Long) session.getAttribute("idUsuario"); // Recupera el ID del usuario
            
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
            subirNoticiaDto.setIdUsuarioNoticia(idUsuario); // Asignamos el ID del usuario que sube la noticia

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

        /*// Obtener la sesión y validar si está activa
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect("subirNoticia.jsp?error=No hay sesión activa.");
            return;
        }

        // Obtener el ID de usuario desde la sesión
        long idUsuario = (long) session.getAttribute("idUsuario");
        String sessionId = session.getId(); // Obtener el JSESSIONID

        // Obtenemos los datos del formulario
        String titularNoticia = request.getParameter("titularNoticia");
        String categoriaNoticia = request.getParameter("categoriaNoticia");

        // Obtenemos la imagen del formulario
        Part filePart = request.getPart("fotoNoticia");
        InputStream inputStream = filePart.getInputStream();

        // Convertimos el InputStream a byte[]
        byte[] fotoNoticia = new byte[inputStream.available()];
        inputStream.read(fotoNoticia);

        // Creamos el DTO con los datos de la noticia
        SubirNoticiaDto subirNoticiaDto = new SubirNoticiaDto();
        subirNoticiaDto.setTitularNoticia(titularNoticia);
        subirNoticiaDto.setFotoNoticia(fotoNoticia);
        subirNoticiaDto.setCategoriaNoticia(categoriaNoticia);
        subirNoticiaDto.setIdUsuarioNoticia(idUsuario); // Establecemos el id del usuario

        // Llamar al servicio con ambos parámetros: SubirNoticiaDto y sessionId
        boolean noticiaCreada = subirNoticiaServicio.registrarNoticia(subirNoticiaDto, sessionId);

        if (noticiaCreada) {
            // Redirigir dependiendo de la categoría
            if ("actualidad".equals(categoriaNoticia)) {
                response.sendRedirect("actualidad.jsp");
            } else {
                response.sendRedirect("festejos.jsp");
            }
        } else {
            response.sendRedirect("subirNoticia.jsp?error=No se pudo subir la noticia");
        }
    }*/

