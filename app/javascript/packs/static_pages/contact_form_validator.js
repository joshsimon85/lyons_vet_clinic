import { FormValidator } from '../form_validations';

document.addEventListener('DOMContentLoaded', () => {
  new FormValidator('email').init();
});
