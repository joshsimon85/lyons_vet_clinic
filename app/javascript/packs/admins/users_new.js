import { FormValidator } from '../form_validations';

document.addEventListener('DOMContentLoaded', () => {
  new FormValidator('new_user').init();
});