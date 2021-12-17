package com.functions;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.beans.Ville;

public class APIConnection {
	
	private String URL_GLOBALE = "http://localhost:8181/villes";
	private String URL_ONE_VILLE_CODE = "http://localhost:8181/villes/codeCommune";
	private String URL_ONE_VILLE_NOUN = "http://localhost:8181/villes/nomCommune";
	
	
	//Pour r�cup tous les enregistrements
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
	
	public Boolean updateOneVille(Ville ville) {
		System.out.println("update ville ");
		String responseStr=null;
	    //make POST request
		
	    String jsonContent = "{\"codeCommune\": \""+ville.getCodeCommune()+"\",\"nomCommune\": \""+ville.getNomCommune()+"\",\"codePostal\": \""+ville.getCodePostal()+"\",\"libelle\": \""+ville.getLibelle()+"\",\"ligne\": \""+ville.getLigne()+"\",\"latitude\": \""+ville.getLatitude()+"\",\"longitude\": \""+ville.getLongitude()+"\"}";
	    System.out.println(jsonContent);
	    try {
	    	
	    	URL url = new URL(URL_GLOBALE);
		    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		    
	    	connection.setDoOutput(true);
		    connection.setDoInput(true);
		    connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("PUT");
			connection.setRequestProperty("Content-Type", "application/json");
		    connection.setRequestProperty("charset", "utf-8");
		    connection.setRequestProperty("Content-Length", "" + Integer.toString(jsonContent.getBytes().length));
		    connection.setUseCaches(false);
		    OutputStreamWriter writer;
		    writer = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
		    
		    
		    writer.write(jsonContent);       
		    writer.close();
		    responseStr="Response code: "+connection.getResponseCode()+" and mesg:"+connection.getResponseMessage();

		    System.out.println(connection.getResponseMessage());

		    InputStream response;       
		    
		    if(connection.getResponseCode() == 200){
		        response = connection.getInputStream();
		        System.out.println("update ok");
		        connection.disconnect();
		        return true;
		    }else{
		        response = connection.getErrorStream();
		        System.out.println("update error");
		        connection.disconnect();
		        return false;
		    }
		    
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    return false;
	    
	}
	

	
}
