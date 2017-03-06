<%-- 
    Document   : cadastro
    Created on : 06/03/2017, 09:01:57
    Author     : u15194
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
		<spring:nestedPath path="name">
			<form action="Cadastro" method="POST">
				<spring:bind path="value">
					<input name="nome" type="text" value="" placeholder="Nome"/>
					<input name="som" type="text" value="" placeholder="Nome"/>
					<input name="cheiro" type="text" value="" placeholder="Nome"/>
					<input name="submit" type="submit" value=""/>
				</spring:bind>
			</form>
		</spring:nestedPath>
  </body>
</html>
