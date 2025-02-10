<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="containerRegistrarse">
        <div class="rowRegistrarse">
            <div class="colForm col-lg-12 col-md-12 col-12">
                <div class="form-container-custom">
                    <p></p>
                    <h1 class="tituloRegistro">REGISTRARSE</h1>
                    <div class="containerRegistro">
                        <form id="registrarUsuario" action="registroUsuario" method="POST"
                            enctype="multipart/form-data">
                            <div class="rowRegistro">
                                <div class="colRegistro col-lg-6 col-md-6 col-12">
                                    <label for="nombreCompletoUsuario" class="labelRegistro">Nombre
                                        completo (usuario)</label> 
                                    <input type="text" class="inputRegistro"
                                        name="nombreCompletoUsuario" required>
                                </div>
                                <div class="colRegistro col-lg-6 col-md-6 col-12">
                                    <label for="fotoUsuario" class="labelRegistro">Foto</label> 
                                    <input type="file" class="inputRegistro" name="fotoUsuario">
                                </div>
                            </div>

                            <div class="rowRegistro">
                                <div class="colRegistro col-lg-6 col-md-6 col-12">
                                    <label for="correoUsuario" class="labelRegistro">Correo
                                        electrónico</label> 
                                    <input type="email" class="inputRegistro"
                                        name="correoUsuario" id="correoUsuario" required>
                                </div>
                                <div class="colRegistro col-lg-6 col-md-6 col-12">
                                    <label for="contraseniaUsuario" class="labelRegistro">Contraseña</label>
                                    <input type="password" class="inputRegistro"
                                        name="contraseniaUsuario" id="contraseniaUsuario" required>
                                </div>
                            </div>

                            <div class="rowRegistro">
                                <div class="colRegistro col-lg-6 col-md-6 col-12">
                                    <label for="telefonoUsuario" class="labelRegistro">Teléfono</label>
                                    <input type="number" class="inputRegistro"
                                        name="telefonoUsuario" id="telefonoUsuario" required>
                                </div>
                                <div class="colRegistro col-lg-6 col-md-6 col-12">
                                    <label for="confirmarContraseniaUsuario" class="labelRegistro">Repetir
                                        contraseña</label> 
                                    <input type="password" class="inputRegistro"
                                        name="confirmarContraseniaUsuario"
                                        id="confirmarContraseniaUsuario" required>
                                </div>
                            </div>
                            <p id="mensajeErrorContrasenia" class="mensajeErrorContrasenia"></p>
                            <p id="mensajeErrorCorreo" class="mensajeErrorCorreo"></p>
                            <p id="mensajeErrorTelefono" class="mensajeErrorTelefono"></p>
                            <br>
                            <button class="botonRegistro" type="submit">REGISTRARSE</button>
                            <p></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("registrarUsuario").addEventListener("submit", async function(event) {
            event.preventDefault(); // Evita el envío inmediato del formulario

            let contraseniaValida = await validarContrasenia(event);
            let correoValido = await validarCorreo(event);
            let telefonoValido = await validarTelefono(event);

            if (contraseniaValida && correoValido && telefonoValido) {
                console.log("Todo correcto, enviando formulario...");
                this.submit(); // Envía el formulario si todo es válido
            } else {
                console.log("X Error en la validación, el formulario no se enviará.");
            }
        });

        async function validarContrasenia(event) {
            let contraseniaUsuario = document.getElementById("contraseniaUsuario").value;
            let confirmarContraseniaUsuario = document.getElementById("confirmarContraseniaUsuario").value;
            let mensajeError = document.getElementById("mensajeErrorContrasenia");

            if (contraseniaUsuario !== confirmarContraseniaUsuario) {
                mensajeError.textContent = "X ERROR X: Las contraseñas no coinciden.";
                return false;
            }
            mensajeError.textContent = "";
            return true;
        }

        async function validarCorreo(event) {
            let correoUsuario = document.getElementById("correoUsuario").value;
            let mensajeErrorCorreo = document.getElementById("mensajeErrorCorreo");

            try {
                const response = await fetch('http://localhost:8099/api/verificar/correo', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ correoUsuario })
                });

                if (!response.ok) {
                    const errorText = await response.text();
                    throw new Error(`Error HTTP ${response.status}: ${errorText}`);
                }

                const data = await response.json();
                console.log("Respuesta del servidor:", data); // Debug

                if (data.existe) {
                    mensajeErrorCorreo.textContent = "X ERROR X: El correo introducido no está disponible";
                    return false;
                } else {
                    mensajeErrorCorreo.textContent = "";
                }
            } catch (error) {
                console.error('Error en la validación del correo:', error);
                mensajeErrorCorreo.textContent = "X ERROR X: Ha ocurrido un error en la validación.";
                return false;
            }
            return true;
        }

        async function validarTelefono(event) {
            let telefonoUsuario = document.getElementById("telefonoUsuario").value;
            let mensajeErrorTelefono = document.getElementById("mensajeErrorTelefono");

            try {
                const response = await fetch('http://localhost:8099/api/verificar/telefono', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ telefonoUsuario })
                });

                if (!response.ok) {
                    const errorText = await response.text();
                    throw new Error(`Error HTTP ${response.status}: ${errorText}`);
                }

                const data = await response.json();
                console.log("Respuesta del servidor:", data); // Debug

                if (data.existe) {
                	mensajeErrorTelefono.textContent = "X ERROR X: El teléfono introducido no está disponible";
                    return false;
                } else {
                	mensajeErrorTelefono.textContent = "";
                }
            } catch (error) {
                console.error('Error en la validación del correo:', error);
                mensajeErrorTelefono.textContent = "X ERROR X: Ha ocurrido un error en la validación.";
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
