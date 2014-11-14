define([
  'jquery',
  'lodash',
  'angular',
  'errors/error_repository',
  'errors/error_deserializer',
  'filters_controller',
  'select2'],

  function ($, _, angular, ErrorRepository, ErrorDeserializer, FiltersController) {
    var app = angular.module('gingerQuake', []);

    app.factory('ErrorDeserializer', ['$http', ErrorDeserializer]);
    app.factory('ErrorRepository', ['$http', 'ErrorDeserializer', ErrorRepository]);
    app.controller('FiltersController', ['$scope', 'ErrorRepository', FiltersController]);

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

<<<<<<< HEAD
    setupAutoComplete(".environment", {
      placeholder: "Select an Environment",
      ajax: { url: autocompleteUrlBuilder('environment') }
    });
=======
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
            results: _.map(data, function(text) { return {id: text, text: String(text)} })
          };
        }
      }
    };

    setupAutoComplete(".company_name", {
      placeholder: "Select a Company",
      ajax: { url: autocompleteUrlBuilder('company_name') }
    });

    setupAutoComplete(".account_name", {
      placeholder: "Select an Account",
      ajax: { url: autocompleteUrlBuilder('account_name') }
    });
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
});
