/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maligno;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author u15194
 */
public class Cadastro extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		PrintWriter w = response.getWriter();
		
		try {
			MeuPreparedStatement bd = new MeuPreparedStatement(
				"com.microsoft.sqlserver.jdbc.SQLServerDriver",
				"jdbc:sqlserver://regulus:1433;databasename=BD15191",
				"BD15191", "uregis191");

			String method = request.getParameter("_method");

			String sql;

			String nome;
			String som;
			String cheiro;

			switch (method.toUpperCase()) {
				case "PUT":
					sql = "INSERT INTO Peido01 values(?, ?, ?)";
					bd.prepareStatement(sql);

					nome = request.getParameter("nome");
					som = request.getParameter("som");
					cheiro = request.getParameter("cheiro");

					bd.setString(1, nome);
					bd.setString(2, som);
					bd.setString(3, cheiro);
					bd.executeUpdate();
					bd.commit();
					break;
				case "POST":
					bd.executeUpdate();
					bd.commit();
					break;

				case "DELETE":
					nome = request.getParameter("nome");

					sql = "DELETE Peido01 WHERE nome=?";
					bd.prepareStatement(sql);
					bd.setString(1, nome);
					bd.executeUpdate();
					bd.commit();
					break;
			}

		} catch (Exception e) {
			w.println("Deu ruim...");
			return;
		}
		
		w.println("Sucesso!");
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		try {
			MeuPreparedStatement bd = new MeuPreparedStatement(
				"com.microsoft.sqlserver.jdbc.SQLServerDriver",
				"jdbc:sqlserver://regulus:1433;databasename=BD15191",
				"BD15191", "uregis191");

			String sql;

			String nome = request.getParameter("nome");

			sql = "SELECT * FROM Peido01 WHERE nome=?";
			bd.prepareStatement(sql);
			bd.setString(1, nome);

			MeuResultSet resultado = (MeuResultSet) bd.executeQuery();
			
			resultado.first();

			PrintWriter w = response.getWriter();
			w.println("<h1>" + resultado.getString("nome") + "</h1>");
			w.println("<hr/>");
			w.println("Som: " + resultado.getString("som") + "<br/>");
			w.println("Cheiro: " + resultado.getString("cheiro"));

		} catch (Exception e) {
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
