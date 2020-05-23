import { Modal } from '../modal';
import { FormValidator } from '../form_validations';
import { Dismiss } from '../dismiss';

document.addEventListener('DOMContentLoaded', () => {
  const modal = document.querySelector('.modal');
  const modalLink = document.querySelector('[data-target="modal"]');

  new Modal(modal, modalLink).init();
  new FormValidator('new_role').init();
  new Dismiss().init();
});
