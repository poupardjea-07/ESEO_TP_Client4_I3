package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.beans.Ville;
import com.forms.ModifierVilleForm;
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
		
		UtilsFunction utils = new UtilsFunction();
		List<Ville> communes = utils.convertJsonArrayToListVille(jsonArray);
		System.out.println("doget principal");
        
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
