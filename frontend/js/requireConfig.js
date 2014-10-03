requirejs.config({
  baseUrl: '/js/',
  shim: {
    bootstrap: {
      deps: ['jquery']
    },
    select2: {
      deps: ['jquery']
    }
  },
  paths: {
  }
});

requirejs.onError = function (a) {
  console.log(a);
  console.log(a.message);
  console.log(a.stack);
};