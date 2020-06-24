class FormValidator {
  constructor(formId) {
    this.formId = formId;
  }
  getForm() {
    return document.getElementById(this.formId) || document.querySelector(this.formId);
  }
  resetLabels() {
    this.getForm().querySelectorAll('label').forEach(function(label, idx) {
      if (idx % 2 === 0) {
        label.parentElement.classList.remove('hidden');
      } else {
        label.parentElement.classList.add('hidden');
      }
    });
  }
  addRequiredText(label) {
    const span = label.querySelector('span');

    span.classList.add('d-block');
    span.textContent = "can't be blank";
  }
  addErrorText(input, label) {
    if (input.validity.valueMissing) {
      this.addRequiredText(label);
    } else if (input.validity.typeMismatch) {
      // add properly formatted
    } else {
      // ????
    }
  }
  removeErrorText(label) {
    const span = label.querySelector('span');

    span.classList.remove('d-block');
    span.textContent = '*';
  }
  handleBlur(e) {
    e.preventDefault();

    const el = e.currentTarget;
    const label = this.getForm().querySelector(`label[for="${el.getAttribute('id')}"]`);

    if (el.checkValidity()) {
      el.classList.remove('invalid');
      label.classList.remove('invalid');
      this.removeErrorText(label);
    } else {
      el.classList.add('invalid');
      label.classList.add('invalid');
      this.addErrorText(el, label);
    }
  }
  bindEvents() {
    const inputs = this.getForm().querySelectorAll('input[type=text], input[type="email"], textarea');

    inputs.forEach(function(input) {
      input.addEventListener('blur', this.handleBlur.bind(this));
    }, this);
  }
  init() {
    this.bindEvents();
    return this;
  }
}

export { FormValidator }
