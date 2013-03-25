# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery -> 
	$(".articles").click ->
		$(this).submit()  if $(this).not(":checked")
		$("input.articles").not(this).removeAttr("checked").submit()

	$("input.articles:checked").closest("ul.model_table li").css({"border": "4px solid #be6208"})

	

	$('#article_schedule_in').datepicker()
	$( "#format" ).change ->
      $( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );


	$('#article_schedule_out').datepicker
		dateFormat: 'yy-mm-dd'

	
		
	
	


