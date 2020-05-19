import { MultiSlider } from '../multi_slider';
import { Slider } from '../slider';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.querySelector('[data-id="multi_slider"]');

  new MultiSlider(container).init(false);
  new Slider(document.querySelector('.slider')).init(true);
});
