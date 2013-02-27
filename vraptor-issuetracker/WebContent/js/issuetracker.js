/**
 * Ajusta layout das mensagens de erro de acordo com Bootstrap. 
 */
$.validator.setDefaults({
	highlight: function(label) {
	    $(label).closest('.control-group').addClass('error');
	},
	success: function(label) {
		$(label).closest('.control-group').removeClass('error');
		$(label).remove();
	}
});