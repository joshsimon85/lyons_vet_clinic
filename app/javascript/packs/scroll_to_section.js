import $ from 'jquery';

class ScrollToSection {
  constructor(permitted) {
    this.permitted = permitted;
    this.offset = 50;
    this.duration = 1500;
  }

  getQueryParams() {
    const url = window.location.href;
    const regex =  /q=.+/gi;

    if (url.match(regex)) {
      return url.match(regex)[0];
    } else {
      return '';
    }
  }

  scrollTo(id) {
    $([document.documentElement, document.body]).animate({
      scrollTop: ($(`[data-scroll="${id}"]`).offset().top) - this.offset
    }, this.duration);
  }

  autoScroll() {
    const regex = /.=/gi;
    const rawQueryString = this.getQueryParams();
    const formattedQueryString = rawQueryString.replace(regex, '');

    if (formattedQueryString && this.permitted.includes(formattedQueryString)) {
      this.scrollTo(formattedQueryString);
    } else {
      return;
    }
  }

  init() {
    this.autoScroll();
  }
}

export { ScrollToSection };
