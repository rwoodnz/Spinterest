$(document).ready(function() {

  $('form').on('submit', function(event){
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

    console.log(formData.title + ' ' + formData.url);
    event.stopPropagation();

  });

  $('.picture').on('click', '<img>', function(event){
      event.preventDefault();
      var formData = {
        'pic id': $('click')
      };

      $.ajax({
        type: 'POST',
        data: formData,
        url: '/favorite?num=' + formData,
        success: done
      });

  });

  var done = function(data)
  {
    $('form').append(data["view"])
  };


    var pictures = [];

    function addPicture (title, url){
      model = new Picture(title, url);
      view = new PictureView();

      $('.pics').append(view.$div);

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
