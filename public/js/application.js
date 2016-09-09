$(document).ready(function() {
  generate();
});

function generate(){
	$('#generate_form').on('submit', function(event){
		event.preventDefault();
		
		var generateForm = $(this);
		var generateFormUrl = $(this).attr("action");

		var request = $.ajax({
			method: 'GET', 
			url: generateFormUrl
		});

		request.done(function(response){
			$('#last_min_append').append(response);
		});
	});
}



function enterForm(){
  $('#new-post-form').on('submit', function(event){
    event.preventDefault();

    var newpostForm = $(this);
    var commentFormUrl = $(this).attr("action");
    var commentFormData = $(this).serialize();

    var request = $.ajax({
      method: 'POST',
      url: commentFormUrl,
      data: commentFormData
    });

    request.done(function(response){
      console.log(newpostForm);
      $('#post-list').prepend(response);
      $('#new-post-form')[0].reset();
    });

    request.fail(function(response) {
      console.log("failed");
    });
  });
}