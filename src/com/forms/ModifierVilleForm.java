package com.forms;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.beans.Ville;
import com.functions.APIConnection;

public class ModifierVilleForm {

	public Boolean modifVille(HttpServletRequest request) {
		
		System.out.println("modifVille");
		String codeCommune = request.getParameter("codeCommune");
		String nomCommune = request.getParameter("nomCommune");
		String codePostal = request.getParameter("codePostal");
		String longitude = request.getParameter("longitude");
		String latitude = request.getParameter("latitude");
		String libelle = request.getParameter("libelle");
		String ligne = request.getParameter("ligne");
		
		Ville ville = new Ville("01002", nomCommune, codePostal, longitude, latitude, libelle, ligne);
		
		
		APIConnection apiConnection = new APIConnection();
		return apiConnection.updateOneVille(ville);
		
	}
}
