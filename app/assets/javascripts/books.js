var rating;

$(document).ready(function(){
	rating();
}

rating = function() {
	$('.review-rating').raty({
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		},
		path: '/assets/'	
	});
}
