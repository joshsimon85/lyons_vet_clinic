function Slider(container) {
  this.container = container;
}

Slider.prototype.init = () => {
  //this.bindEvents();
  // kick off slider sliding
  console.log('binding events');
};

Slider.prototype.bindEvents = () => {
  let prev = this.container.querySelector('.prev');
  let next = this.container.querySelector('.next');

  prev.addEventListener('click', this.previousSlide.bind(this));
  next.addEventListener('click', this.nextSlide.bind(this));
};

document.addEventListener('DOMContentLoaded', ()=> {
  const slide = new Slider(document.querySelector('.slider')).init();
});
