function buildTourneyHtml (tournament) {
  return '\
    <li>\
      <a href="/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
      <button data-hook="tourney-delete" class="btn btn-danger" type="submit" name="tournament" value="'+  tournament.id + '">DELETE</button>\
    </li>\
  '

}
