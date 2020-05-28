import { FormValidator } from '../form_validations';

document.addEventListener('DOMContentLoaded', () => {
  const formId = document.querySelector('form').getAttribute('id');

  new FormValidator(formId).init();
});
