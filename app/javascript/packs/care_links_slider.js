import { MultiSlider } from './multi_slider';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.querySelector('[data-id="multi_slider"]');
  new MultiSlider(container).init(false);
});
