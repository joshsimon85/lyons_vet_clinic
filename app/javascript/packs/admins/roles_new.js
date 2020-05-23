import { FormValidator } from '../form_validations';
import { Dismiss } from '../dismiss';

document.addEventListener('DOMContentLoaded', () => {
  new FormValidator('new_role').init();
  new Dismiss().init();
});
