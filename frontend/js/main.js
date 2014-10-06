define(['jquery', 'bootstrap', 'select2', 'angular'], function ($) {
  $(".category").select2({
    placeholder: "Select a Category",
    allowClear: true,
    multiple: true,
    ajax: {
      url: function (term) {
        return '/autocomplete/category/' + term;
      }
    },
    results: function (data) {
      return data;
    }
    // data: {
    //   results: [{
    //     id: 'production',
    //     text: 'production'
    //   }, {
    //     id: 'accounts',
    //     text: 'accounts'
    //   }]
    // }
  });

  $(".environment").select2({
    placeholder: "Select an Environment",
    allowClear: true,
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

  function serialize() {
    return $("form").serialize();
  }

  function formatResults(results) {
    var length = results.length;


    $("form tbody").empty();

    while (length--) {
      var result = results[length],
          tr = $("<tr />"),
          controllerTd = $("<td />").text(result.controller),
          categoryTd = $("<td />").text(result.category);

      tr.append(controllerTd);
      $("form tbody").append(tr);
    }
  }

  $(".submit").click(function () {
    $.ajax({
      url: '/errors?' + serialize(),
      success: function (results) {
        formatResults(results);
      }
    })
  });
});