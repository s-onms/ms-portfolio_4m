$(function(){
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
  })
})
// コメントフォームが送信された時フォームに入力された値を受け取れるようにする