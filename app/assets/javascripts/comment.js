$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  // 非同期通信の結果として返ってくるデータは、done(function(data) { 処理 })の関数の引数で受けとる
  // 2ー11行目：HTMLを追加。簡単な記述で実現できるのは、テンプレートリテラル記法を使用しているから

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
    // 27-32行目は、非同期通信に成功した時の記述。function(data)は、非同期通信に成功した時の即時関数の第一引数には、サーバから返されたデータが入っている。この場合のサーバから返ってくるデータとは、jbuilderで作成したcreate.json.jbuilderのデータ。
    // 31行目の$('.form__submit').prop('disabled', false);は、 htmlの仕様でsubmitボタンを一度押したらdisabled属性という、ボタンが押せなくなる属性が追加される。そのため、disabled属性をfalseにする記述を追加
    // 33行目：通信に失敗した場合の処理。サーバーエラーの場合、このfailの関数が呼ばれる
  })
})
// コメントフォームが送信された時フォームに入力された値を受け取れるようにする