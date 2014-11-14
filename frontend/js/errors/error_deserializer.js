define([], function () {
  function ErrorDeserializer() {
    return function(response) {
      return response.data;
    }
  }

  return ErrorDeserializer;
});