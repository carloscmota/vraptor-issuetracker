$(document).ready(function() {
	$("#form").validate({
		rules : {
			"usuario.nome" : {
				required : true,
				minlength : 5
			},
			"usuario.login" : {
				required : true,
				minlength : 3
			},
			"usuario.email" : {
				required : true,
				email : true
			},
			"usuario.senha" : {
				minlength : 6,
				required : true
			},
			"confirmasenha" : {
				required : true,
				equalTo : "#senha"
			}
		}
	});
});