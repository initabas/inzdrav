# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).on 'click', "a[class^='close_comment_form-']", ->
		id = $(this).attr('class').replace('close_comment_form-','')
		$('#new_comment-'+id).remove()
		$('#new_comment_link-'+id).show()

	$(document).on 'click', "a[class^='close_comment_edit_form-']", ->
		id = $(this).attr('class').replace('close_comment_edit_form-','')
		$('#edit_comment-'+id).remove()
		$('#comment_content-'+id).show()
