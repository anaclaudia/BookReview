var FormRating;
var ViewRating;

$(document).ready(function(){
	FormRating();
	ViewRating();
});

FormRating = function(){
	$('#rating').raty({
		path: '/assets/',
		scoreName: 'review[rating]'
	});
}

ViewRating = function() {
	$('.review-rating').raty({
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		},
		path: '/assets/'	
	});
}
