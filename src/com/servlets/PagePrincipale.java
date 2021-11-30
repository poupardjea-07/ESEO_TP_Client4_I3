package com.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;




@WebServlet("/PagePrincipale")
public class PagePrincipale extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public PagePrincipale() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServéletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String myurl= "http://localhost:8182/villes/01001";

        URL url = new URL(myurl);
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
        System.out.println(result);
        
       
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject) parser.parse(result);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(jsonObject);
        System.out.println(jsonObject.get("nomCommune"));
        
        /*
        // On récupère le tableau d'objets qui nous concernent
        JSONArray array = new JSONArray(jsonObject.getString("personnes"));
        // Pour tous les objets on récupère les infos
        for (int i = 0; i < array.length(); i++) {
            // On récupère un objet JSON du tableau
            JSONObject obj = new JSONObject(array.getString(i));
            // On fait le lien Personne - Objet JSON
            Personne personne = new Personne();
            personne.setNom(obj.getString("nom"));
            personne.setPrenom(obj.getString("prenom"));
            // On ajoute la personne à la liste
            personnes.add(personne);
           
        }*/
		
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/pagePrincipale.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/pagePrincipale.jsp").forward(request, response);
	}

}
