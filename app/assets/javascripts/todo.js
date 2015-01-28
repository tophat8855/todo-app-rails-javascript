$(document).ready(function() {
  $('input[type="submit"]').on('click', function (event){
    event.preventDefault();
    var new_content = $('#todo_content').val();
    $.ajax('/todos',
    {type: 'post',
    data:{
      todo: {
        content: new_content,
        completed: 'false',
      }
    }
    }).done(function(data) {
      console.log(data);
      $('#todo_content').val('');
      var new_todo = "<li>" + data.content + "</li>";
      $('ul').append(new_todo);
    });
  });
});
