MapBuilderService
    .service 'UtilService', [() ->
        util = deepExtend: (des) ->
            angular.forEach arguments, (obj) ->
                if obj isnt des
                    angular.forEach obj, (value, key) ->
                        if angular.isObject des[key] or angular.isArray des[key]
                            util.deepExtend des[key], value
                        else
                            des[key] = angular.copy value
            return des
    ]
