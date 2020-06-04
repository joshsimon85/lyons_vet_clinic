class ImagePreview {
  constructor(fileID) {
    this.fileId = fileID;
  }
  addPreview() {
    
  }
  bindEvents() {
    const fileInput = document.getElementById(this.fileID);
    fileInput.addEventListener('change', this.addPreview.bind(this));
  }
  init() {
    this.bindEvents();
  }
}
