requirejs.config({
  baseUrl: 'js',
  paths: {
    'bootstrap': 'lib/bootstrap',
    'jquery': 'lib/jquery',
    'select2': 'lib/select2',
    'angular': 'lib/angular',
    'lodash': 'lib/lodash',
  },
  shim: {
    'jquery': { exports: '$' },
    'lodash': { exports: '_' },
    'angular': { exports: 'angular' },
    'bootstrap': ['jquery'],
    'select2': ['jquery']
  }
});

requirejs.onError = function (a) {
  console.log(a);
  console.log(a.message);
  console.log(a.stack);
};