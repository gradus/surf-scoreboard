$ ->
  now.newScore = (score) ->
      $('#score').prepend """
      <li>
        <div class='alert alert-warning'>
        <p>Score: #{score.id}</p>
      </li>
      """
