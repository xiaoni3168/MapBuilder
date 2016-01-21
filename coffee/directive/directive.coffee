MapBuilderDirective
    .directive 'mb', () ->
        restrict: 'EA'
        transclude: true
        controller: ($scope, $element, $attrs, $mdDialog, $timeout) ->
            mbInitWidth = $attrs.mbInitWidth
            mbInitHeight = $attrs.mbInitHeight
            if mbInitWidth && mbInitHeight
                if mbInitWidth % 32 != 0 || mbInitHeight % 32 != 0
                    console.warn 'Initial value must be 32 by times'

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

            mbContainer.attr 'tabindex', '-1'

            mbContainer.bind 'focus', (ev) ->
                mbContainer.bind 'keypress', (ev) ->
                    if ev.shiftKey && ev.keyCode == 67
                        angular.forEach mbMap.find('span'), (s) ->
                            as = angular.element s
                            if as.hasClass 'selected'
                                Materialize.toast as.text() + ' Copyed', 4000
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
