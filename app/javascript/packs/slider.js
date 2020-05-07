import $ from 'jquery';

class Slider {
  constructor(container) {
    this.container = container;
    this.actions = container.querySelector('.actions');
    this.prev = this.actions.querySelector('[data-id="prev"]');
    this.next = this.actions.querySelector('[data-id="next"]');
    this.duration = 500;
  }

  getActiveSlide(slides) {
    let slide =  slides.filter(el => {
      return el.classList.contains('active');
    });

    return slide[0];
  }

  getActiveSlideIdx(slides, activeSlide) {
    return slides.indexOf(activeSlide);
  }

  changeBubbleState(idx) {
    let bubbleSelector = this.actions.querySelectorAll('[data-toggle]');

    this.actions.querySelector('.active').classList.toggle('active', false);
    bubbleSelector[idx].classList.toggle('active', true);
  }

  findSlideInfo() {
    let slideInfo = {};

    slideInfo.slides = this.createSlideList();
    slideInfo.activeSlide = this.getActiveSlide(slideInfo.slides);
    slideInfo.activeSlideIdx = this.getActiveSlideIdx(slideInfo.slides, slideInfo.activeSlide);

    return slideInfo;
  }

  removeActiveClassFromSlide(slide) {
    slide.classList.toggle('active', false);
  }

  addActiveClassToSlide(slide) {
    slide.classList.toggle('active', true);
  }

  stopTimedSlide() {
    clearInterval(this.sliderID);
    this.sliderID = null;
  }

  animateSlides(currentSlide, targetSlide, idx) {
    $(currentSlide).finish().fadeOut(this.duration, () => {
      this.removeActiveClassFromSlide(currentSlide);
      this.changeBubbleState(idx);
      $(targetSlide).finish().fadeIn(this.duration, () => {
        this.addActiveClassToSlide(targetSlide);
      });
    });
  }

  togglePrevSlide(e) {
    e.preventDefault();

    let slideInfo = this.findSlideInfo();
    let targetSlideIdx;

    if (this.sliderID) { this.stopTimedSlide(); }

    if (slideInfo.slides.length === 0 || slideInfo.slides.length === 1) {
      return;
    }

    if (slideInfo.activeSlideIdx === 0) {
      targetSlideIdx = slideInfo.slides.length - 1;
    } else {
      targetSlideIdx = slideInfo.activeSlideIdx - 1;
    }

    this.animateSlides(
      slideInfo.activeSlide,
      slideInfo.slides[targetSlideIdx],
      targetSlideIdx
    );
  }

  toggleNextSlide(e) {
    if (e) { e.preventDefault(); }

    let slideInfo = this.findSlideInfo();
    let targetSlideIdx;

    if (this.sliderID && e) { this.stopTimedSlide(); }

    if (slideInfo.slides.length === 0 || slideInfo.slides.length === 1) {
      return;
    }

    if (slideInfo.activeSlideIdx === slideInfo.slides.length - 1) {
      targetSlideIdx = 0;
    } else {
      targetSlideIdx = slideInfo.activeSlideIdx + 1;
    }

    this.animateSlides(
      slideInfo.activeSlide,
      slideInfo.slides[targetSlideIdx],
      targetSlideIdx
    );
  }

  createSlideList() {
    return Array.prototype.slice.call(
      this.container.querySelectorAll('[data-type="slider"]')
    );
  }

  toggleSlide(e) {
    e.preventDefault();

    let id = e.target.getAttribute('data-toggle');
    let slideInfo = this.findSlideInfo();
    let slide;
    let idx;
    let actionBubbles;

    if (this.sliderID) { this.stopTimedSlide(); }

    slide = slideInfo.slides.filter(el => {
      return el.getAttribute('data-id') === id;
    })[0];

    actionBubbles = this.actions.querySelectorAll('[data-toggle]');
    idx = String(Array.prototype.slice.call(actionBubbles).indexOf(e.target));

    this.animateSlides(slideInfo.activeSlide, slide, idx);
  }

  bindEvents() {
    this.prev.addEventListener('click', this.togglePrevSlide.bind(this));
    this.next.addEventListener('click', this.toggleNextSlide.bind(this));

    this.actions.querySelectorAll('[data-toggle]').forEach(el => {
      el.addEventListener('click', this.toggleSlide.bind(this));
    }, this);
  }

  startSlider(duration) {
    this.sliderID = setInterval(() => {
      this.toggleNextSlide();
    }, duration);
  }

  init(autoPlay = false, duration = 6000) {
    this.bindEvents();
    if (autoPlay) { this.startSlider(duration); }
    return this;
  }
}

export { Slider };
