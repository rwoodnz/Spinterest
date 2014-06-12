function PictureController(model, view)
{
	self = this;
	this.model = model;
	this.view = view;

	this.update();

}

PictureController.prototype.update = function() {
	title = this.model.title;
	this.view.setTitle(title);

	image_url = this.model.image_url;
	this.view.setImage(image_url);
};

