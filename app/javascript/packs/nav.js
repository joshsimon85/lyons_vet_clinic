document.addEventListener('DOMContentLoaded', () => {
  const navBar = {
    setNavBarHeight: function() {
      const primaryNav = document.querySelector('.navbar.primary');
      const bounding = primaryNav.getBoundingClientRect();
      this.startingNavHeight = bounding.top;
    },
    checkScrollHeight: function(e) {
      console.log(e);
    },
    bindEvents: function() {
    //  document.addEventListener('scroll', this.checkScrollHeight.bind(this));
    },
    init: function() {
      this.setNavBarHeight();
      console.log(this.startingNavHeight)
      this.bindEvents();
    }
  };

  navBar.init();
});
