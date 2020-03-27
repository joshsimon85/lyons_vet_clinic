document.addEventListener('DOMContentLoaded', function() {
  const validator = {
    addErrorLabel: function(el) {
      const elName = el.getAttribute('name');
      const elLabel = document.querySelector(`label[for="${elName}"]`);
      const errorLabel = document.querySelector(`label.error_message[for="${elName}"]`);

      el.classList.add('invalid');
      elLabel.parentElement.classList.add('hidden');
      errorLabel.parentElement.classList.remove('hidden');
    },
    resetLabels: function() {
      document.querySelectorAll('label').forEach(function(label, idx) {
        if (idx % 2 === 0) {
          label.parentElement.classList.remove('hidden');
        } else {
          label.parentElement.classList.add('hidden');
        }
      });
    },
    resetInvalidClass: function() {
      document.querySelectorAll('.invalid').forEach(function(input) {
        input.classList.remove('invalid');
      });
    },
    handleSubmit: function(e) {
      const invalidEls = document.querySelectorAll('input:invalid, textarea:invalid');
      const self = this;

      if (invalidEls.length !== 0) {
        e.preventDefault();

        this.resetLabels();
        this.resetInvalidClass();

        invalidEls.forEach(function(el) {
          self.addErrorLabel(el);
        });
      }
    },
    handleBlur: function(e) {
      e.preventDefault();

      const el = e.currentTarget;
      const errorLabel = document.querySelector(`label.error_message[for="${el.getAttribute('name')}"]`);
      const label = document.querySelector(`label[for="${el.getAttribute('name')}"]`);

      if (el.checkValidity()) {
        el.classList.remove('invalid');
        errorLabel.parentElement.classList.toggle('hidden', true);
        label.parentElement.classList.toggle('hidden', false);
      } else {
        el.classList.add('invalid');
        errorLabel.parentElement.classList.toggle('hidden', false);
        label.parentElement.classList.toggle('hidden', true);
      }
    },
    bindEvents: function() {
      const inputs = document.querySelectorAll('input[type=text], input[type="email"], textarea');

      document.querySelector('form').addEventListener('submit', this.handleSubmit.bind(this));

      inputs.forEach(function(input) {
        input.addEventListener('blur', this.handleBlur.bind(this));
      }, this);
    },
    init: function() {
      this.bindEvents();
    }
  };

  validator.init();
});
