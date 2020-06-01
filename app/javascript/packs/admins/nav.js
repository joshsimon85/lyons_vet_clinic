import { SmallNav } from '../small_nav.js';

document.addEventListener('DOMContentLoaded', () => {
  const smNav = document.querySelector('.sm-nav');

  new SmallNav(smNav).init();
});
