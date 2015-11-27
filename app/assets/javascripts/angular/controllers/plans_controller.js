app = angular.module('efood', ['ngRoute', 'ngResource']);
app.config(['$httpProvider', function (provider) {
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}])

app.factory('Plans', ['$resource', function ($resource) {

    return $resource('/plans.json', {'get': {method: 'GET', isArray: true}});
    /*return $resource('/plans.json', {}, {
        query: { method: 'GET', IsArray: false },
        create: { method: 'POST' }

    });*/
}]);

app.factory('Plan', ['$resource', function ($resource) {

    //return $resource('/plans/:id');
    return $resource('/plans/:id.json', {}, {
        show: { method: 'GET' },
        update: { method:  'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }

    });
}]);

app.controller('PlanListCtrl', ['$scope', '$resource', 'Plans', 'Plan', '$location', function ($scope, $resource, Plans, Plan, $location) {
    $scope.plans = Plans.query();

    $scope.deletePlan = function (planId) {
        if (confirm("Are you sure you want to delete this plan?")){
          Plan.delete({ id: planId }, function(){
            $scope.plans = Plans.query();
          });
        }
    };
}]);

app.controller('PlanShowCtrl', ['$scope', 'Plan', '$routeParams', '$location', function ($scope, Plan, $routeParams, $location) {

    var id = (/plans\/(\d+)/.exec($location.absUrl())[1]);
    $scope.plan = Plan.get({id: id});

}]);

app.controller('PlanFormCtrl', ['$scope', 'Plan', function ($scope, Plan) {

    var vm = this;

    vm.validatePlan = function(){
        vm.processing = true;

        if ($scope.planForm.$valid){
            console.log('Form valid')
        } else {
            console.log('Form no valid')
        }
    }

}]);




