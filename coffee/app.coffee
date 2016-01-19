MapBuilderController = angular.module 'MapBuilder.controllers', []
MapBuilderService = angular.module 'MapBuilder.services', []

MapBuilder = angular.module 'MapBuilder', ['ngMaterial', 'ui.router', 'MapBuilder.controllers', 'MapBuilder.services']

MapBuilder
    .config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/map'
        $stateProvider.state 'map',
            url: '/map'
            views:
                'dashboard':
                    templateUrl: 'template/dashboard.html'
                    controller: 'DashboardCtrl'
    ]
    .config ['$mdThemingProvider', ($mdThemingProvider) ->
        $mdThemingProvider.theme 'default'
            .warnPalette 'blue'
    ]
    .config ['$mdIconProvider', ($mdIconProvider) ->
        $mdIconProvider
            .iconSet('map', 'svg/map.svg', 317);
    ]
