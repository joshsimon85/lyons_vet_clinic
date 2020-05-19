import { throttle } from './throttle';
import $ from 'jquery';

class MainNavBar {
  constructor(container) {
    this.nav = container.querySelector('.navbar.primary');
    this.navStartTopHeight = 176;
  }
  checkScrollHeight(args) {
    if (this.navStartTopHeight >= args) {
      this.nav.classList.toggle('sticky', false);
    } else {
      this.nav.classList.toggle('sticky', true);
    }
  }
  handleScroll(e) {
    let currentHeight;

    if (!this.navTimeout) {
      currentHeight = document.documentElement.scrollTop;
      throttle(this.checkScrollHeight, [currentHeight], this, 25, 'navTimeout');
    }
  }
  bindEvents() {
    document.addEventListener('scroll', this.handleScroll.bind(this));
  }
  init() {
    this.bindEvents();
    return this;
  }
}

export { MainNavBar };
