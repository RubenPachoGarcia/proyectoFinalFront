<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subir Noticia</title>
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
	<h2>Subir Nueva Noticia</h2>
	<form id="subirNoticia" action="subirNoticia" method="POST"
                            enctype="multipart/form-data">
		<label for="titularNoticia" class="labelRegistro">Titular:</label><br> <input
			type="text" class="inputRegistro" name="titularNoticia" required><br>
		<br> <label for="fotoNoticia" class="labelRegistro">Fotografía:</label><br> <input
			type="file" class="inputRegistro" name="fotoNoticia" required><br>
		<br> <label for="categoriaNoticia" class="labelRegistro">Categoría:</label><br> <select
			id="categoriaNoticia" name="categoriaNoticia" required>
			<option value="actualidad">Actualidad</option>
			<option value="festejo">Festejo</option>
		</select><br> <br>
		<button type="submit">SUBIR NOTICIA</button>
	</form>
</body>
</html>
