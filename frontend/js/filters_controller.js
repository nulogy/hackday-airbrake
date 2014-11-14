define(['lodash'], function (_) {
  function FiltersController($scope, ErrorRepository) {
    _.bindAll(this);
    this.errors = [];
    this.filters = {};
    this.hasErrors = false;
    this.ErrorRepository = ErrorRepository;

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

    this.ErrorRepository.fetchErrors(transformedFilters).then(this.setErrors);
  }

  return FiltersController;
});