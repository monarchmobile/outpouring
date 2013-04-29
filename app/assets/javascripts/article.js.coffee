jQuery ->
# index
	$("#published_articles").sortable
    axis: "y"
    handle: ".handle"
    update: ->
      $.post $(this).data("update-url"), $(this).sortable("serialize")

  # starts at date
	$(".article_message_starts_at").datepicker(dateFormat: "dd-mm-yy")
	$("body").delegate ".article_message_starts_at", "click", ->
		$(this).datepicker(dateFormat: "dd-mm-yy")

	$("body").delegate ".article_message_starts_at", "change", ->
		$(this).closest("form").unbind('submit').submit()
		value = $(this).val()
		id_attr = $(this).parent().next().attr("id")
		id_array = id_attr.split("_")
		id = id_array[1]
		$("#message_"+id+"_starts_at_text").html(value)
		$(".article_message_starts_at").datepicker(dateFormat: "dd-mm-yy")

	# ends at date
	$(".article_message_ends_at").datepicker(dateFormat: "dd-mm-yy")
	$("body").delegate ".article_message_ends_at", "click", ->
		$(this).datepicker(dateFormat: "dd-mm-yy")

	$("body").delegate ".article_message_ends_at", "change", ->
		$(this).closest("form").unbind('submit').submit()
		value = $(this).val()
		id_attr = $(this).parent().next().attr("id")
		id_array = id_attr.split("_")
		id = id_array[1]
		$("#message_"+id+"_ends_at_text").html(value)
		$(".article_message_ends_at").datepicker(dateFormat: "dd-mm-yy")


	# select status
	$("body").delegate ".article_ajax_edit select", "change", ->
		$(this).closest("form").submit()

  # _form
	$("#article_starts_at").datepicker(dateFormat: "dd-mm-yy")
	$("#article_ends_at").datepicker(dateFormat: "dd-mm-yy")

	$("body").delegate "select#article_current_state", "change", ->
		if $(this).val() == "1"
			$("input[type=submit]").val("Save Draft")
			$(".schedule_container").hide()
		if $(this).val() == "2"
			$("input[type=submit]").val("Schedule For")
			$(".schedule_container").show()
		else if $(this).val() == "3"
			$("input[type=submit]").val("Publish Now")
			$(".schedule_container").hide()

	
	


