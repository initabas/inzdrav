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
//= require foundation
//= require turbolinks
//= require comments
//= require_tree .
  $(document).foundation();
$(function() {
	var clicked = false;
  var id = null;
  var isFormValid = null;
			

    
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
   
    $(document).on("opened", "div.reveal-modal", function() {
        id = $(this).attr('id');
        
        $("#" + id).on("submit", "form", function(e) {
            e.preventDefault();
            isFormValid = true;
            $("#" + id + " form .input").each(function(index, value){
                if ($(value).val().length == 0){
                    console.log(value); 
                    $(value).addClass("highlight");
                    isFormValid = false;
                } else {
                    $(value).removeClass("highlight");
                }
            });
            
            //console.log(id + " " + isFormValid);
			
            if(isFormValid==true){
              	$.ajax($(this).attr('action'), {
              	  	async: false,
                		cache: false,
                		data: $(this).serialize(),
                		dataType: 'html',
                		type: 'POST',
						
                		success: function (data, textStatus, jqXHR) {
            				// hide modal form
            				$("#" + id).foundation('reveal', 'close');   
							//$("[id='help']").html("<%= escape_javascript(render :partial => 'medications/buttons') %>")                       
							location.reload();
                            //$("[id='help']").fadeOut('slow').load(location.href+" [id='help']>*", "").fadeIn("slow");
                		},

  					  	error: function () {
                            $("#" + id + "form input").each(function(index, value){
                                var id = $(this).attr('id');
                                if (id != 'submit-button'){
                                    $(value).addClass("highlight");
                                };
                            });
                            $("div #flash").html("<span class='alert-box alert'><b>Ошибка авторизации! </b><br>Проверьте правильность введенных данных!</span>");
            
                		}
            	})
            	return false;
            } else {
            	$("div #flash").html("<span class='alert-box alert'><b>Заполните все поля! </b></span>");
            }
        });
    });

});

