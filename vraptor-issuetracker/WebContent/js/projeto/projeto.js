$(document).ready(function() {
	$("#form").validate({
		rules : {
			"projeto.nome" : {
				required : true,
				minlength : 10
			}
		}
	});
});