$(document).ready(function() {
  var pictures = [];
  var wall = new freewall(".pics");

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
    addPicture(data['id'], data['title'], data['url']);
    wall.refresh();
  };

  function addPicture (id, title, url, favorited){
    model = new Picture(id, title, url);
    view = new PictureView();

    $('.pics').prepend(view.$div);

    controller = new PictureController(model, view);

    console.log(favorited);

    if (favorited)
    {
      console.log("Favorited " + title);
      controller.favorite();
    }

    pictures.push(controller);
  }

  $.getJSON('/spuns', function(spun_data) {

    spun_json = JSON.parse(spun_data);

    $.each(spun_json, function(index, spin) {
      console.log(spin);
      addPicture(spin.id, spin.title, spin.url, spin.favorited);
    });

    wall.fitWidth();

  });

});
