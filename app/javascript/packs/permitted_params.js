function getPermittedQueryStrings() {
  const permittedQueryStrings = [];
  const els = document.querySelectorAll('[data-scroll]')

  els.forEach(function(el) {
    permittedQueryStrings.push(el.getAttribute('data-scroll'));
  });

  return permittedQueryStrings;
}

export { getPermittedQueryStrings };
