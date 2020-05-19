import $ from 'jquery';

class SmallNav {
  constructor(container) {
    this.hamburgerMenu = container.querySelector('.hamburger_menu');
    this.closeIcon = container.querySelector('.close');
    this.menu = container.querySelector('ul');
  }
  displayMenu(e) {
    e.preventDefault();

    this.hamburgerMenu.classList.add('hidden');
    this.closeIcon.classList.remove('hidden');
    $(this.menu).slideDown();
  }
  hideMenu(e) {
    e.preventDefault();

    this.hamburgerMenu.classList.remove('hidden');
    this.closeIcon.classList.add('hidden');
    $(this.menu).slideUp();
  }
  bindEvents () {
    this.hamburgerMenu.addEventListener('click', this.displayMenu.bind(this));
    this.closeIcon.addEventListener('click', this.hideMenu.bind(this));
  }
  init() {
    this.bindEvents();
    return this;
  }
}

export { SmallNav };
