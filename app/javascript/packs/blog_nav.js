import $ from 'jquery';

class BlogNav {
  // nav is navbar, navItems are the navitems that are linked to the navbar 
  constructor(nav, navItems) {
    this.nav = nav;
    this.navItems = navItems;
  }
  handleClick(e) {
    e.preventDefault();
    if (e.target.tagName === 'A') {
      const li = e.target.closest('li');
      let id = li.getAttribute('data-id');

      if (!li.classList.contains('active')) {
        this.nav.querySelector('.active').classList.remove('active');
        li.classList.add('active');
      }

      this.navItems.forEach(function(el) {
        if (el.getAttribute('data-id') === id) {
          $(el).fadeIn('slow');
        } else {
          el.style.display = 'none';
        }
      });
    }
  }
  bindEvents() {
    this.nav.addEventListener('click', this.handleClick.bind(this));
  }
  init() {
    this.bindEvents();
    return this;
  }
}

export { BlogNav };
