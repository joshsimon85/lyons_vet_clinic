import { BlogNav } from '../blog_nav';

document.addEventListener('DOMContentLoaded', () => {
  const nav = document.getElementById('paw_source_nav');
  const navItems = document.querySelectorAll('.article > img');

  new BlogNav(nav, navItems).init();
});
