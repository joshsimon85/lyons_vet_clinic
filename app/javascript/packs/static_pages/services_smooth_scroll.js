import { ScrollToSection } from '../scroll_to_section';
import { getPermittedQueryStrings } from '../permitted_params';

document.addEventListener('DOMContentLoaded', () => {
  const validParams = getPermittedQueryStrings();

  new ScrollToSection(validParams).init();
});
