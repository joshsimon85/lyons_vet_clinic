import $ from 'jquery';

class MultiSlider {
  constructor(container) {
    this.container = container;
    this.liveSlides = container.querySelector('[data-id="slides"]').children;
    this.prev = container.querySelector('[data-id="prev"]');
    this.next = container.querySelector('[data-id="next"]');
  }

  stopTimedSlide() {
    clearInterval(this.sliderID);
    this.sliderID = null;
  }

  togglePrev(e) {
    if (e) {
      e.preventDefault();
      this.stopTimedSlide();
    }

    this.liveSlides[0].parentNode.prepend(this.liveSlides[this.liveSlides.length - 1]);
  }

  toggleNext(e) {
    if (e) {
      e.preventDefault();
      this.stopTimedSlide();
    }

    this.liveSlides[0].parentNode.appendChild(this.liveSlides[0]);
  }


  bindEvents() {
    this.prev.addEventListener('click', this.togglePrev.bind(this));
    this.next.addEventListener('click', this.toggleNext.bind(this));
  }

  startAutoSlide(duration) {
    this.sliderID = setInterval(() => {
      this.toggleNext();
    }, duration);
  }

  init(autoPlay=false, duration = 6000) {
    this.bindEvents();
    debugger;
    if (autoPlay) { this.startAutoSlide(duration); }
    return this;
  }
}

export { MultiSlider };
