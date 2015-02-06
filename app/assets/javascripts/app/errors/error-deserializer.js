  function ErrorDeserializer() {
    return function(response) {
      return response.data.result;
    }
  }
