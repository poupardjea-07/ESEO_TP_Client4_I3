package com.functions;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.beans.Ville;

public class UtilsFunction {

	public List<Ville> convertJsonArrayToListVille(JSONArray jsonArray){
		System.out.println("rentre dbzjqkdbkjq");
		List<Ville> villes = new ArrayList<Ville>();
		
		for(Object object : jsonArray) {
			Ville ville = new Ville();
			if (object instanceof JSONObject) {
				JSONObject jsonObject = (JSONObject) object;
				ville.setCodeCommune((jsonObject).get("codeCommune").toString());
				ville.setCodePostal((jsonObject).get("codePostal").toString());
				ville.setNomCommune((jsonObject).get("nomCommune").toString());
				ville.setLatitude((jsonObject).get("latitude").toString());
				ville.setLongitude((jsonObject).get("longitude").toString());
				ville.setLibelle((jsonObject).get("libelle").toString());
				ville.setLigne((jsonObject).get("ligne").toString());
			
			}
			
			villes.add(ville);
		}
		
		
		return villes;
	}
}
