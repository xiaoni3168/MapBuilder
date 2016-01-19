MapBuilderController = angular.module 'MapBuilder.controllers', []
MapBuilderService = angular.module 'MapBuilder.services', []

MapBuilder = angular.module 'MapBuilder', ['ngMaterial', 'ui.router', 'MapBuilder.controllers', 'MapBuilder.services']

MapBuilder
    .factory '$myInkRipple', ['$mdInkRipple', ($mdInkRipple) ->
        attach: (scope, element, options) ->
            $mdInkRipple.attach scope, element, angular.extend
                center: false
                dimBackground: true
            , options
    ]
    .config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/map'
        $stateProvider
            .state 'map',
                url: '/map'
                views:
                    'dashboard':
                        templateUrl: 'template/dashboard.html'
                        controller: 'DashboardCtrl'
            .state 'map.home',
                url: '/home'
                views:
                    'content':
                        templateUrl: 'template/home.html'
                        controller: 'HomeCtrl'
            .state 'map.emoji',
                url: '/emoji'
                views:
                    'content':
                        templateUrl: 'template/emoji.html'
                        controller: 'EmojiCtrl'
    ]
    .config ['$mdThemingProvider', ($mdThemingProvider) ->
        $mdThemingProvider.theme 'default'
            .warnPalette 'blue'
    ]
    .config ['$mdIconProvider', ($mdIconProvider) ->
        $mdIconProvider
            .iconSet('map', 'svg/map.svg', 297)
            .iconSet('emoji', 'svg/emojione.sprites.svg', 64);
    ]
