define([], function () {
  function PaginationCtrl($scope) {
    $scope.totalItems = 64;
    $scope.numPages = 100;
    $scope.currentPage = 2;

    $scope.pageChanged = function() {
      console.log('Page changed to: ' + $scope.currentPage);
    };
  }

  return PaginationCtrl;
});