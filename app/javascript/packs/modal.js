class Modal {
  constructor(el, modalLink) {
    this.modal = el;
    this.modalLink = modalLink;
    this.overlay = document.querySelector('.modal-overlay');
  }
  showModal() {
    this.modal.classList.toggle('hidden', false);
    this.overlay.classList.toggle('hidden', false);
  }
  hideModal(e) {
    if (e) { e.preventDefault(); }

    this.modal.classList.toggle('hidden', true);
    this.overlay.classList.toggle('hidden', true);
  }
  handleClick(e) {
    e.preventDefault();
    if (this.modal.classList.contains('hidden')) {
      this.showModal();
    } else {
      this.hideModal();
    }
  }
  bindEvents() {
    const closeBtn = this.modal.querySelector('[data-target="close-modal"]');

    this.modalLink.addEventListener('click', this.handleClick.bind(this));
    this.overlay.addEventListener('click', this.hideModal.bind(this));
    closeBtn.addEventListener('click', this.hideModal.bind(this));
  }
  init() {
    this.bindEvents();
    return this;
  }
}

export { Modal };
