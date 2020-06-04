class ImagePreview {
  constructor(fileID) {
    this.fileInput = document.getElementById(fileID);
    this.imagePreview = document.querySelector('.image-preview');
  }
  readImage(e) {
    const reader = new FileReader();
    const file = e.target.files[0];
    const self = this;

    if (file.type.indexOf('image') === -1) {
      console.log('The file is not an image');
      return
    }

    reader.addEventListener('load', (e) => {
      self.imagePreview.src = e.target.result;
      self.imagePreview.closest('.hidden').classList.remove('hidden');
    });

    reader.readAsDataURL(file)
  }
  bindEvents() {
    this.fileInput.addEventListener('change', this.readImage.bind(this));
  }
  init() {
    this.bindEvents();
  }
}

export { ImagePreview }
