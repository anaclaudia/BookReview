var rating;

$(document).ready(function(){
	rating();
});


rating = function(){
	$('#rating').raty({
		path: '/assets/',
		scoreName: 'review[rating]'
	});
}
