  function ErrorRepository($http, deserialize) {
    return {
      fetchErrors: function(filters, pagination) {
        var config = { responseType: 'json' };
        var params = {
          filters: filters,
          pagination: pagination
        };

        var url = '/errors.json?' + $.param(params);

        return $http.get(url, config).then(deserialize);
      }
    };
  }