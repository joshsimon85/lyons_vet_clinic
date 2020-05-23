class Dismiss {
  handleDismiss(e) {
    if (e.target.getAttribute('data-dismiss') === 'close') {
      e.preventDefault();
      e.stopPropagation();

      const target = e.target.closest('[data-dismissible="true"]');
      
      if (target.tagName === 'SECTION') {
        target.innerHTML = '';
      } else {
        target.remove();
      }
    }
  }
  bindEvents() {
    document.addEventListener('click', this.handleDismiss.bind(this));
  }
  init() {
    this.bindEvents();
  }
}

export { Dismiss };
