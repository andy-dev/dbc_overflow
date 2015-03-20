$(function() {
  answerBindEvents();
});

function answerBindEvents() {
  $('.new_answer').on('submit',addAnswer);
  $('.answerupvote').on('click',answerUpVote);
  $('.answerdownvote').on('click',answerDownVote);
}

var addAnswer = function (e){
  e.preventDefault();

  var formData = $(this).serialize();
  var url = $(this).attr("action");

  $.ajax({
    type: "POST",
    url: url,
    data: formData,
    dataType: "json"
  })
  .done(function(answerResponse){
    console.log("success");
    var html = $('#new_answer_template').html();
    var templatingFunction = Handlebars.compile(html);
    $('#results').before(templatingFunction({answerResponse: answerResponse}));
    $('.answerupvote').on('click',answerUpVote);
    $('.answerdownvote').on('click',answerDownVote);
  })
  .fail(function(){
  console.log("fail")
  });
}

var answerUpVote = function(e){
  e.preventDefault();
  console.log("success")

  var url = $(this).data("url");

   $.ajax({
     url: url,
     type: 'POST',
   })
   .done(function(serverData) {
     console.log("success");
    $("#"+serverData.id).text(serverData.votes)
   })
   .fail(function() {
     console.log("error");
   });
}

var answerDownVote = function(e){
  e.preventDefault();

  var url = $(this).data("url");

   $.ajax({
     url: url,
     type: 'POST',
   })
   .done(function(serverData) {
     console.log("success");
     $("#"+serverData.id).text(serverData.votes)
   })
   .fail(function() {
     console.log("error");
   });
}