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
						<form id="registrarUsuario"
							action="registroUsuario" method="POST"
							enctype="multipart/form-data">
							<div class="rowRegistro">
								<div class="colRegistro col-lg-6 col-md-6 col-12">
									<label for="nombreCompletoUsuario" class="labelRegistro">Nombre
										completo</label> <input type="text" class="inputRegistro"
										name="nombreCompletoUsuario" required>
								</div>
								<div class="colRegistro col-lg-6 col-md-6 col-12">
									<label for="fotoUsuario" class="labelRegistro">Foto</label> <input
										type="file" class="inputRegistro" name="fotoUsuario">
								</div>
							</div>

							<div class="rowRegistro">
								<div class="colRegistro col-lg-6 col-md-6 col-12">
									<label for="correoUsuario" class="labelRegistro">Correo
										electrónico</label> <input type="email" class="inputRegistro"
										name="correoUsuario" required>
								</div>
								<div class="colRegistro col-lg-6 col-md-6 col-12">
									<label for="contraseniaUsuario" class="labelRegistro">Contraseña</label>
									<input type="password" class="inputRegistro"
										name="contraseniaUsuario" required>
								</div>
							</div>

							<div class="rowRegistro">
								<div class="colRegistro col-lg-6 col-md-6 col-12">
									<label for="telefonoUsuario" class="labelRegistro">Teléfono</label>
									<input type="number" class="inputRegistro"
										name="telefonoUsuario" required>
								</div>
								<div class="colRegistro col-lg-6 col-md-6 col-12">
									<label for="confirmarContraseniaUsuario" class="labelRegistro">Repetir
										contraseña</label> <input type="password" class="inputRegistro"
										name="confirmarContraseniaUsuario" required>
								</div>
							</div>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="botonRegistro" type="submit">REGISTRARSE</button>
							<p></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>