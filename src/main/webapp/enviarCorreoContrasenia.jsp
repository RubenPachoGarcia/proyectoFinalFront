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
<link rel="stylesheet" href="css/styles.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="containerCorreoContrasenia">
		<div class="rowCorreoContrasenia">
			<div class="colForm col-lg-12 col-md-12 col-12">
				<div class="form-container-custom">
					<h1 class="tituloCorreoContrasenia">Recuperar Contraseña</h1>
					<br>
					<p class="textoCorreoContrasenia">
						Por favor, ingrese su correo electrónico.<br>Recibirá un
						enlace para recuperar su contraseña.
					</p>
					<div class="containerRegistro">
						<form action="recuperar" method="POST"
							onsubmit="return avisoMensajeCorreo()">
							<div class="rowRegistro">
								<div class="colRegistro col-lg-12 col-md-12 col-12">
									<label for="correoUsuario" class="labelRegistro">Correo
										electrónico</label> <input type="email" class="inputRegistro"
										id="correoUsuario" name="correoUsuario" required>
								</div>
							</div>
							<p id="mensajeAvisoCorreo" class="mensajeAvisoCorreo"></p>
							<!-- <p id="mensajeErrorAvisoCorreo" class="mensajeErrorAvisoCorreo"></p> -->
							<br>
							<button class="botonCorreoContrasenia" type="submit">ENVIAR
								CORREO</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function avisoMensajeCorreo() {
			let correoUsuario = document.getElementById("correoUsuario").value;
			let mensajeAvisoCorreo = document
					.getElementById("mensajeAvisoCorreo");
			/* let mensajeErrorAvisoCorreo = document
					.getElementById("mensajeErrorAvisoCorreo"); */

			if (correoUsuario.trim() !== "") {
				// Muestra el mensaje de que se ha enviado correctamente el correo
				mensajeAvisoCorreo.textContent = "¡Correo enviado! Revisa tu bandeja de entrada";
			}
			// Evita el envío si no hay correo
			return true;
		}
	</script>
</body>
</html>