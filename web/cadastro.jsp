<%-- 
    Document   : cadastro
    Created on : 27/03/2017, 09:47:05
    Author     : u15194
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="maligno.MeuResultSet"%>
<%@page import="java.util.AbstractMap"%>
<%@page import="maligno.DAO"%>
<%@page import="maligno.MeuPreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Cadastro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


		<%! public String solta(ServletRequest request) {
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

					if (method.toUpperCase().equals("PUT")){

						nome = request.getParameter("nome");
						som = request.getParameter("som");
						cheiro = request.getParameter("cheiro");

						m = new LinkedHashMap();
						m.put("nome", nome);
						m.put("som", som);
						m.put("cheiro", cheiro);

						DAO.Inserir(bd, "Peido01", m);
					} else if (method.toUpperCase().equals("POST")) {
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
					} else if (method.toUpperCase().equals("DELETE")) {

						m = new LinkedHashMap<String, String>();

						nome = request.getParameter("nome");

						m.put("nome", nome);

						DAO.Deleta(bd, "Peido01", m);
					} else if (method.toUpperCase().equals("GET")){
						try {
							nome = request.getParameter("nome");
							Entry e = new AbstractMap.SimpleEntry("nome", nome);

							MeuResultSet resultado = DAO.Pesquisa(bd, "Peido01", e);
							resultado.first();
							String s
								= "<h1>" + resultado.getString("nome") + "</h1>"
								+ "<hr/>"
								+ "Som: " + resultado.getString("som") + "<br/>"
								+ "Cheiro: " + resultado.getString("cheiro");
							return s;
						} catch (SQLException se) {
							return "Não existe resultados";
						}
					}

				} catch (Exception e) {
					return "Deu ruim...";
				}

				return "Sucesso!";
			}%>	

	</head>
	<body>
		<p><%=solta(request)%></p>
	</body>
</html>
