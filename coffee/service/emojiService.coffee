MapBuilderService
    .service 'EmojiService', ['$q', '$http', ($q, $http) ->
        loadEmoji: () ->
            $http.get 'bower_components/emojione/emoji_strategy.json'
    ]
