MapBuilderController
    .controller 'DashboardCtrl', ['$scope', '$timeout', '$mdSidenav', ($scope, $timeout, $mdSidenav) ->
        $scope.title = 'Hello World'
        $scope.toggle = (navID) ->
                    $mdSidenav navID
                    .toggle()

    ]
