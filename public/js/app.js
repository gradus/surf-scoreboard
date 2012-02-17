(function() {

  $(function() {
    var hideCurrent, showPage;
    now.displayScore = function(score) {
      return $('#scoring').append(" <li> <div class='alert alert-warning'> <p>Score: " + score.score + "</p> </li>");
    };
    now.displayTotal = function(total) {
      $('#totals').html('');
      return $('#totals').append(" <li> <div class='alert alert-warning'> <p>Total: " + total.total + "</p> </li>");
    };
    hideCurrent = function() {
      $('.page.current').fadeOut(500).removeClass('current');
      return $('.nav li').removeClass('active');
    };
    showPage = function(page) {
      var show;
      show = function() {
        $(".nav li a[href=" + page + "]").parent().addClass('active');
        return $(page).addClass('current').fadeIn(1000);
      };
      return setTimeout(show, 1000);
    };
    $('.nav li a').click(function() {
      hideCurrent();
      return showPage($(this).attr('href'));
    });
    $('.nav li').removeClass('active');
    showPage(window.location.hash || '#home');
    window.App = Ember.Application.create();
    window.App.scoreBoard = Ember.Object.create({
      score: ''
    });
    return window.App.ScoreBoardView = Ember.View.extend({
      change: function() {
        return this.set('score', $('input[name=score]').val());
      },
      submit: function() {
        this.set('score', $('input[name=score]').val());
        this.$('form').ajaxSubmit({
          success: function(resp) {
            var error;
            if (resp.errors != null) {
              return $('.scoreboard-errors').addClass('alert').addClass('alert-error').html(((function() {
                var _i, _len, _ref, _results;
                _ref = resp.errors;
                _results = [];
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                  error = _ref[_i];
                  _results.push(error.message);
                }
                return _results;
              })()).join('<br />'));
            } else {
              $('.scoreboard-errors').removeClass('alert').removeClass('alert-error').html('');
              return $('form').resetForm();
            }
          }
        });
        return false;
      }
    });
  });

}).call(this);
