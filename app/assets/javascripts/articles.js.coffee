# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery -> 
	$(".articles").click ->
		$(this).submit()  if $(this).not(":checked")
		$("input.articles").not(this).removeAttr("checked").submit()

	$("input.articles:checked").closest("ul.model_table li").css("background", "blue")
		
	
	


