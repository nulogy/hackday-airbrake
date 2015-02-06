

var app = angular.module('gingerQuake', ['ui.bootstrap']);

app.factory('ErrorDeserializer', ['$http', ErrorDeserializer]);
app.factory('ErrorRepository', ['$http', 'ErrorDeserializer', ErrorRepository]);

app.controller('FiltersController', ['$scope', 'ErrorRepository', FiltersController]);
app.controller('PaginationCtrl', ['$scope', PaginationCtrl]);

angular.bootstrap(document, ['gingerQuake']);

function setupAutoComplete(selector, config) {
  var defaults = {
    allowClear: true,
    multiple: true,
    ajax: {
      dataType: 'json',
      results: function (data) {
        return {
          results: _.map(data, function(text) { return {id: text, text: text} })
        };
      }
    }
  };

  $(selector).select2(_.merge(defaults, config));
}

function autocompleteUrlBuilder(field) {
  return function (term) {
    return '/autocomplete/' + field + '/' + term;
  };
}

setupAutoComplete(".category", {
  placeholder: "Select a Category",
  ajax: { url: autocompleteUrlBuilder('category') }
});

setupAutoComplete(".environment", {
  placeholder: "Select an Environment",
  ajax: { url: autocompleteUrlBuilder('environment') }
});

setupAutoComplete(".company_name", {
  placeholder: "Select a Company",
  ajax: { url: autocompleteUrlBuilder('company_name') }
});

setupAutoComplete(".account_name", {
  placeholder: "Select an Account",
  ajax: { url: autocompleteUrlBuilder('account_name') }
});

//  setupAutoComplete(".taskforce_id", {
//    placeholder: "Select a Taskforce",
//    ajax: { url: autocompleteUrlBuilder('taskforce_id') }
//  });

setupAutoComplete(".site_id", {
  placeholder: "Select a Site ID",
  ajax: { url: autocompleteUrlBuilder('site_id') }
});
