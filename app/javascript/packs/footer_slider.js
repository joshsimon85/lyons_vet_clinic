import { Slider } from './slider';

document.addEventListener("DOMContentLoaded", () => {
  new Slider(document.querySelector('footer .slider')).init(false);
});
