package com.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.beans.Ville;
import com.beans.Commune;
import com.functions.APIConnection;
import com.functions.UtilsFunction;




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
		
		APIConnection apiConnection = new APIConnection();
		JSONArray jsonArray = new JSONArray();
		try {
			jsonArray = apiConnection.getAllRows();
		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject jsonObject = (JSONObject) jsonArray.get(0);
		//Object nomCommune = jsonObject.get("nomCommune");
        //System.out.println(nomCommune);
		System.out.println(jsonObject);
        
        List<Commune> communes = Arrays.asList(
        		new Commune(jsonObject.get("codeCommune"), jsonObject.get("nomCommune"), jsonObject.get("codePostal"), jsonObject.get("libelle"), jsonObject.get("ligne"), jsonObject.get("latitude"), jsonObject.get("longitude")));
        
        request.setAttribute("communes", communes);
        
		this.getServletContext().getRequestDispatcher("/WEB-INF/pagePrincipale.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/pagePrincipale.jsp").forward(request, response);
	}

}
