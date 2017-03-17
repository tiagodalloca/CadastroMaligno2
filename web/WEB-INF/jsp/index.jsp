<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					"http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Cadastro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
		<form action="Cadastro" method="POST">
			<input name="nome" type="text" placeholder="Nome"/><br/>
			<input name="som" type="text" placeholder="Som"/><br/>
			<input name="cheiro" type="text" placeholder="Cheiro"/><br/>
			<input name="submit" type="submit" value="Enviar"/>			
			<input type="hidden" name="_method" value="PUT" />
		</form>
		<br/><br/>
		<form action="Cadastro" method="POST">
			<input name="nome" type="text" value="" placeholder="Nome"/><br/>
			<input name="som" type="text" value="" placeholder="Som"/><br/>
			<input name="cheiro" type="text" value="" placeholder="Cheiro"/><br/>
			<input name="submit" type="submit" value="Enviar"/>
			<input type="hidden" name="_method" value="POST" />
		</form>
		<br/><br/>
		<form action="Cadastro" method="GET">
			<input name="nome" type="text" value="" placeholder="Nome"/><br/>
			<input name="submit" type="submit" value="Enviar"/>
		</form>
		<br/><br/>
		<form action="Cadastro" method="POST">
			<input name="nome" type="text" value="" placeholder="Nome"/><br/>
			<input name="submit" type="submit" value="Enviar"/>
			<input type="hidden" name="_method" value="DELETE" />
		</form>
		<style>
		input{
		border-radius: 5px;
		margin-bottom: 5px;
			}
		</style>
  </body>
</html>
