//= require jquery
//= require_tree .

var AjaxView = function(){
}

AjaxView.prototype.article = function(html){
  $('article').html(html);
}

AjaxView.prototype.moveShip = function(){
  $('input[name="answer"]').focus();
  moveShipLeft();
}

AjaxView.prototype.updateDashboardLink = function(){
  var id =$('#bio-box h1').attr('id');
  var path = "/users/" + id
  $('a#dashboard').attr('href', path);
}

AjaxView.prototype.toggleNavigationLinks = function(){
  $('.private').toggle();
  $('li.public').toggle();
}

var AjaxController = function(){
  this.view = new AjaxView
}

AjaxController.prototype.bindForms = function(){
  $('main').on("submit", 'form', function(submit_event){
    submit_event.preventDefault();
    var data = $(this).serialize();
    var path = $(this).attr('action');
    var route = $(this).attr('method');
    var form = $(this);

    $.ajax({
      url: path,
      method: route,
      data: data
    }).done(function(responseData){
      ajax.view.article(responseData);
      if(form.hasClass("question-form")){
        ajax.view.moveShip();
      }
      if(form.hasClass("authentication")){
        ajax.view.updateDashboardLink();
        ajax.view.toggleNavigationLinks
      }
    }).fail(function(responseData){
      console.log("Failure - " + responseData);
    })
  })
}

AjaxController.prototype.bindLinks = function(){
  $('main').on('click', "a.navigation", function(click_event){
    click_event.preventDefault();

    var path = $(this).attr('href');

    $.ajax({
      url: path,
      method: 'GET'
    }).done(function(responseData){
      ajax.view.article(responseData);
    }).fail(function(responseData){
      console.log('Failure: ' + responseData);
    })
  });
}

AjaxController.prototype.bindEvents = function(){
  this.bindForms();
  this.bindLinks();
}

ajax = new AjaxController
ajax.bindEvents();




//this function toggles the signin pages li for teacher/student
$('article').on('click', '#type-select a', function (click_event) {
  click_event.preventDefault()
  $('#type-select li').removeClass('active')
  $(this).parent().addClass('active')
  $('#type').attr('value', $(this).text())
});
