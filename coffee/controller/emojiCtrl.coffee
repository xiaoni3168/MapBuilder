MapBuilderController
    .controller 'EmojiCtrl', ['$scope', '$timeout', ($scope, $timeout) ->
        emoji = $scope.emoji = {}
        emoji.path = 'bower_components/emojione/assets/sprites/emojione.sprites.svg#emoji-'
        $timeout () ->
            if $scope.dashboard.sidenav.isOpen()
                $scope.dashboard.sidenav.toggle()
        , 10
    ]
