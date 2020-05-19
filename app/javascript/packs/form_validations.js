class FormValidator {
  constructor(formId) {
    this.formId = formId;
  }
  getForm() {
    return document.getElementById(this.formId);
  }
  addErrorLabel(el) {
    const elName = el.getAttribute('name');
    const elLabel = this.getForm().querySelector(`label[for="${elName}"]`);
    const errorLabel = this.getForm().querySelector(`label.error_message[for="${elName}"]`);

    el.classList.add('invalid');
    elLabel.parentElement.classList.add('hidden');
    errorLabel.parentElement.classList.remove('hidden');
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
  resetInvalidClass() {
    this.getForm().querySelectorAll('.invalid').forEach(function(input) {
      input.classList.remove('invalid');
    });
  }
  handleSubmit(e) {
    const invalidEls = this.getForm().querySelectorAll('input:invalid, textarea:invalid');
    const self = this;

    if (invalidEls.length !== 0) {
      e.preventDefault();

      this.resetLabels();
      this.resetInvalidClass();

      invalidEls.forEach(function(el) {
        self.addErrorLabel(el);
      });
    }
  }
  handleBlur(e) {
    e.preventDefault();

    const el = e.currentTarget;
    const errorLabel = this.getForm().querySelector(`label.error_message[for="${el.getAttribute('name')}"]`);
    const label = this.getForm().querySelector(`label[for="${el.getAttribute('name')}"]`);

    if (el.checkValidity()) {
      el.classList.remove('invalid');
      errorLabel.parentElement.classList.toggle('hidden', true);
      label.parentElement.classList.toggle('hidden', false);
    } else {
      el.classList.add('invalid');
      errorLabel.parentElement.classList.toggle('hidden', false);
      label.parentElement.classList.toggle('hidden', true);
    }
  }
  bindEvents() {
    debugger;
    const inputs = this.getForm().querySelectorAll('input[type=text], input[type="email"], textarea');

    this.getForm().addEventListener('submit', this.handleSubmit.bind(this));

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
