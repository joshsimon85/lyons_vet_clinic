document.addEventListener('DOMContentLoaded', () => {
  const navBar = {
    setNavBarHeight: function() {
      let bounding;
      this.nav = document.querySelector('.navbar.primary');
      bounding = this.nav.getBoundingClientRect();
      this.navStartTopHeight = bounding.top;
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
    bindEvents: function() {
      document.addEventListener('scroll', this.handleScroll.bind(this));
    },
    init: function() {
      this.setNavBarHeight();
      this.bindEvents();
    }
  };

  navBar.init();
});
