$(document).ready(function() {
  var pictures = [];

  $('#new-post-form').on('submit', function(event){
    event.preventDefault();
    var formData = {
      'title':  $('input[name=title]').val(),
      'url':  $('input[name=url]').val()
    };

    $.ajax({
      type: 'POST',
      data: formData,
      url: '/spun',
      success: done
    });
    event.stopPropagation();

  });

  var done = function(data)
  {
    data = JSON.parse(data);
    addPicture(data['title'], data['url']);
  };

  function addPicture (title, url){
    model = new Picture(title, url);
    view = new PictureView();

    $('.pics').prepend(view.$div);

    controller = new PictureController(model, view);

    pictures.push(controller);
  }

  $.getJSON('/spuns', function(spun_data) {

    spun_json = JSON.parse(spun_data);

    $.each(spun_json, function(index, spin) {
      addPicture(spin.title, spin.url);
    });
  });

});
