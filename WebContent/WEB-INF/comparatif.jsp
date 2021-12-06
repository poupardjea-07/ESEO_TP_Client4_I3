<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Comparatif distance</title>
<!-- logo fontawesome-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Import bootstrap et css -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="style/style.css" />

</head>

<body>

	<!--  Barre de nav -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Dropdown </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<!--  header, titre principal -->

	<header class="text-white text-center bg-custom-yellow">
		<div class="container d-flex align-items-center flex-column">
			<h1 class="masthead-heading text-uppercase mb-lg-5 mb-3 custom-dark">test</h1>
		</div>
	</header>

	<section>
	
		<c:if test="${empty listeVille }">
			<center id="messageAudit" style="font-size: 25px">
				<c:out value="il n'y a pas de villes !"></c:out>
			</center>
		</c:if>
		<c:if test="${!empty listeVille }">
			<div class="row justify-content-center">
				<div class="col-5">
					<div class="list-group">
						<c:forEach items="${listeVille}" var="ville">
							<a href="#" onclick="sendVilleParam({ville: '${ville.nomCommune}', code: '${ville.codeCommune}',codeP: '${ville.codePostal}', longitude: '${ville.longitude}', latitude: '${ville.latitude}'},'liste_A');event.preventDefault();" class="list-group-item list-group-item-action" aria-current="true">
						    	<div class="d-flex w-100 justify-content-between">
						      		<h5 class="mb-1"><c:out value="${ville.nomCommune}"></c:out></h5>
							      	<small><c:out value="${ville.codePostal}"></c:out></small>
							    </div>
						  	</a>
						</c:forEach>	
					</div>
				</div>
				<div class="col-1">
				
				</div>
				<div class="col-5">
					<div class="list-group">
						<c:forEach items="${listeVille}" var="ville">
							<a href="#" onclick="sendVilleParam({ville: '${ville.nomCommune}', code: '${ville.codeCommune}',codeP: '${ville.codePostal}', longitude: '${ville.longitude}', latitude: '${ville.latitude}'},'liste_B');event.preventDefault();" class="list-group-item list-group-item-action" aria-current="true">
						    	<div class="d-flex w-100 justify-content-between">
						      		<h5 class="mb-1"><c:out value="${ville.nomCommune}"></c:out></h5>
							      	<small><c:out value="${ville.codePostal}"></c:out></small>
							    </div>
						  	</a>
						</c:forEach>	
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-11 card" id="card">
					<div class="card-body text-center">
					    Vous n'avez pas encore sélectionné de villes
				  	</div>
				</div>
			</div>
		</c:if>
		
		
		
		
	</section>
	
	<script>
		
		function sendVilleParam(ville, liste){
			
			//enregistre dans la session pour récupérer plus tard
			if(liste === "liste_A"){
				sessionStorage.setItem('ville_A', JSON.stringify(ville));
			}
			else{
				sessionStorage.setItem('ville_B', JSON.stringify(ville));
			}
			
		
			writeNewCity()
			
		}
		
		function writeNewCity(){
			
			var ville_A = sessionStorage.getItem("ville_A");
			var ville_B = sessionStorage.getItem("ville_B");
			
			let card = document.getElementById('card');
			card.firstElementChild.remove();
			let body = document.createElement('div');
			body.className="card-body";
					
			if(ville_A && ville_B){
				ville_A = JSON.parse(ville_A)
				ville_B = JSON.parse(ville_B)
				
				body.innerHTML = '<div class="row justify-content-md-center">'
								    +'<div class="col-md-5">'
								    	+'<div class="row justify-content-md-end">'
							    			+'<div class="col-md-auto">'
							    				+'<button type="button" class="btn btn-outline-primary" onclick="deleteCity(0)">'+ville_A.ville+' <i class="fas fa-times ms-1"></i></button>'
							    			+'</div>'
						    			+'</div>'
								    +'</div>'
								    +'<div class="col-1"><p class="h5 text-center mt-2 text-secondary"><i class="fas fa-arrows-alt-h"></i></p></div>'
								    +'<div class="col-md-5">'
								    	+'<div class="row justify-content-md-start">'
							    			+'<div class="col-md-auto">'
							    				+'<button type="button" class="btn btn-outline-primary" onclick="deleteCity(1)"><i class="fas fa-times me-1"></i> '+ville_B.ville+'</button>'
							    			+'</div>'
						    			+'</div>'
								    +'</div>'
								+'</div>'
								+'<div class="row justify-content-center">'
									+'<div class="col-10 justify-content-center text-center mt-2" id="res">'
										+'<a href="#" class="link-secondary text-decoration-none leaf" onclick="calculate();event.preventDefault();">Calculez la distance entre les deux villes</a>'
									+'</div>'
								+'</div>';
				
			}else if(ville_A && !ville_B){
				
				ville_A = JSON.parse(ville_A)
				
				body.innerHTML = '<div class="row justify-content-md-center">'
					+'<div class="col-md-5">'
				    	+'<div class="row justify-content-md-end">'
			    			+'<div class="col-md-auto">'
			    				+'<button type="button" class="btn btn-outline-primary" onclick="deleteCity(2)">'+ville_A.ville+' <i class="fas fa-times ms-1"></button>'
			    			+'</div>'
		    			+'</div>'
				    +'</div>'
				    +'<div class="col-1"></div>'
				    +'<div class="col-md-5"></div>'
				+'</div>';
				
			}else if(!ville_A && ville_B){
				
				ville_B = JSON.parse(ville_B)
				
				body.innerHTML = '<div class="row justify-content-md-center">'
					+'<div class="col-md-5"></div>'
				    +'<div class="col-1"></div>'
				    +'<div class="col-md-5">'
				    	+'<div class="row justify-content-md-start">'
			    			+'<div class="col-md-auto">'
			    				+'<button type="button" class="btn btn-outline-primary" onclick="deleteCity(2)"><i class="fas fa-times me-1"></i> '+ville_B.ville+'</button>'
			    			+'</div>'
		    			+'</div>'
				    +'</div>'
				+'</div>';
				
			}
			else{
				body.innerHTML = '<p>error</p>';
			}
			
						
			card.appendChild(body)
		}
		
		function deleteCity(liste){
			if(liste === 0){
				sessionStorage.removeItem('ville_A');
				writeNewCity();
			}
			else if(liste === 1){
				sessionStorage.removeItem('ville_B');
				writeNewCity();
			}
			else{
				sessionStorage.removeItem('ville_B');
				sessionStorage.removeItem('ville_A');
				let card = document.getElementById('card');
				card.firstElementChild.remove();
				card.innerHTML = getHtmlBegining();
			}
		}
		
		function getHtmlBegining(){
			let string = '<div class="card-body text-center">'
					    	+'Vous n\'avez pas encore sélectionné de villes'
					  	+'</div>';
			
			
			return string;
		}
		
		function calculate(){
			let ville_A = JSON.parse(sessionStorage.getItem("ville_A"));
			let ville_B = JSON.parse(sessionStorage.getItem("ville_B"));
			
			let R = 6371; // Radius of the earth in km
			let dLat = deg2rad(ville_B.latitude-ville_A.latitude);
			let dLon = deg2rad(ville_B.longitude-ville_A.longitude); 
			let a = 
			  Math.sin(dLat/2) * Math.sin(dLat/2) +
			  Math.cos(deg2rad(ville_A.latitude)) * Math.cos(deg2rad(ville_B.latitude)) * 
			  Math.sin(dLon/2) * Math.sin(dLon/2); 
			let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
			let d = R * c;
			let distance = Math.round(d * 100) / 100
			console.log(distance)
			showResult(distance)
		}
		
		function deg2rad(deg) {
	  		return deg * (Math.PI/180)
		}
		
		function showResult(distance){
			let res = document.getElementById('res');
			res.innerHTML = '<p class="leaf text-center">La distance entre les deux villes est de '+distance+' km !</p>';
		}
	
	</script>


	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous">
	</script>
	

</body>
</html>
