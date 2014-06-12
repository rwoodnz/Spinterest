function PictureController(model, view)
{
	self = this;
	this.model = model;
	this.view = view;

	this.update();

  this.view.$image.on('click', $.proxy(this.spin, this));
}

PictureController.prototype.update = function() {
	title = this.model.title;
	this.view.setTitle(title);

	image_url = this.model.image_url;
	this.view.setImage(image_url);
};

PictureController.prototype.spin = function(event) {
  //spin the picture
  // this.view.$image.on('click', spinning);

  //send a post request to the server with the id
  $.ajax({
    type: 'POST',
    data: this.model.id,
    url: '/favorite?id=' + this.model.id,
    success: spinBitch,
    error: notSpun
  });
  console.log(this.model.id);
  console.log('hi there');
};

var spinBitch = function(data)
{
  console.log('bitch has been spun!!');
};

var notSpun = function(){
  console.log('Bitch was not spun');
};
