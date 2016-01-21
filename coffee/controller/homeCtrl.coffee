MapBuilderController
    .controller 'HomeCtrl', ['$scope', '$mdSidenav', 'EmojiService', '$timeout', ($scope, $mdSidenav, EmojiService, $timeout) ->
        $timeout () ->
            if $scope.dashboard.sidenav.isOpen()
                $scope.dashboard.sidenav.toggle()
        , 10

        emojione.imageType = 'svg'
        emojione.sprites = true
        emojione.imagePathSVGSprites = 'bower_components/emojione/assets/sprites/emojione.sprites.svg'
        $scope.em = () ->
            emoji = document.getElementById 'input'
                .value
            out = emojione.toImage emoji
            document.getElementById 'emoji'
                .innerHTML = out
    ]
