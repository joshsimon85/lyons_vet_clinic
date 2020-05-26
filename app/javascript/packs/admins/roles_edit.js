import { FormValidator } from '../form_validations';
import { Dismiss } from '../dismiss';

document.addEventListener('DOMContentLoaded', () => {
  const formId = document.querySelector('form').getAttribute('id');

  new FormValidator(formId).init();
  new Dismiss().init();
});
