package com.functions;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class APIConnection {
	
	private String URL_GLOBALE = "http://localhost:8181/villes";
	private String URL_ONE_VILLE_CODE = "http://localhost:8181/villes/codeCommune";
	private String URL_ONE_VILLE_NOUN = "http://localhost:8181/villes/nomCommune";
	

	//Pour récup tous les enregistrements
	public JSONArray getAllRows() throws IOException {
		System.out.println("coucou");
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
	

	
}
