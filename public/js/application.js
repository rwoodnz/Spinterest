$(document).ready(function() {
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
