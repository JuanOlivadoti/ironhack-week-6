// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function handleOnSuccess (content) {
	var total_calories  = content.sandwich.total_calories;
	var new_ingredient  = content.ingredients[content.ingredients.length -1]
	var calories		= new_ingredient.calories;
	var name			= new_ingredient.name;

	total_calories += calories;

	$('[data-sandwich-id]').append('<li>'+name+'</li>');
	$('.js-total-calories').text(total_calories);
};

function handleOnError (error) {
	console.log(error);
};


$(document).on ("ready", function() {
	$('.js-view-details button').on ("click", function(event) {
		event.preventDefault;
		var sandwichId = $('[data-sandwich-id]').data('sandwich-id');
		var ingredientId = $(event.target).data('ingredient-id');

		$.ajax({
			type: "POST",
			url: `/api/sandwiches/${sandwichId}/ingredients/add`,
			data: {ingredient_id: ingredientId},
			success: handleOnSuccess,
			error: handleOnError
		})
	});
});