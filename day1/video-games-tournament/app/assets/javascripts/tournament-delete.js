function deleteTournament (event) {
	var tournamentId = event.target.value;
	console.log(tournamentId);

	var request = $.ajax({
      url: '/api/tournaments',
      type: 'DELETE',
      data: {id: tournamentId},
      success: updateList
    });
}

function updateList() {
	var $tourneySection = $('.tourney-list');
	$tourneySection.empty();
	console.log("hola caracola");
	tournamentsIndex();
}