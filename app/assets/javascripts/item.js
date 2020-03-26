$(function(){
  function buildHTML(count, url) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <div class="upper-box">
                    <img src="${url}" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="delete-box" id="delete_btn_${count}" data-id="${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }
  if (window.location.href.match(/\/items\/\d+\/edit/)){
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    $('.preview-box').each(function(index, box){
      $(box).attr('id', `preview-box__${index}`);
    })
    $('.delete-box').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.preview-box').length;
    if (count == 5) {
      $('.label-content').hide();
    }
  }

  function setLabel() {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }

  function addInputField(index) {
    var inputField = `
                      <div class="inputs" data-image-id="${index}" id="file_field_index_${index}">
                        <input class="hidden-field newInputField" id="item_images_attributes_${index}_image" name="item[item_images_attributes][${index}][item_image]" type="file">
                      </div>
                     `
  return inputField;
    // $(".hidden-content").append(inputField);
  }


  $(document).on('change', '.hidden-field', function(e) {

    var fileIndex = [1,2,3,4,5,6,7,8,9,10];
    lastIndex = $('.inputs:last').data('imageId');
    var arr = fileIndex.splice(0, lastIndex);
    setLabel();
    // var id = $(this).attr('id').replace(/[^0-9]/g, '');
    var id = $(this).parent().data('imageId');
    console.log(id)
    var file = this.files[0];
    var reader = new FileReader();
    var file = e.target.files[0];
    var blobUrl = window.URL.createObjectURL(file);
    console.log(`img[data-index="${id}"]`)
    if (img = $(`img[data-index="${id}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  
      var prevContent = $('.label-content').prev();
      $(prevContent).append(buildHTML(id, blobUrl));
      console.log(fileIndex[0])
      $('.hidden-content').append(addInputField(fileIndex[0]));
      $('.label-box').attr({id: `label-box--${fileIndex[0]}`,for: `item_images_attributes_${fileIndex[0]}_image`});
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
    // reader.readAsDataURL(file);
    // reader.onload = function() {
    //   var image = this.result;
      // if ($(`#preview-box__${id}`).length == 0) {
      //   var count = $('.preview-box').length;
      //   var html = buildHTML(id);
      //   var prevContent = $('.label-content').prev();
      //   $(prevContent).append(html);
      // }
      // $(`#preview-box__${id} img`).attr('src', `${image}`);
      // var count = $('.preview-box').length;
      // if (count == 5) { 
      //   $('.label-content').hide();
      // }
      // if ($(`#item_images_attributes_${id}__destroy`)){
      //   $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
      // } 
      // setLabel();
      // if(count < 5){
      //   $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
      //   addInputField(count);
      // }
    // }
  // });

  // 画像の削除
  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    var id = $(this).data('id')
    console.log(id)
    $(`#preview-box__${id}`).remove();
    // var id = $(this).attr('id').replace(/[^0-9]/g, '');
    if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
      //フォームの中身を削除
      console.log("true")
      $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
      var count = $('.preview-box').length;
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        $('.newInputField').data({id: `item_images_attributes_${id}_image`,name: `item[item_images_attributes][${id}][image]`});
      }
    } 
    else {
      console.log("true")
      //投稿編集時
      $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }
      //ラベルのwidth操作
      setLabel();
      //ラベルのidとforの値を変更
      //削除したプレビューのidによって、ラベルのidを変更する
      if(id < 5){
        // $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      }
    }
  });
});


