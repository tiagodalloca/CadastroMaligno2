<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">

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

  </head>
  <body>
		<div class="container-fluid">
			<div class="row"><form class="form-horizontal col-md-3" action="Cadastro" method="POST">
					<fieldset>

						<!-- Form Name -->
						<legend>Cadastro de flatulências</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="nome">Nome</label>  
							<div class="col-md-9">
								<input id="nome" name="nome" type="text" placeholder="Nome" class="form-control input-md" required="">
								<span class="help-block">Nome da flatulência</span>  
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="som">Som</label>  
							<div class="col-md-9">
								<input id="som" name="som" type="text" placeholder="Som" class="form-control input-md" required="">
								<span class="help-block">Som da flatulência</span>  
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="cheiro">Cheiro</label>  
							<div class="col-md-9">
								<input id="cheiro" name="cheiro" type="text" placeholder="Cheiro" class="form-control input-md" required="">
								<span class="help-block">Cheiro da flatulência</span>  
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9"><input class="btn btn-success" type="submit" value="Enviar"></div>
						</div>

					</fieldset>
					<input type="hidden" name="_method" value="PUT">
				</form></div>

			<div class="row"> <form class="form-horizontal col-md-3" action="Cadastro" method="GET">
					<fieldset>

						<!-- Form Name -->
						<legend>Pesquisa de flatulências</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="nome">Nome</label>  
							<div class="col-md-9">
								<input id="nome" name="nome" type="text" placeholder="Nome" class="form-control input-md" required="">
								<span class="help-block">Nome da flatulência</span>  
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9"><input class="btn btn-success" type="submit" value="Enviar"></div>
						</div>

					</fieldset>
					<input type="hidden" name="_method" value="GET">
				</form></div>

			<div class="row"><form class="form-horizontal col-md-3" action="Cadastro" method="POST">
					<fieldset>

						<!-- Form Name -->
						<legend>Atualização de flatulências</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="nome">Nome</label>  
							<div class="col-md-9">
								<input id="nome" name="nome" type="text" placeholder="Nome" class="form-control input-md" required="">
								<span class="help-block">Nome da flatulência</span>  
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="som">Som</label>  
							<div class="col-md-9">
								<input id="som" name="som" type="text" placeholder="Som" class="form-control input-md">
								<span class="help-block">Som da flatulência</span>  
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="cheiro">Cheiro</label>  
							<div class="col-md-9">
								<input id="cheiro" name="cheiro" type="text" placeholder="Cheiro" class="form-control input-md">
								<span class="help-block">Cheiro da flatulência</span>  
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9"><input class="btn btn-success" type="submit" value="Enviar"></div>
						</div>

					</fieldset>
					<input type="hidden" name="_method" value="POST">
				</form></div>

			<div class="row"> <form class="form-horizontal col-md-3" action="Cadastro" method="POST">
					<fieldset>

						<!-- Form Name -->
						<legend>Deleção de flatulências</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="nome">Nome</label>  
							<div class="col-md-9">
								<input id="nome" name="nome" type="text" placeholder="Nome" class="form-control input-md">
								<span class="help-block">Nome da flatulência</span>  
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9"><input class="btn btn-success" type="submit" value="Enviar"></div>
						</div>

					</fieldset>
					<input type="hidden" name="_method" value="DELETE">
				</form></div>
		</div>
  </body>
</html>
