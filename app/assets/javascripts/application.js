// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require comments
//= require bootstrap
//= require_tree .

$(function() {
	var clicked = false;
  var id = null;
  var isFormValid = null;
	
	$('#medication-tabs a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	})
	
	$('#modal-window').on('hidden.bs.modal', function () {
    $('#modal-window').empty();
  });
  
  $('.navbar-tooltip').tooltip();

/*
	$(document).on('click', '.header', function () {
		clicked = true;
	});

	$(document).on('page:load', function () {
		if (clicked==true) {
				$(document).foundation();
				console.log(clicked); 
				clicked = false;						
		}
	});
*/
   
});

