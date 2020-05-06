import $ from 'jquery';

document.addEventListener('DOMContentLoaded', function() {
  const nav = {
    nav: document.querySelector('#paw_source_nav'),
    handleClick: function(e) {
      e.preventDefault();
      if (e.target.tagName === 'A') {
        const li = e.target.closest('li');
        let id = li.getAttribute('data-id');

        if (!li.classList.contains('active')) {
          this.nav.querySelector('.active').classList.remove('active');
          li.classList.add('active');
        }

        document.querySelectorAll('.article > img').forEach(function(el) {
          if (el.getAttribute('data-id') === id) {
            $(el).fadeIn('slow');
          } else {
            el.style.display = 'none';
          }
        });
      }
    },
    bindEvents: function() {
      this.nav.addEventListener('click', this.handleClick.bind(this));
    },
    init: function() {
      this.bindEvents();
    }
  };
  nav.init();
});
