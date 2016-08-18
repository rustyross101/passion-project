$(document).ready(function() {
//   // This is called after the document has loaded in its entirety
//   // This guarantees that any elements we bind to will exist on the page
//   // when we try to bind to them

//   // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
//   $.get('http://swapi.co/api/planets/', function(response) {
//   	var my_obj = response;
//   	var array = my_obj.results;
//   	var sample = array[Math.floor(Math.random()*array.length)];
//   	console.log(sample.name);
//   });
//   generateListener();
// });

function generateListener() {

	$('.generate').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			method: 'get',
			url: '/sessions/new'
			//get response data 
		})
		.done(function(serverResponse){
			console.log(serverResponse);

			$(".home").append(serverResponse);
		});
	});
}
generateListener();
});


// var randomFiveNumbers = _.sample(x, 5);
// x[Math.floor(Math.random()*x.length)];
