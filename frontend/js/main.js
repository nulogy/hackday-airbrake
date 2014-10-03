define(['jquery', 'bootstrap', 'select2'], function ($) {
  $(".category").select2({
    placeholder: "Select a Category",
    allowClear: true,
    // width: '200px',
    multiple: true,
    data: {
      results: [{
        id: 'production',
        text: 'production'
      }, {
        id: 'accounts',
        text: 'accounts'
      }]
    }
  });

  $(".environment").select2({
    placeholder: "Select an Environment",
    allowClear: true,
    // width: '200px',
    multiple: true,
    data: {
      results: [{
        id: 'production',
        text: 'production'
      }, {
        id: 'demo',
        text: 'demo'
      }]
    }
  });
});