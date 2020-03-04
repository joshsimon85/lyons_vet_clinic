function throttle(callback, args, context, id, delay) {
  context[id] = window.setTimeout(function() {
    callback.apply(context, args);
    context[id] = null;
  }, delay);
}

window.throttle = throttle;
