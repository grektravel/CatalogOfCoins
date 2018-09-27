<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Каталог монет</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
	

<script type="text/javascript" src="js/main.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
			<div class="header clearfix">
		        <form id="logout" action='<@spring.url "/logout"/>' method="POST" class="nav nav-pills pull-right">
					<button type="submit" class="btn btn-default">Выйти</button>
				</form>
				<div id="logo">
		        	<h3>Каталог монет</h3>
		        </div>
     		</div>				
				<table id="list_coins" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>№</th>
							<th>Валюта</th>
							<th>Номинал</th>
							<th>Год</th>
							<th>Монетный двор</th>
							<th><span class="glyphicon glyphicon-tasks" data-toggle='tooltip' title='Действия'></span></th>
						</tr>
					</thead>
				</table>
				<div id="modal-dialog" class="modal fade" tabindex="-1"
					role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body">
								<form id="popup" class="form-horizontal" method="post"
									role="form">
									<div id="id" class="form-group">
										<label class="col-sm-3 control-label" for="id">№</label>
										<div class="col-sm-9">
											<input type="text" pattern="\d*" class="form-control" name="id"/>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="currency">Валюта</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="currency"
												required="required" data-error="Это поле обязательно"/>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="value">Номинал</label>
										<div class="col-sm-9">
											<input type="text" pattern="\d*" maxlength="4" class="form-control" name="value"
												required="required" data-error="Введите правильное значение номинала"/>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="year">Год</label>
										<div class="col-sm-9">
											<input type="text" pattern="\d*" maxlength="4" class="form-control" name="year"
												required="required" data-error="Введите правильное значение года"/>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="mint">Монетный двор</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="mint"
												required="required" data-error="Это поле обязательно"/>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="description">Описание</label>
										<div class="col-sm-9">
											<textarea class="form-control" name="description" rows="5"></textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Закрыть</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					>
				</div>
				<div id="modal-confirm" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">Удаление монеты</h4>
							</div>
							<div class="modal-body"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Отмена</button>
								<button id="btn-confirm" type="button" class="btn btn-primary">Удалить</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>