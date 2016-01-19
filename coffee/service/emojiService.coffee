MapBuilderService
    .service 'EmojiService', ['$q', ($q) ->
        emoji =
            'CatFace': 'emoji:emoji-1f431'
            'DogFace': 'emoji:emoji-1f436'
            'MouseFace': 'emoji:emoji-1f42d'
            'HamsterFace': 'emoji:emoji-1f439'
            'RabbitFace': 'emoji:emoji-1f430'
            'BearFace': 'emoji:emoji-1f43b'
            'PandaFace': 'emoji:emoji-1f43c'
            'Koala': 'emoji:emoji-1f428'
            'TigerFace': 'emoji:emoji-1f42f'
            'LionFace': 'emoji:emoji-1f981'
            'CowFace': 'emoji:emoji-1f42e'
            'PigFace': 'emoji:emoji-1f437'
            'PigNose': 'emoji:emoji-1f43d'
            'FrogFace': 'emoji:emoji-1f438'
            'Octopus': 'emoji:emoji-1f419'
            'MonkeyFace': 'emoji:emoji-1f435'
            'SeeNoEvilMonkey': 'emoji:emoji-1f648'
            'HearNoEvilMonkey': 'emoji:emoji-1f649'
            'SpeakNoEvilMonkey': 'emoji:emoji-1f64a'
            'Monkey': 'emoji:emoji-1f412'
            'Chicken': 'emoji:emoji-1f414'
            'Penguin': 'emoji:emoji-1f427'
            'Bird': 'emoji:emoji-1f426'
            'BabyChick': 'emoji:emoji-1f424'
            'HatchingChick': 'emoji:emoji-1f423'
            'FrontFacingBabyChick': 'emoji:emoji-1f425'
            'WolfFace': 'emoji:emoji-1f43a'
            'Boar': 'emoji:emoji-1f417'

        loadEmoji: () ->
            $q.when emoji
    ]
