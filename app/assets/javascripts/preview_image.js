$(function(){
  $('.img').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $(".upload_img").attr("src", e.target.result);
        $(".cover-image-uploader").css({
          "background": "none"
        })
      };
    })(file);
    reader.readAsDataURL(file);

  })
});

