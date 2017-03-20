/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maligno;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.LinkedHashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Map.Entry;

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
		LinkedHashMap m;

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

					nome = request.getParameter("nome");
					som = request.getParameter("som");
					cheiro = request.getParameter("cheiro");

					m = new LinkedHashMap();
					m.put("nome", nome);
					m.put("som", som);
					m.put("cheiro", cheiro);

					DAO.Inserir(bd, "Peido01", m);

					break;
				case "POST":
					nome = request.getParameter("nome");
					som = request.getParameter("som");
					cheiro = request.getParameter("cheiro");

					m = new LinkedHashMap();
					m.put("nome", nome);

					if (!som.isEmpty()) {
						m.put("som", som);
					}
					if (!cheiro.isEmpty()) {
						m.put("cheiro", cheiro);
					}

					DAO.Atualiza(bd, "Peido01", new AbstractMap.SimpleEntry("nome", nome), m);
					bd.executeUpdate();
					bd.commit();
					break;

				case "DELETE":
					nome = request.getParameter("nome");

					m = new LinkedHashMap<String, String>();
					m.put("nome", nome);

					DAO.Deleta(bd, "Peido01", m);
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
		PrintWriter w = response.getWriter();

		try {
			MeuPreparedStatement bd = new MeuPreparedStatement(
				"com.microsoft.sqlserver.jdbc.SQLServerDriver",
				"jdbc:sqlserver://regulus:1433;databasename=BD15191",
				"BD15191", "uregis191");

			String nome = request.getParameter("nome");
			Entry e = new AbstractMap.SimpleEntry("nome", nome);

			MeuResultSet resultado = DAO.Pesquisa(bd, "Peido01", e);

			try {
				resultado.first();

				w.println("<h1>" + resultado.getString("nome") + "</h1>");
				w.println("<hr/>");
				w.println("Som: " + resultado.getString("som") + "<br/>");
				w.println("Cheiro: " + resultado.getString("cheiro"));
			}
			
			catch(SQLException se){
				w.println("Não existe resultados");
			}

		} catch (Exception e) {
			w.println("Deu ruim...");
			return;
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
