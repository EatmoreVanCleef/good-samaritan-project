$(document).ready(function() {
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  
  $("#image-upload").change(function() {
    $("#upload-form").submit();
  });


  // $(".btn").click(function(){
  //   $(this).button('loading').delay(1000).queue(function(){
  //     $(this).button('somestringvalue');
  //     $(this).dequeue();
  //   });        
  // });  
});

function changeText(submitId){
  var submit = document.getElementById(submitId);
  submit.value = 'Message sent!';
  return true;
};

$('submitbutton').click(function() {
    var aaa =  $(this);
    // aaa.css('background-color','#f47121');
    aaa.prop('disabled', true);
    setTimeout(function() {
        aaa.prop('disabled', false);
    }, 3000);
});