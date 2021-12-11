<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editer les données de la ville</title>
</head>
<body>
	<h1>Modifier les informations de la ville</h1>
	<form action="editerDonneesVille?code=${ ville.codeCommune }" method="post">
		<input type=text size=50 id=codeCommune disabled="disabled" value="${ ville.codeCommune }">
		<p>Nom commune :</p>
		<input type=text size=50 id=nomCommune value="${ ville.nomCommune }">
		<p>Code postal :</p>
		<input type=text id=codePostal value="${ ville.codePostal }">
		<p>Latitude :</p>
		<input type=text id=latitude value="${ ville.latitude }">
		<p>Longitude :</p>
		<input type=text id=longitude value="${ ville.longitude }">
		<p>Libelle :</p>
		<input type=text size=50 id=libelle value="${ ville.libelle }">
		<p>Ligne :</p>
		<input type=text id=ligne value="${ ville.ligne }">
		<br>
		<br>
		<input type=submit value="Modifier">      
	</form>
</body>
</html>