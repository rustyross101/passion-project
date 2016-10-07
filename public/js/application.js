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


