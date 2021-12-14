package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.beans.Ville;
import com.functions.APIConnection;
import com.functions.UtilsFunction;

/**
 * Servlet implementation class PageComparatifVille
 */
@WebServlet("/PageComparatifVille")
public class PageComparatifVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageComparatifVille() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		APIConnection apiConnection = new APIConnection();
		JSONArray jsonArray = new JSONArray();
		try {
			jsonArray = apiConnection.getAllRows();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		UtilsFunction utils = new UtilsFunction();
		List<Ville> villes = utils.convertJsonArrayToListVille(jsonArray);	
		
		session.setAttribute("listeVille", villes);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/comparatif.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/comparatif.jsp").forward(request, response);
	}

}
