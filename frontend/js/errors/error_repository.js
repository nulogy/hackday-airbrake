define(['jquery'], function ($) {
  function ErrorRepository($http, deserialize) {
    return {
      fetchErrors: function(filters) {
        var config = { responseType: 'json' };
        var params = { filters: filters };

        var url = '/errors.json?' + $.param(params);

        return $http.get(url, config).then(deserialize);
      }
    };
  }

  return ErrorRepository;
});