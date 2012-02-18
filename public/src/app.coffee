$ ->

  now.displayScore = (score) ->
    $('#scoring').append(" <li> <div class='alert alert-warning'> <p>Score: #{score.score}</p> </li>")
  now.displayTotal = (total) ->
    $('#totals').html('')
    $('#totals').append(" <li> <div class='alert alert-warning'> <p>Total: #{total}</p> </li>")
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

#Set Cookies
  heatNum =  $.cookie('heat_num')
  judgeName  =  $.cookie('judge_name')

# Ember.JS
  window.App = Ember.Application.create()
  window.App.scoreBoard = Ember.Object.create
    score : ''
    heatNum : heatNum
    judgeName : judgeName

  window.App.ScoreBoardView = Ember.View.extend
    heatNum : heatNum
    judgeName : judgeName

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

