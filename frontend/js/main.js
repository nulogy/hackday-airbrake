define(['jquery', 'lodash', 'bootstrap', 'select2', 'angular'], function ($) {
  var app = angular.module('gingerQuake', []);

  function ErrorsRepository($http, deserialize) {
    return {
      fetchErrors: function(filters) {
        var config = { responseType: 'json' };
        var params = { filters: filters };

        var url = '/errors.json?' + $.param(params);

        return $http.get(url, config).then(deserialize);
      }
    };
  }

  function ErrorDeserializer() {
    return function(response) {
      return response.data;
    }
  }

  function FiltersController($scope, ErrorsRepository) {
    _.bindAll(this);

    this.errors = [];
    this.filters = {};
    this.hasErrors = false;
    this.ErrorsRepository = ErrorsRepository;

    this.updateErrors();
  }

  FiltersController.prototype.setErrors = function(errors) {
    this.errors = errors;
    this.hasErrors = (errors.length === 0);
  };

  FiltersController.prototype.updateErrors = function() {
    var transformedFilters = _.transform(this.filters, function (result, value, key) {
      if(!_.isEmpty(value)) {
        result[key] = value
      }
    });

    this.ErrorsRepository.fetchErrors(transformedFilters).then(this.setErrors);
  }


  app.factory('ErrorsRepository', ['$http', 'ErrorDeserializer', ErrorsRepository]);
  app.factory('ErrorDeserializer', ['$http', ErrorDeserializer]);
  app.controller('FiltersController', FiltersController);
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
});