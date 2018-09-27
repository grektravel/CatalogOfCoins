<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Catalog of coins</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-header">
					<#if error>
						<div class="alert alert-danger" role="alert">Неправильное имя пользователя или пароль</div>
					</#if>
				</div>
				<h3 class="form-login-heading">Авторизация</h3>
				<div id="login" class="panel panel-default">					
					<div class="panel-body">
						<form role="form" method="post" class="form-login">
							<div class="form-group">
								<div class="input-group">
      								<div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
									<input type="text" class="form-control" id="username" placeholder="Имя пользователя" name="username">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
      								<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
									<input type="password" class="form-control" id="password" placeholder="Пароль" name="password">
								</div>
							</div>
							<button type="submit" class="form-control btn btn-primary btn-block">Войти</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>