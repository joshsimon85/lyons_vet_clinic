import { Modal } from '../modal';
import { FormValidator } from '../form_validations';

document.addEventListener('DOMContentLoaded', () => {
  const modal = document.querySelector('.modal');
  const modalLink = document.querySelector('[data-target="modal"]');

  new Modal(modal, modalLink).init();
  new FormValidator('new_role').init();
});
