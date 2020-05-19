import { MainNavBar } from '../main_nav.js';
import { SmallNav } from '../small_nav.js';
import { Slider } from '../slider';

document.addEventListener('DOMContentLoaded', () => {
  const lgNav = document.querySelector('.lg-nav');
  const smNav = document.querySelector('.sm-nav');
  const footerSlider = document.querySelector('footer .slider');

  new MainNavBar(lgNav).init();
  new SmallNav(smNav).init();
  new Slider(footerSlider).init(false);
});
