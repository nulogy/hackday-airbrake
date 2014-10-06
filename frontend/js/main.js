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
    console.log("Filtering on :: ", this.filters)
    this.ErrorsRepository.fetchErrors(this.filters).then(this.setErrors);
  }


  app.factory('ErrorsRepository', ['$http', 'ErrorDeserializer', ErrorsRepository]);
  app.factory('ErrorDeserializer', ['$http', ErrorDeserializer]);
  app.controller('FiltersController', FiltersController);
  angular.bootstrap(document, ['gingerQuake']);

  var resultsMapper = function (data) {
    return { results: _.map(data, function(text) { return {id: text, text: text } }) };
  }

  $(".category").select2({
    placeholder: "Select a Category",
    allowClear: true,
    multiple: true,
    ajax: {
      dataType: 'json',
      url: function (term) {
        return '/autocomplete/category/' + term;
      },
      results: resultsMapper
    }
  });

  $(".environment").select2({
    placeholder: "Select an Environment",
    allowClear: true,
    multiple: true,
    ajax: {
      dataType: 'json',
      url: function (term) {
        return '/autocomplete/environment/' + term;
      },
      results: resultsMapper
    }
  });

  $(".company_name").select2({
    placeholder: "Select an Company Name",
    allowClear: true,
    multiple: true,
    ajax: {
      dataType: 'json',
      url: function (term) {
        return '/autocomplete/company_name/' + term;
      },
      results: resultsMapper
    }
  });

  $(".account_name").select2({
    placeholder: "Select an Account Name",
    allowClear: true,
    multiple: true,
    ajax: {
      dataType: 'json',
      url: function (term) {
        return '/autocomplete/account_name/' + term;
      },
      results: resultsMapper
    }
  });
});