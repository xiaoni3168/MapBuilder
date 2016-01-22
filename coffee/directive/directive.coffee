MapBuilderDirective
    .directive 'mb', () ->
        restrict: 'EA'
        transclude: true
        controller: ($scope, $element, $attrs, $mdDialog, $timeout, UtilService) ->
            mbInitWidth = $attrs.mbInitWidth
            mbInitHeight = $attrs.mbInitHeight
            if mbInitWidth && mbInitHeight
                if mbInitWidth % 32 != 0 || mbInitHeight % 32 != 0
                    console.warn 'Initial value must be 32 by times'

            clipboard = undefined

            dircMb = $scope.dircMb = {}
            mbBody = angular.element '<div>'
            mbOptionArea = angular.element '<div>'
            mbContainer = angular.element '<div>'
            mbToolBox = angular.element '<div>'
            mbMap = angular.element '<div>'
            mbWidthInputContainer = angular.element '<div>'
            mbHeightInputContainer = angular.element '<div>'
            mbWidthInputLabel = angular.element '<label>'
            mbHeightInputLabel = angular.element '<label>'
            mbWidthInput = angular.element '<input>'
            mbHeightInput = angular.element '<input>'
            mbGenerateButton = angular.element '<a>'

            # test
            tt = angular.element '<span>'
            tt.attr 'style', 'position:absolute;height:32px;width:32px;background-color:gray;cursor:move;'
            mbToolBox.append tt
            tt.on 'click', (ev) ->
                tt.addClass 'z-depth-2'
            mbToolBox.bind 'focus', (ev) ->
                mbToolBox.bind 'keypress', (ev) ->
                    if ev.shiftKey
                        switch ev.keyCode
                            when 67 then angular.forEach mbToolBox.find('span'), (s) ->
                                as = angular.element s
                                if as.hasClass 'z-depth-2'
                                    clipboard = angular.copy as
                                    Materialize.toast 'Copyed Tool', 4000
            mbToolBox.bind 'blur', (ev) ->
                mbToolBox.unbind 'keypress'

            moveContainer = undefined
            tt.on 'mousedown', (e1) ->
                console.log tt
                moveContainer = angular.copy tt
                mbBody.append moveContainer
                moveContainer.css
                    'position': 'absolute'
                    'opacity': '0.5'
                    'transition': '.5s'
                    'transform': 'scale(1.2)'
                    'top': tt[0].offsetTop + 'px'
                    'left': tt[0].offsetLeft + 'px'
                mbBody.on 'mousemove', (e2) ->
                    moveContainer.css
                        'top': e2.clientY - 64 - 16 + 'px'
                        'left': e2.clientX - 272 - 16 + 'px'
                mbBody.on 'mouseup', (e3) ->
                    mbBody.off 'mousemove'
                    mbBody.off 'mouseup'
                    moveContainer.css
                        'opacity': '1'
                        'transform': 'scale(1)'
                        'top': e3.clientY - 64 - 16 + 'px'
                        'left': e3.clientX - 272 - 16 + 'px'
            # test end

            mbContainer.attr 'tabindex', '-1'
            mbToolBox.attr 'tabindex', '-1'

            mbContainer.bind 'focus', (ev) ->
                mbContainer.bind 'keypress', (ev) ->
                    if ev.shiftKey
                        switch ev.keyCode
                            when 67 then angular.forEach mbMap.find('span'), (s) ->
                                as = angular.element s
                                if as.hasClass 'selected'
                                    Materialize.toast as.text() + ' Copyed', 4000
                            when 65 then angular.forEach mbMap.find('span'), (s) ->
                                as = angular.element s
                                if not as.hasClass 'selected'
                                    as.addClass 'selected'
                            when 68 then angular.forEach mbMap.find('span'), (s) ->
                                as = angular.element s
                                if as.hasClass 'selected'
                                    as.removeClass 'selected'
                            when 86 then angular.forEach mbMap.find('span'), (s) ->
                                as = angular.element s
                                if as.hasClass('selected') and as.find('span').length is 0
                                    as.append angular.copy(clipboard)
            mbContainer.bind 'blur', (ev) ->
                mbContainer.unbind 'keypress'
            # regist function
            initMap = (widthRange, heightRange) ->
                for w in widthRange
                    for h in heightRange
                        str = w + '-' + h
                        div = angular.element '<span>'
                        div.attr 'id', str
                        div.attr 'class', 'tooltipped'
                        div.text w + '-' + h
                        div.attr 'data-position', 'top'
                        div.attr 'data-delay', '50'
                        div.attr 'data-tooltip', str
                        div.on 'click', (ev) ->
                            target = angular.element ev.target
                            if target.hasClass 'selected'
                                target.removeClass 'selected'
                            else
                                target.addClass 'selected'
                        mbMap.append div
                $timeout () ->
                    $ '.tooltipped'
                        .tooltip
                            delay: 50
                    , 10
            initContainer = (width, height) ->
                mbMap.css
                    'width': width + 'px'
                    'height': height + 'px'

            # init
            mbWidthInput.val if mbInitWidth then mbInitWidth else null
            mbHeightInput.val if mbInitHeight then mbInitHeight else null
            if mbWidthInput.val() && mbHeightInput.val()
                initContainer mbInitWidth, mbInitHeight
                initMap [1.. mbInitWidth / 32], [1.. mbInitHeight / 32]

            # option area
            mbWidthInputLabel.text 'Width'
            mbWidthInputLabel.attr 'class', 'active'
            mbHeightInputLabel.text 'Height'
            mbHeightInputLabel.attr 'class', 'active'
            mbOptionArea.attr 'class', 'row'
            mbWidthInputContainer.attr 'class', 'input-field col s3'
            mbHeightInputContainer.attr 'class', 'input-field col s3'
            mbWidthInput.attr 'type', 'text'
            mbWidthInput.attr 'placeholder', 'Width(* 32)'
            mbHeightInput.attr 'type', 'text'
            mbHeightInput.attr 'placeholder', 'Height(* 32)'
            mbGenerateButton.attr 'class', 'waves-effect waves-light btn-large'
            mbGenerateButton.attr 'style', 'margin-top:10px;'
            mbGenerateButton.text 'Generate'

            # tool box
            mbToolBox.attr 'class', 'mb-toolbox'

            mbGenerateButton.on 'click', (ev) ->
                dircMb.width = mbWidthInput.val()
                dircMb.height = mbHeightInput.val()
                if dircMb.width % 32 != 0 || dircMb.height % 32 != 0
                    $mdDialog.show(
                        $mdDialog.alert()
                        .parent angular.element(document.querySelector 'body' )
                        .clickOutsideToClose true
                        .title 'Oops'
                        .textContent 'Please checkout your value'
                        .ok 'Got it'
                        .openFrom '#header'
                        .closeTo '#FBA'
                    )
                    return 0

                angular.forEach mbMap.find('span'), (item) ->
                    item.remove()
                initContainer dircMb.width, dircMb.height
                widthRange = [1.. dircMb.width / 32]
                heightRange = [1.. dircMb.height / 32]
                initMap widthRange, heightRange

            # map area
            mbContainer.attr 'class', 'mb-container'
            mbMap.attr 'class', 'z-depth-2 mb-map'

            mbWidthInputContainer.append mbWidthInputLabel
            mbHeightInputContainer.append mbHeightInputLabel
            mbWidthInputContainer.append mbWidthInput
            mbHeightInputContainer.append mbHeightInput
            mbContainer.append mbMap
            mbOptionArea.append mbWidthInputContainer
            mbOptionArea.append mbHeightInputContainer
            mbOptionArea.append mbGenerateButton
            mbBody.append mbOptionArea
            mbBody.append mbContainer
            mbBody.append mbToolBox

            $element.append mbBody
