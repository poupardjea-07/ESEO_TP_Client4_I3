package com.functions;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.http.HttpClient;

import org.apache.catalina.WebResource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.beans.Ville;

public class APIConnection {
	
	private String URL_GLOBALE = "http://localhost:8181/villes";
	private String URL_ONE_VILLE_CODE = "http://localhost:8181/villes/codeCommune";
	private String URL_ONE_VILLE_NOUN = "http://localhost:8181/villes/nomCommune";
	

	//Pour récup tous les enregistrements
	public JSONArray getAllRows() throws IOException {
        URL url = new URL(URL_GLOBALE);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.connect();
        InputStream inputStream = connection.getInputStream();
        
        final StringBuilder out = new StringBuilder(); 
        final byte[] buffer = new byte[inputStream.available()]; 
        try {
            for (int ctr; (ctr = inputStream.read(buffer)) != -1;) {
                out.append(new String(buffer, 0, ctr));
            }
        } catch (IOException e) {
            throw new RuntimeException("Cannot convert stream to string", e);
        }
        
        String result = out.toString();        
       
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = null;
		try {
			jsonArray = (JSONArray) parser.parse(result);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(jsonArray);
		return jsonArray;
	}
	
	public JSONObject getOneVille(String code) {
		
		return null;
	}
	
	public void sendJSONtoModifyVille(Ville ville) throws IOException {
		
		String codeCommune = ville.getCodeCommune();
		String nom = ville.getNomCommune();
		String codePostal = ville.getCodePostal();
		String latitude = ville.getCodeCommune();
		String longitude = ville.getCodeCommune();
		String libelle = ville.getCodeCommune();
		String ligne = ville.getLigne();
		
		System.out.println("je vais modifier...");
		
		URI uri = null;
		try {
			System.out.println("testURI");
			uri = new URI(
				      "http", 
				      "localhost:8181", 
				      "/ville?codeCommune="+codeCommune+"&nom="+nom+"&cp="+codePostal+"&libelle="+libelle+"&ligne="+ligne+"&latitude="+latitude+"&longitude="+longitude);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		URL url = uri.toURL();
		
		//URL url = new URL("http://127.0.0.1:8181/ville?codeCommune="+codeCommune+"&nom="+nom+"&cp="+codePostal+"&libelle="+libelle+"&ligne="+ligne+"&latitude="+latitude+"&longitude="+longitude);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("PUT");
		conn.setRequestProperty("Accept", "application/json");
					
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}
		
		System.out.println("Output from Server .... \n");			

		conn.disconnect();

    }


	
}
