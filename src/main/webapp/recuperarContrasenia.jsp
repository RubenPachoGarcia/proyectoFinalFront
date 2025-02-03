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
	<div class="containerCambiarContrasenia">
		<div class="rowCambiarContrasenia">
			<div class="colForm col-lg-12 col-md-12 col-12">
				<div class="form-container-custom">
					<h1 class="tituloCambiarContraseña">Cambiar Contraseña</h1>
					<br>
					<p class="textoCambiarContrasenia">Por favor, introduzca su
						nueva contraseña</p>
					<div class="containerRegistro">
						<form id="formCambiarContrasenia"
							action="http://localhost:8099/api/recuperar/cambiar"
							method="POST" onsubmit="return validarNuevaContrasenia()">
							<input type="hidden" name="token" value="${param.token}">
							<div class="rowRegistro">
								<div class="colRegistro col-lg-12 col-md-12 col-12">
									<label for="nuevaContrasenia" class="labelRegistro">Nueva
										Contraseña:</label><br> <input type="password"
										class="inputRegistro" id="nuevaContrasenia"
										name="nuevaContrasenia" required>
								</div>
							</div>
							<div class="rowRegistro">
								<div class="colRegistro col-lg-12 col-md-12 col-12">
									<label for="confirmarNuevaContrasenia" class="labelRegistro">Confirmar
										Contraseña:</label><br> <input type="password"
										class="inputRegistro" id="confirmarNuevaContrasenia" required>
								</div>
							</div>
							<p id="mensajeErrorNuevaContrasenia"
								class="mensajeErrorNuevaContrasenia"></p>
							<button class="botonCambiarContrasenia" type="submit">CAMBIAR
								CONTRASEÑA</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validarNuevaContrasenia() {
			let nuevaContrasenia = document.getElementById("nuevaContrasenia").value;
			let confirmarNuevaContrasenia = document
					.getElementById("confirmarNuevaContrasenia").value;
			let mensajeError = document
					.getElementById("mensajeErrorNuevaContrasenia");

			if (nuevaContrasenia !== confirmarNuevaContrasenia) {
				mensajeError.textContent = "X ERROR X: Las contraseñas no coinciden.";
				return false;
			}
			return true;
		}
	</script>
</body>
</html>