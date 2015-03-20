$(function() {
  testbindEvents();
});

function testbindEvents() {
  $('.answerupvote').on('click',answerUpVote);
  $('.answerdownvote').on('click',answerDownVote);
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
   })
   .always(function() {
     console.log("complete");
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
   })
   .always(function() {
     console.log("complete");
   });

}