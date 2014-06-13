function PictureController(model, view)
{
	self = this;
	this.model = model;
	this.view = view;

	this.update();

  this.view.$div.on('click', $.proxy(this.spin, this));
}

PictureController.prototype.update = function() {
	title = this.model.title;
	this.view.setTitle(title);

	image_url = this.model.image_url;
	this.view.setImage(image_url);
};

PictureController.prototype.favorite = function() {
  this.view.favorite();
};

PictureController.prototype.spin = function(event) {

  this.view.spinMe();
  this.view.favorite();

  $.ajax({
    type: 'POST',
    data: {'num': this.model.id},
    url: '/favorite',
    success: spinCatSPIN,
    error: notSpun
  });
  console.log(this.model.id);
  console.log('hi there');
};

var spinCatSPIN = function(data)
{
  console.log('CAT has been favorited!!');
};

var notSpun = function(){
  console.log('CAT was not favorited');
};
