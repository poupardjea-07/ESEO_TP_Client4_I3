package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.beans.Commune;
import com.beans.Ville;
import com.forms.ModifierVilleForm;
import com.functions.APIConnection;
import com.functions.UtilsFunction;

/**
 * Servlet implementation class PageEditDonneesVille
 */
@WebServlet("/PageEditDonneesVille")
public class PageEditDonneesVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageEditDonneesVille() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String code;
		code = request.getParameter("code");
		
		APIConnection apiConnection = new APIConnection();
		JSONArray jsonArray = new JSONArray();
		try {
			jsonArray = apiConnection.getAllRows();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Ville ville = new Ville();
		for(Object object : jsonArray) {
			JSONObject jsonObject = (JSONObject) object;
			if (jsonObject.get("codeCommune").toString().equals(code)) {
				ville.setCodeCommune((jsonObject).get("codeCommune").toString());
				ville.setCodePostal((jsonObject).get("codePostal").toString());
				ville.setNomCommune((jsonObject).get("nomCommune").toString());
				ville.setLatitude((jsonObject).get("latitude").toString());
				ville.setLongitude((jsonObject).get("longitude").toString());
				ville.setLibelle((jsonObject).get("libelle").toString());
				ville.setLigne((jsonObject).get("ligne").toString());
			}
		}
		
		request.setAttribute("ville", ville);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/editDonneesVille.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("modifier") != null) {
			ModifierVilleForm form = new ModifierVilleForm();
			form.modifVille(request);
		}
		
		APIConnection apiConnection = new APIConnection();
		JSONArray jsonArray = new JSONArray();
		try {
			jsonArray = apiConnection.getAllRows();
		} catch (IOException e) {
			e.printStackTrace();
		}
		UtilsFunction utils = new UtilsFunction();
		List<Ville> communes = utils.convertJsonArrayToListVille(jsonArray);
		
		request.setAttribute("communes", communes);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/pagePrincipale.jsp").forward(request, response);
	}

}
