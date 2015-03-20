function FiltersController($scope, ErrorRepository) {
  _.bindAll(this);
  this.errors = [];
  this.filters = {};
  this.hasErrors = false;
  this.ErrorRepository = ErrorRepository;
  this.pagination = { last_id: null };

  this.updateErrors();

  this.first = function() {
    this.pagination = { last_id: null };
    this.updateErrors();
  };

  this.next = function() {
    this.pagination = { last_id: _.last(this.errors).id };
    this.updateErrors();
  };
}

FiltersController.prototype.setErrors = function(errors) {
  this.errors = errors;
  this.hasErrors = (errors.length === 0);
};

FiltersController.prototype.updateErrors = function() {
  var transformedFilters = _.transform(this.filters, function (result, value, key) {
    if (!_.isEmpty(value)) {
      result[key] = value
    }
  });

  this.ErrorRepository.fetchErrors(transformedFilters, this.pagination).then(this.setErrors);
}