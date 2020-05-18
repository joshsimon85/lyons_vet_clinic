import { Modal } from '../modal';

document.addEventListener('DOMContentLoaded', () => {
  const modal = document.querySelector('.modal');
  const modalLink = document.querySelector('[data-target="modal"]');

   new Modal(modal, modalLink).init();
});
