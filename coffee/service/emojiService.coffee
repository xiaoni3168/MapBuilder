MapBuilderService
    .service 'EmojiService', ['$q', ($q) ->
        emoji =
            # 'DogFace': 'emoji:emoji-1f436'
            # 'CatFace': 'emoji:emoji-1f431'
            # 'MouseFace': 'emoji:emoji-1f42d'
            # 'HamsterFace': 'emoji:emoji-1f439'
            # 'RabbitFace': 'emoji:emoji-1f430'
            # 'BearFace': 'emoji:emoji-1f43b'
            # 'PandaFace': 'emoji:emoji-1f43c'
            # 'Koala': 'emoji:emoji-1f428'
            # 'TigerFace': 'emoji:emoji-1f42f'
            # 'LionFace': 'emoji:emoji-1f981'
            # 'CowFace': 'emoji:emoji-1f42e'
            # 'PigFace': 'emoji:emoji-1f437'
            # 'PigNose': 'emoji:emoji-1f43d'
            # 'FrogFace': 'emoji:emoji-1f438'
            # 'Octopus': 'emoji:emoji-1f419'
            # 'MonkeyFace': 'emoji:emoji-1f435'
            # 'See-no-evilMonkey': 'emoji:emoji-1f648'
            # 'Hear-no-evilMonkey': 'emoji:emoji-1f649'
            # 'Speak-no-evilMonkey': 'emoji:emoji-1f64a'
            # 'Monkey': 'emoji:emoji-1f412'
            # 'Chicken': 'emoji:emoji-1f414'
            # 'Penguin': 'emoji:emoji-1f427'
            # 'Bird': 'emoji:emoji-1f426'
            # 'BabyChick': 'emoji:emoji-1f424'
            # 'HatchingChick': 'emoji:emoji-1f423'
            # 'Front-facingBabyChick': 'emoji:emoji-1f425'
            # 'WolfFace': 'emoji:emoji-1f43a'
            # 'Boar': 'emoji:emoji-1f417'
            # 'HorseFace': 'emoji:emoji-1f434'
            # 'UnicornFace': 'emoji:emoji-1f984'
            # 'Honeybee': 'emoji:emoji-1f41d'
            # 'Bug': 'emoji:emoji-1f41b'
            # 'Snail': 'emoji:emoji-1f40c'
            # 'LadyBeetle': 'emoji:emoji-1f41e'
            # 'Ant': 'emoji:emoji-1f41c'
            # 'Spider': 'emoji:emoji-1f577'
            # 'Scorpion': 'emoji:emoji-1f982'
            # 'Crab': 'emoji:emoji-1f980'
            # 'Snake': 'emoji:emoji-1f40d'
            # 'Turtle': 'emoji:emoji-1f422'
            # 'TropicalFish': 'emoji:emoji-1f420'
            # 'Fish': 'emoji:emoji-1f41f'
            # 'Blowfish': 'emoji:emoji-1f421'
            # 'Dolphin': 'emoji:emoji-1f42c'
            # 'SpoutingWhale': 'emoji:emoji-1f433'
            # 'Whale': 'emoji:emoji-1f40b'
            # 'Crocodile': 'emoji:emoji-1f40a'
            # 'Leopard': 'emoji:emoji-1f406'
            # 'Tiger': 'emoji:emoji-1f405'
            # 'WaterBuffalo': 'emoji:emoji-1f403'
            # 'Ox': 'emoji:emoji-1f402'
            # 'Cow': 'emoji:emoji-1f404'
            # 'DromedaryCamel': 'emoji:emoji-1f42a'
            # 'BactrianCamel': 'emoji:emoji-1f42b'
            # 'Elephant': 'emoji:emoji-1f418'
            # 'Goat': 'emoji:emoji-1f410'
            # 'Ram': 'emoji:emoji-1f40f'
            # 'Sheep': 'emoji:emoji-1f411'
            # 'Horse': 'emoji:emoji-1f40e'
            # 'Pig': 'emoji:emoji-1f416'
            # 'Rat': 'emoji:emoji-1f400'
            # 'Mouse': 'emoji:emoji-1f401'
            # 'Rooster': 'emoji:emoji-1f413'
            # 'Turkey': 'emoji:emoji-1f983'
            # 'DoveOfPeace': 'emoji:emoji-1f54a'
            # 'Dog': 'emoji:emoji-1f415'
            # 'Poodle': 'emoji:emoji-1f429'
            # 'Cat': 'emoji:emoji-1f408'
            # 'Rabbit': 'emoji:emoji-1f407'
            # 'Chipmunk': 'emoji:emoji-1f43f'
            # 'PawPrints': 'emoji:emoji-1f43e'
            # 'Dragon': 'emoji:emoji-1f409'
            # 'DragonFace': 'emoji:emoji-1f432'
            # 'Cactus': 'emoji:emoji-1f335'
            # 'ChristmasTree': 'emoji:emoji-1f384'
            # 'EvergreenTree': 'emoji:emoji-1f332'
            # 'DeciduousTree': 'emoji:emoji-1f333'
            # 'PalmTree': 'emoji:emoji-1f334'
            # 'Seedling': 'emoji:emoji-1f331'
            # 'Herb': 'emoji:emoji-1f33f'
            # 'Shamrock': 'emoji:emoji-2618'
            # 'FourLeafClover': 'emoji:emoji-1f340'
            # 'PineDecoration': 'emoji:emoji-1f38d'
            # 'TanabataTree': 'emoji:emoji-1f38b'
            # 'LeafFlutteringInWind': 'emoji:emoji-1f343'
            # 'FallenLeaf': 'emoji:emoji-1f342'
            # 'MapleLeaf': 'emoji:emoji-1f341'
            # 'EarOfRice': 'emoji:emoji-1f33e'
            # 'Hibiscus': 'emoji:emoji-1f33a'
            # 'Sunflower': 'emoji:emoji-1f33b'
            # 'Rose': 'emoji:emoji-1f339'
            # 'Tulip': 'emoji:emoji-1f337'
            # 'Blossom': 'emoji:emoji-1f33c'
            # 'CherryBlossom': 'emoji:emoji-1f338'
            # 'Bouquet': 'emoji:emoji-1f490'
            # 'Mushroom': 'emoji:emoji-1f344'
            # 'Chestnut': 'emoji:emoji-1f330'
            # 'Jack-o-lantern': 'emoji:emoji-1f383'
            # 'SpiralShell': 'emoji:emoji-1f41a'
            # 'SpiderWeb': 'emoji:emoji-1f578'
            # 'EarthGlobeAmericas': 'emoji:emoji-1f30e'
            # 'EarthGlobeEurope-africa': 'emoji:emoji-1f30d'
            # 'EarthGlobeAsia-australia': 'emoji:emoji-1f30f'
            # 'FullMoonSymbol': 'emoji:emoji-1f315'
            # 'WaningGibbousMoonSymbol': 'emoji:emoji-1f316'
            # 'LastQuarterMoonSymbol': 'emoji:emoji-1f317'
            # 'WaningCrescentMoonSymbol': 'emoji:emoji-1f318'
            # 'NewMoonSymbol': 'emoji:emoji-1f311'
            # 'WaxingCrescentMoonSymbol': 'emoji:emoji-1f312'
            # 'FirstQuarterMoonSymbol': 'emoji:emoji-1f313'
            # 'WaxingGibbousMoonSymbol': 'emoji:emoji-1f314'
            # 'NewMoonWithFace': 'emoji:emoji-1f31a'
            # 'FullMoonWithFace': 'emoji:emoji-1f31d'
            # 'FirstQuarterMoonWithFace': 'emoji:emoji-1f31b'
            # 'LastQuarterMoonWithFace': 'emoji:emoji-1f31c'
            # 'SunWithFace': 'emoji:emoji-1f31e'
            # 'CrescentMoon': 'emoji:emoji-1f319'
            # 'WhiteMediumStar': 'emoji:emoji-2b50'
            # 'GlowingStar': 'emoji:emoji-1f31f'
            # 'DizzySymbol': 'emoji:emoji-1f4ab'
            # 'Sparkles': 'emoji:emoji-2728'
            # 'Comet': 'emoji:emoji-2604'
            # 'BlackSunWithRays': 'emoji:emoji-2600'
            # 'WhiteSunWithSmallCloud': 'emoji:emoji-1f324'
            # 'SunBehindCloud': 'emoji:emoji-26c5'
            # 'WhiteSunBehindCloud': 'emoji:emoji-1f325'
            # 'WhiteSunBehindCloudWithRain': 'emoji:emoji-1f326'
            # 'Cloud': 'emoji:emoji-2601'
            # 'CloudWithRain': 'emoji:emoji-1f327'
            # 'ThunderCloudAndRain': 'emoji:emoji-26c8'
            # 'CloudWithLightning': 'emoji:emoji-1f329'
            # 'HighVoltageSign': 'emoji:emoji-26a1'
            # 'Fire': 'emoji:emoji-1f525'
            # 'CollisionSymbol': 'emoji:emoji-1f4a5'
            # 'Snowflake': 'emoji:emoji-2744'
            # 'CloudWithSnow': 'emoji:emoji-1f328'
            # 'Snowman': 'emoji:emoji-2603'
            # 'SnowmanWithoutSnow': 'emoji:emoji-26c4'
            # 'WindBlowingFace': 'emoji:emoji-1f32c'
            # 'DashSymbol': 'emoji:emoji-1f4a8'
            # 'CloudWithTornado': 'emoji:emoji-1f32a'
            # 'Fog': 'emoji:emoji-1f32b'
            # 'Umbrella': 'emoji:emoji-2602'
            # 'UmbrellaWithRainDrops': 'emoji:emoji-2614'
            # 'Droplet': 'emoji:emoji-1f4a7'
            # 'SplashingSweatSymbol': 'emoji:emoji-1f4a6'
            # 'WaterWave': 'emoji:emoji-1f30a'

        loadEmoji: () ->
            $q.when emoji
    ]
