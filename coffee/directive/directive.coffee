MapBuilderDirective
    .directive 'mb', () ->
        restrict: 'EA'
        transclude: true
        controller: ($scope, $element, $attrs, $mdDialog) ->
            dircMb = $scope.dircMb = {}

            mbBody = angular.element '<div>'
            mbOptionArea = angular.element '<div>'
            mbContainer = angular.element '<div>'
            mbToolBox = angular.element '<div>'
            mbWidthInputContainer = angular.element '<div>'
            mbHeightInputContainer = angular.element '<div>'
            mbWidthInputLabel = angular.element '<label>'
            mbHeightInputLabel = angular.element '<label>'
            mbWidthInput = angular.element '<input>'
            mbHeightInput = angular.element '<input>'
            mbGenerateButton = angular.element '<a>'

            # option area
            mbWidthInputLabel.text 'Width(* 32)'
            mbHeightInputLabel.text 'Height(* 32)'
            mbOptionArea.attr 'class', 'row'
            mbWidthInputContainer.attr 'class', 'input-field col s3'
            mbHeightInputContainer.attr 'class', 'input-field col s3'
            mbWidthInput.attr 'type', 'text'
            mbHeightInput.attr 'type', 'text'
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
                mbContainer.css
                    width: dircMb.width + 'px'
                    height: dircMb.height + 'px'

            # map area
            mbContainer.css
                'display': 'inline-block'
                'background-color': '#288812'
                'transition': '.75s'
                'height': 0
                'width': 0
            mbContainer.attr 'class', 'z-depth-2'

            mbWidthInputContainer.append mbWidthInputLabel
            mbHeightInputContainer.append mbHeightInputLabel
            mbWidthInputContainer.append mbWidthInput
            mbHeightInputContainer.append mbHeightInput
            mbOptionArea.append mbWidthInputContainer
            mbOptionArea.append mbHeightInputContainer
            mbOptionArea.append mbGenerateButton
            mbBody.append mbOptionArea
            mbBody.append mbContainer
            mbBody.append mbToolBox

            $element.append mbBody
