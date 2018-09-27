$(function() {

	$.ajax({
        url: "api/coins/edit",
        type: "POST",
        complete: function(xhr, textStatus) {
        	var admin = xhr.status !== 403;
        	var table = initDateTable(admin);
        	setEvents(table, admin);
        } 
	});	
	
	function initDateTable(admin) {
		var dataTableOptions = {
		   language: {
			   url: "dt/russian.json"
		    },
	        ajax: {
	            url: "api/coins",
	            dataSrc: "data"
	        },
	        columns: [
	            { data: "id" },
	            { data: "currency" },
	            { data: "value" },
	            { data: "year" },
	            { data: "mint" },
	            { data: null }
	        ],
	        columnDefs: [ {
	            targets: -1,
	            width: 20
	        } ],
	        searching: false,
	        ordering:  false,
	        serverSide: true,
	        processing : true
		};
		var html = admin ? "<div class='panel-admin'>" : "<div class='panel-user'>";
		html+="<a href='#' class='dt-view act'><span class='glyphicon glyphicon-info-sign' data-toggle='tooltip' title='Посмотреть информацию'></span></a>";
		if (admin) {
			html+="<a href='#' class='dt-edit act'><span class='glyphicon glyphicon-pencil' data-toggle='tooltip' title='Редактировать монету'></span></a>" +
				"<a href='#' class='dt-delete act'><span class='glyphicon glyphicon-remove red' title='Удалить монету'></span>";
		}
		html+="</div>";
		dataTableOptions.columnDefs[0].defaultContent = html;
		return $('#list_coins').DataTable(dataTableOptions);
	}
	
	
	function setEvents(table, admin) {
		
		var modalDialog = $("#modal-dialog");
		var modalConfirm = $("#modal-confirm");
		var form = $("#modal-dialog form");
		
		table.on("draw.dt",function() {
			console.log("draw.dt");
			$(".dt-edit").each(function(){
		        $(this).click(function() {
		            var data = table.row($(this).parents('tr')).data();
		            modalDialog.find(".modal-title").text("Редактирование монеты №"+data.id);
		            modalDialog.find(".modal-footer").append("<input name='edit' type='submit' class='btn btn-primary' value='Сохранить'/>");
		            fillForm(form, data);
		            form.find("input,textarea").attr("readonly", false);		        
		            form.off();
		            form.validator().on('submit', function(e) {
		            	if (!e.isDefaultPrevented()) {
			            	e.preventDefault();
			            	$.post({
			                    url: "api/coins/edit",
			                    data: form.serialize(),
			                    success: function(result) {
			                    	table.draw(false);
			                    	modalDialog.modal("hide");
			                    },
			                    error: function(jqXHR, exception) {
			                    	console.log(jqXHR);
			                    }
			                });
		            	}		            	
		            });
		            showModal(modalDialog);
		        });
		    });
			$(".dt-view").each(function(){
		        $(this).click(function() {
		            var data = table.row($(this).parents('tr')).data();
		            modalDialog.find(".modal-title").text("Монета №"+data.id);
		            form.find("input,textarea").attr("readonly", true);
		            fillForm(form, data);
		            showModal(modalDialog);
		        });
		    });
			$(".dt-delete").each(function(){
		        $(this).click(function() {
		        	var data = table.row($(this).parents('tr')).data();
		        	modalConfirm.find(".modal-body").text("Вы действительно хотите удалить монету №"+ data.id);
		        	$("#btn-confirm").one("click", function() {
		        		$.ajax({
		        	        url: "api/coins/delete/"+ data.id,
		        	        type: "DELETE",
		        	        success: function(result) {
		        	        	table.draw(false);
		        	        	modalConfirm.modal("hide");
		        	        },
		        	        error: function(jqXHR, exception) {
			                    console.log(jqXHR);
			                }
		        		});
		        	});
		        	showModal(modalConfirm);
		        });
		    });
		});
		
		table.on("init.dt",function() {
			console.log("init");
			var rowPanel = "<div id ='panel-btns'>";
			if (admin) {
				rowPanel+= "<a id='dt-add' class='act' href='#'><span class='glyphicon glyphicon-plus data-toggle='tooltip' title='Добавить монету'></span></a>"
			}
			rowPanel+="<a id='dt-show-all' class='act' href='#'><span class='glyphicon glyphicon-refresh data-toggle='tooltip' title='Просмотреть все'></span></a>" +
				"<a id='dt-search' class='act' href='#'><span class='glyphicon glyphicon-search data-toggle='tooltip' title='Поиск'></span></a></div>";
			$('#list_coins_wrapper div.row:first-child div:nth-child(2)').append(rowPanel);
			
			$("#dt-add").click(function() {
				modalDialog.find(".modal-title").text("Добавление монеты");
				modalDialog.find(".modal-footer").append("<input name='edit' type='submit' class='btn btn-primary' value='Добавить'/>");
				form.find("input,textarea").attr("readonly", false);
				form[0].reset();			
				form.off();
				form.validator().on('submit', function(e) {
					if (!e.isDefaultPrevented()) {
			        	e.preventDefault();
			        	$.post({
			                url: "api/coins/add",
			                data: form.serialize(),
			                success: function(result) {
			                	table.draw(false);
			                	modalDialog.modal("hide");
			                },
			                error: function(jqXHR, exception, error) {
			                	console.log(jqXHR);
			                }
			            });
					}		        	
		        });
				showModal(modalDialog);
			});
			
			$("#dt-search").click(function() {
				modalDialog.find(".modal-title").text("Поиск монет");
				modalDialog.find(".modal-footer").append("<input name='edit' type='submit' class='btn btn-primary' value='Искать'/>");
				form.find("input,textarea").attr("readonly", false);
				form[0].reset();
				form.find("#id").show();
				form.find("input[type='submit']").click(function(e) {
		        	e.preventDefault();
		        	table.ajax.url("api/coins/search?"+form.serialize()).load();
		        	modalDialog.modal("hide");
		        });	
				showModal(modalDialog);
			});
			
			$("#dt-show-all").click(function() {
				table.ajax.url("api/coins").load();
			});
		});		
	}
	
		
	function fillForm(form, data) {
		form.find("input[name='id']").val(data.id);
		form.find("input[name='currency']").val(data.currency);
		form.find("input[name='value']").val(data.value);
		form.find("input[name='year']").val(data.year);
		form.find("input[name='mint']").val(data.mint);
		form.find("textarea[name='description']").val(data.description);
	};
	
	function showModal(block) {
		block.modal({
			show: true,
            keyboard: false,
            backdrop: "static"
        }); 
	};

	$("#modal-dialog").on("hidden.bs.modal", function (e) {
		$(this).find("form").validator("destroy");
		$(this).find("input[type='submit']").remove();
		$(this).find("#id").hide();
	});	
});
