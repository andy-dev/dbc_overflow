$(function() {
  bindEvents();
});

function bindEvents() {
  $('#new-question').on('submit',addQuestion);
  $('.upvote').on('click',upVote);
  $('.downvote').on('click',downVote);
}


var addQuestion = function (e){
  e.preventDefault();

  var formData = $(this).serialize();
  var url = $(this).attr("data-url");

  $.ajax({
    type: "POST",
    url: url,
    data: formData,
    dataType: "json"
  })
  .done(function(response){
    var html = $('#new_question_template').html();
    var templatingFunction = Handlebars.compile(html);
    $('#results').after(templatingFunction({response: response}));
    $('.upvote').on('click',upVote);
    $('.downvote').on('click',downVote);
  })
  .fail(function(){
  console.log("fail")
  });

}


var upVote = function(e){
  e.preventDefault();

  var url = $(this).data("url");
  console.log(url)

   $.ajax({
     url: url,
     type: 'PUT',
   })
   .done(function(serverData) {
     console.log("success");
     console.log(serverData);
     $("#"+serverData.id).text(serverData.votes)
   })
   .fail(function() {
     console.log("error");
   })
   .always(function() {
     console.log("complete");
   });

}


var downVote = function(e){
  e.preventDefault();

  var url = $(this).data("url");
  console.log(url)

   $.ajax({
     url: url,
     type: 'PUT',
   })
   .done(function(serverData) {
     console.log("success");
     console.log(serverData);
     $("#"+serverData.id).text(serverData.votes)
   })
   .fail(function() {
     console.log("error");
   })
   .always(function() {
     console.log("complete");
   });

}









