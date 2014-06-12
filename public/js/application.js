$(document).ready(function() {
    var pictures = [];

    function addPicture (title, url){
      model = new Picture(title, url);
      view = new PictureView();

      $('.pics').append(view.$div);

      controller = new PictureController(model, view);

      pictures.push(controller);

    }

    addPicture("A Kitten", "http://placekitten.com/150/100");
    addPicture("A Kitten", "http://placekitten.com/175/100");
    addPicture("A Kitten", "http://placekitten.com/200/150");
    addPicture("A Kitten", "http://placekitten.com/100/150");
    addPicture("A Kitten", "http://placekitten.com/225/100");

    addPicture("A Kitten", "http://placekitten.com/173/100");
    addPicture("A Kitten", "http://placekitten.com/202/150");
    addPicture("A Kitten", "http://placekitten.com/105/150");
    addPicture("A Kitten", "http://placekitten.com/225/100");

    var apiResponse = [
      {
        title: 'Kitty',
        url: 'http://placekitten.com/300/200'
      },
      {
        title: 'I <3 CATS!!',
        url: 'http://placekitten.com/400/400'
      }
    ];

    //for each object in the api response
    //pull out the title and url
    //call addPicture on the title and url

    for( var i=0; i<apiResponse.length ; i++){
      var title = apiResponse[i].title;
      var url = apiResponse[i].url;

      addPicture(title, url);
    }
});
