
function validaForm(input, vmin, vmax, obrg, help)	{
	
	var objeto = input;
	var objhelp = document.getElementById(help);
	
	if (objeto.value == '' && obrg == 1)	{
		
		objeto.style.borderColor = "#ee5f5b";
		objhelp.style.visibility = 'visible';
		//alert('01'+objhelp.style.visibility);
		return false;
	}
	
	if (objeto.value != '' && objeto.value.length <= vmin)	{
		
		objeto.style.borderColor = "#ee5f5b";
		objhelp.style.visibility = 'visible';
		//alert('02'+objhelp.style.visibility);
		return false;
	}


	if (objeto.value != '' && objeto.value.length > vmax)	{
		
		objeto.style.borderColor = "#ee5f5b";
		objhelp.style.visibility = 'visible';
		//alert('03'+objhelp.style.visibility);
		return false;
	}
	
	objeto.style.borderColor = '#cccccc';
	objhelp.style.visibility = 'hidden';
	
}