MapBuilderController
    .controller 'DashboardCtrl', ['$scope', '$timeout', '$mdSidenav', '$myInkRipple', 'EmojiService', ($scope, $timeout, $mdSidenav, $myInkRipple, EmojiService) ->
        $scope.emojis = []
        $scope.headerIcon = 'emoji:emoji-1f431'
        EmojiService.loadEmoji()
            .then (emoji) ->
                $scope.icons = emoji
                for e of $scope.icons
                    $scope.emojis.push
                        name: e
                        emoji: $scope.icons[e]
        $scope.toggle = (navID) ->
            $mdSidenav navID
            .toggle()
        $scope.changeHeaderIcon = (emoji) ->
            $scope.headerIcon = emoji
            if !$mdSidenav 'left'
                .isOpen()
                    $mdSidenav 'left'
                    .toggle()
    ]
