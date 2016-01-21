MapBuilderController = angular.module 'MapBuilder.controllers', []
MapBuilderService = angular.module 'MapBuilder.services', []
MapBuilderDirective = angular.module 'MapBuilder.directives', []

MapBuilder = angular.module 'MapBuilder', ['ngMaterial', 'ui.router', 'MapBuilder.controllers', 'MapBuilder.services', 'MapBuilder.directives']

MapBuilder
    .factory '$myInkRipple', ['$mdInkRipple', ($mdInkRipple) ->
        attach: (scope, element, options) ->
            $mdInkRipple.attach scope, element, angular.extend
                center: false
                dimBackground: true
            , options
    ]
    .config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/map/home'
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
            .state 'map.map',
                url: '/map'
                views:
                    'content':
                        templateUrl: 'template/map.html'
                        controller: 'MapCtrl'
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
