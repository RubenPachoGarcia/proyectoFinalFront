package controladores;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dtos.EliminarUsuarioDto;
import servicios.EliminarUsuarioServicio;

@RestController
@RequestMapping("/admin")
public class EliminarUsuarioControlador {

    @Autowired
    private EliminarUsuarioServicio eliminarUsuarioServicio;

    @GetMapping("/usuarios")
    public List<EliminarUsuarioDto> mostrarUsuarios() {
        return eliminarUsuarioServicio.obtenerUsuarios();
    }

    @DeleteMapping("/eliminar/{id}")
    public Map<String, String> eliminarUsuario(@PathVariable Long idUsuario) {
        boolean usuarioEliminado = eliminarUsuarioServicio.eliminarUsuario(idUsuario);
        if (usuarioEliminado) {
            return Map.of("mensaje", "Usuario eliminado correctamente.");
        } else {
            return Map.of("error", "Usuario no encontrado.");
        }
    }
}
