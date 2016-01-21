MapBuilderController
    .controller 'DashboardCtrl', ['$scope', '$timeout', '$mdSidenav', '$myInkRipple', 'EmojiService', ($scope, $timeout, $mdSidenav, $myInkRipple, EmojiService) ->
        dashboard = $scope.dashboard = {}

        $timeout () ->
            dashboard.sidenav = $mdSidenav 'left'
        , 10

        $scope.emojis = []
        $scope.headerIcon = 'emoji:emoji-1f431'

        dashboard.result1 = []
        dashboard.result2 = []

        EmojiService.loadEmoji().then (data) ->
            for name of data.data
                dashboard.result1.push data.data[name]
            tmp = []
            angular.forEach dashboard.result1, (r, index) ->
                tmp.push r
                if (index + 1) % 50 == 0
                    dashboard.result2.push tmp
                    tmp = []
        $scope.toggle = (navID) ->
            $mdSidenav navID
                .toggle()
        $scope.changeHeaderIcon = (emoji) ->
            $scope.headerIcon = 'emoji:emoji-' + emoji
            if !$mdSidenav 'left'
                .isOpen()
                    $mdSidenav 'left'
                        .toggle()
    ]
