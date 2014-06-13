function PictureView () {
	this.$div = $('<div class="picture shadow"></div>')
	this.$title = $('<h2></h2>');
	this.$category = $('<p></p>');
	this.$image = $('<img src=""/>');

	this.$div.append(this.$title, this.$category, this.$image);
};

PictureView.prototype.setTitle = function(new_title) {
	this.$title.text(new_title);
};

PictureView.prototype.setImage = function(new_image_url) {
	this.$image.attr("src", new_image_url);
};

PictureView.prototype.spinMe = function() {
  var elToSpin = this.$div;
  elToSpin.removeClass("spinning");
  setTimeout(function(){
    elToSpin.addClass("spinning");
  }, 1);

};

PictureView.prototype.favorite = function() {
    this.$div.toggleClass('favorite');
};