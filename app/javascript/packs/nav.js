import { throttle } from './throttle';
import $ from 'jquery';

document.addEventListener('DOMContentLoaded', () => {
  const navBar = {
    setNavBarHeight: function() {
      let bounding;

      this.nav = document.querySelector('.lg-nav').querySelector('.navbar.primary');
      this.navStartTopHeight = window.pageYOffset + 176;
    },
    checkScrollHeight: function(args) {
      if (this.navStartTopHeight >= args) {
        this.nav.classList.toggle('sticky', false);
      } else {
        this.nav.classList.toggle('sticky', true);
      }
    },
    handleScroll: function(e) {
      let currentHeight;

      if (!this.navTimeout) {
        currentHeight = document.documentElement.scrollTop;
        throttle(this.checkScrollHeight, [currentHeight], this, 25, 'navTimeout');
      }
    },
    displayMenu: function(e) {
      e.preventDefault();

      this.hamburgerMenu.classList.add('hidden');
      this.closeIcon.classList.remove('hidden');
      $(this.menu).slideDown();
    },
    hideMenu: function(e) {
      e.preventDefault();

      this.hamburgerMenu.classList.remove('hidden');
      this.closeIcon.classList.add('hidden');
      $(this.menu).slideUp();
    },
    bindEvents: function() {
      document.addEventListener('scroll', this.handleScroll.bind(this));
      this.hamburgerMenu.addEventListener('click', this.displayMenu.bind(this));
      this.closeIcon.addEventListener('click', this.hideMenu.bind(this));
    },
    cacheElements: function() {
      this.hamburgerMenu = document.querySelector('.sm-nav .hamburger_menu');
      this.closeIcon = document.querySelector('.sm-nav .close');
      this.menu = document.querySelector('.sm-nav').querySelector('ul');
    },
    init: function() {
      this.setNavBarHeight();
      this.cacheElements();
      this.bindEvents();
    }
  };

  navBar.init();
});
