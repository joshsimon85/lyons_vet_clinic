import { FormValidator } from '../form_validations';
import { ImagePreview } from '../image_preview';

document.addEventListener('DOMContentLoaded', () => {
  new FormValidator('new_user').init();
  new ImagePreview('user_profile_image').init();
});
