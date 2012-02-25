$ ->
  now.displayScoreYellow = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-yellow'> <p>#{score.wave_count} #{score.judge_name} #{score.score}</p> </li>")
  now.displayScoreRed = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-red'> <p>#{score.wave_count} #{score.judge_name} #{score.score2}</p> </li>")
  now.displayScoreGreen = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-green'> <p>#{score.wave_count} #{score.judge_name} #{score.score3}</p> </li>")
  now.displayScoreBlue = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-blue'> <p>#{score.wave_count} #{score.judge_name} #{score.score4}</p> </li>")
  now.displayScoreWhite = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-white'> <p>#{score.wave_count} #{score.judge_name} #{score.score5}</p> </li>")
  now.displayScoreOrange = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-orange'> <p>#{score.wave_count} #{score.judge_name} #{score.score6}</p> </li>")

  now.displayTotal = (total) ->
    $('#totals').html('')
    $('#totals').append(" <li> <div class='alert alert-warning'> <p>#{total}</p> </li>")
  hideCurrent = ->
    # current page fade
    $('.page.current').fadeOut(500).removeClass('current')
    $('.nav li').removeClass('active')

  showPage = (page) ->
    show = -> 
      $(".nav li a[href=#{page}]").parent().addClass('active')
      $(page).addClass('current').fadeIn(1000)
    setTimeout( show, 1000)

  $('.nav li a').click ->
    hideCurrent()
    showPage($(this).attr('href'))

  $('.nav li').removeClass('active')
  showPage(window.location.hash || '#home')

  # Select surfer by color menu
  $("#surfer").bind('click', () -> $("#colors").fadeIn(500))

#Set Cookies
  heatNum =  $.cookie('heat_num')
  judgeName  =  $.cookie('judge_name')
  heatNum =  $.cookie('heat_num')
  surfer1 =  $.cookie('surfer_1')
  surfer2 =  $.cookie('surfer_2')
  surfer3 =  $.cookie('surfer_3')
  surfer4 =  $.cookie('surfer_4')
  surfer5 =  $.cookie('surfer_5')
  surfer6 =  $.cookie('surfer_6')

# Ember.JS
  window.App = Ember.Application.create()
  window.App.scoreBoard = Ember.Object.create
    score : ''
    surfer: ''
    heatNum : heatNum
    judgeName : judgeName
    surfer1 : surfer1
    surfer2 : surfer2
    surfer3 : surfer3
    surfer4 : surfer4
    surfer5 : surfer5
    surfer6 : surfer6

  window.App.ScoreBoardView = Ember.View.extend
    heatNum : heatNum
    judgeName : judgeName
    #score1 : score1
    #score2 : score2
    #score3 : score3
    #score4 : score4
    #score5 : score5
    #score6 : score6

    surfer1 : surfer1
    surfer2 : surfer2
    surfer3 : surfer3
    surfer4 : surfer4
    surfer5 : surfer5
    surfer6 : surfer6

    change: ->
      @set 'score', $('input[name=score]').val()
    submit: ->
      @set 'score', $('input[name=score]').val()
      @$('form').ajaxSubmit
        success: (resp) ->
          if resp.errors?
            $('.scoreboard-errors').addClass('alert').addClass('alert-error').html (error.message for error in resp.errors).join('<br />')
          else
            $('.scoreboard-errors').removeClass('alert').removeClass('alert-error').html ''
            $('form').resetForm()
      false

