jQuery ->
# index

	if $("select#page_current_state").val() == "2"
		$(this).parent().next(".schedule_container").show()
	else
		$(this).parent().next(".schedule_container").hide()

	$("body").delegate "select#page_current_state", "change", ->
		console.log("hi")
		if $(this).val() == "1"
			$("input[type=submit]").val("Save Draft")
			$(this).parent().next(".schedule_container").hide()
		if $(this).val() == "2"
			$("input[type=submit]").val("Schedule For")
			$(this).parent().next(".schedule_container").show()
		else if $(this).val() == "3"
			$("input[type=submit]").val("Publish Now")
			$(this).parent().next(".schedule_container").hide()

  $("#published_pages").sortable
    axis: "y"
    handle: ".handle"
    update: ->
      $.post $(this).data("update-url"), $(this).sortable("serialize")

	# select status
  $("body").delegate ".page_ajax_edit select", "change", ->
    $(this).closest("form").submit()
    $("#published_pages").sortable
    	axis: "y"
	    handle: ".handle"
	    update: ->
	      $.post $(this).data("update-url"), $(this).sortable("serialize")
	      console.log("2nd sort")

	

	# page links
  $("body").delegate ".page_ajax_edit .page_link_checkbox", "change", ->
    $(this).closest("form").submit ->
    	return

  # page links
  $("body").delegate ".page_ajax_edit .page_link_location", "click", ->
	  checkbox = $(this).prev()
	  attr_checked = checkbox.attr("checked")
	  console.log(attr_checked)
	  if attr_checked && attr_checked == "checked"
	    checkbox.removeAttr "checked"
	    checkbox.closest("form").submit()
	  else
	    checkbox.attr "checked", "checked"
	    checkbox.closest("form").submit()

	

	$("#page_starts_at").datepicker
	        dateFormat: 'yy-mm-dd'
	$("#page_ends_at").datepicker
	        dateFormat: 'yy-mm-dd'



	    