$(function() {
  bindEvents();
});

function bindEvents() {
  $('#new-question').on('submit',addQuestion);
}


var addQuestion = function (e){
  e.preventDefault();

  var formData = $(this).serialize();
  var url = $(this).attr("data-url");
  // console.log(url)
  // console.log(formData)


  $.ajax({
    type: "POST",
    url: url,
    data: formData,
    dataType: "json"
  })

  .done(function(response){
    console.log("success")
    console.log(response)
    // var context = {new_question: response};
    // console.log(context)
    var html = $('#new_question_template').html();
    var templatingFunction = Handlebars.compile(html);
    $('#results').html(templatingFunction({response: response}));
  })

  .fail(function(){
    console.log("fail")
  })

}

