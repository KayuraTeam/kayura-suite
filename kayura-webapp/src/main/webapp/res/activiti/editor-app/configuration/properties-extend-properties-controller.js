/*
 * Activiti Modeler component part of the Activiti project
 * Copyright 2005-2014 Alfresco Software, Ltd. All rights reserved.
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

/*
 * Form Properties
 */

var KisBpmExtendPropertiesCtrl = [ '$scope', '$modal', '$timeout', '$translate', function($scope, $modal, $timeout, $translate) {

    // Config for the modal window
    var opts = {
        template:  'editor-app/configuration/properties/extend-properties-popup.html?version=' + Date.now(),
        scope: $scope
    };

    // Open the dialog
    $modal(opts);
}];

var KisBpmExtendPropertiesPopupCtrl = ['$scope', '$rootScope', '$q', '$translate', '$timeout', function($scope, $rootScope, $q, $translate, $timeout) {

    // Put json representing extend properties on scope
    if ($scope.property.value !== undefined && $scope.property.value !== null
        && $scope.property.value.extendProperties !== undefined
        && $scope.property.value.extendProperties !== null) {
        // Note that we clone the json object rather then setting it directly,
        // this to cope with the fact that the user can click the cancel button and no changes should have happended
        $scope.extendProperties = angular.copy($scope.property.value.extendProperties);
        
    } else {
        $scope.extendProperties = [];
    }
    
    // 预设扩展属性,UI生成.
    $scope.selectedShapeType = $scope.property.selectedShape.getStencil().idWithoutNs();
    $scope.predefineProperties = [];
    
    var configItems = ACTIVITI.PREDEFINEPROPERTIES;
    for(var i = 0; i < configItems.length; i++){
    	
    	var item = configItems[i];
    	if(item.packages.indexOf($scope.selectedShapeType) >=0 ){
    		
    		var temp = null;
        	for(var j = 0; j < $scope.extendProperties.length; j++){
        		if($scope.extendProperties[j].id == item.id){
        			temp = $scope.extendProperties[j];
        			$scope.extendProperties.splice(j, 1);
        			break;
        		}
        	}
        	
    		$scope.predefineProperties.push({ 
    			id: item.id, 
    			name: item.name, 
    			type: item.type, 
    			variable: temp != null ? temp.variable : item.variable, 
    			items: item.items 
        	});
    	}
    }

    // Array to contain selected properties (yes - we only can select one, but ng-grid isn't smart enough)
    $scope.selectedProperties = [];
    $scope.translationsRetrieved = false;
    $scope.labels = {};
    
    var idPromise = $translate('PROPERTY.EXTENDPROPERTIES.ID');
    var namePromise = $translate('PROPERTY.EXTENDPROPERTIES.NAME');
    var typePromise = $translate('PROPERTY.EXTENDPROPERTIES.TYPE');
    
    $q.all([idPromise, namePromise, typePromise]).then(function(results) { 
    	
    	$scope.labels.idLabel = results[0];
        $scope.labels.nameLabel = results[1];
        $scope.labels.typeLabel = results[2];
        $scope.translationsRetrieved = true;
        
    	// Config for grid
        $scope.gridOptions = {
            data: 'extendProperties',
            enableRowReordering: true,
            headerRowHeight: 28,
            multiSelect: false,
            keepLastSelected : false,
            selectedItems: $scope.selectedProperties,
            columnDefs: [{ field: 'id', displayName: $scope.labels.idLabel },
                { field: 'name', displayName: $scope.labels.nameLabel},
                { field: 'type', displayName: $scope.labels.typeLabel}]
        };
        
    });

    // Click handler for add button
    var propertyIndex = 1;
    $scope.addNewProperty = function() {
        $scope.extendProperties.push({ id : 'new_property_' + propertyIndex++,
            name : '',
            type : 'string',
            expression : '',
            variable: '' });
        
        $timeout(function(){
        	$scope.gridOptions.selectItem($scope.extendProperties.length - 1, true);
        });
    };

    // Click handler for remove button
    $scope.removeProperty = function() {
        if ($scope.selectedProperties.length > 0) {
            var index = $scope.extendProperties.indexOf($scope.selectedProperties[0]);
            $scope.gridOptions.selectItem(index, false);
            $scope.extendProperties.splice(index, 1);

            $scope.selectedProperties.length = 0;
            if (index < $scope.extendProperties.length) {
                $scope.gridOptions.selectItem(index + 1, true);
            } else if ($scope.extendProperties.length > 0) {
                $scope.gridOptions.selectItem(index - 1, true);
            }
        }
    };

    // Click handler for up button
    $scope.movePropertyUp = function() {
        if ($scope.selectedProperties.length > 0) {
            var index = $scope.extendProperties.indexOf($scope.selectedProperties[0]);
            if (index != 0) { // If it's the first, no moving up of course
                // Reason for funny way of swapping, see https://github.com/angular-ui/ng-grid/issues/272
                var temp = $scope.extendProperties[index];
                $scope.extendProperties.splice(index, 1);
                $timeout(function(){
                    $scope.extendProperties.splice(index + -1, 0, temp);
                }, 100);

            }
        }
    };

    // Click handler for down button
    $scope.movePropertyDown = function() {
        if ($scope.selectedProperties.length > 0) {
            var index = $scope.extendProperties.indexOf($scope.selectedProperties[0]);
            if (index != $scope.extendProperties.length - 1) { // If it's the last element, no moving down of course
                // Reason for funny way of swapping, see https://github.com/angular-ui/ng-grid/issues/272
                var temp = $scope.extendProperties[index];
                $scope.extendProperties.splice(index, 1);
                $timeout(function(){
                    $scope.extendProperties.splice(index + 1, 0, temp);
                }, 100);

            }
        }
    };

    // Click handler for save button
    $scope.save = function() {

    	var extendProperties = $scope.extendProperties;
        for(var i = 0; i < $scope.predefineProperties.length; i++){
        	
        	var prp = $scope.predefineProperties[i];
        	extendProperties.push({
        		id : prp.id,
                name : prp.name,
                type : prp.type,
                expression : '',
                variable: prp.variable
        	});
        	
        	console.log(prp.id + ":" + prp.variable);
        }
        
        if (extendProperties.length > 0) {
            $scope.property.value = {};
            $scope.property.value.extendProperties = extendProperties;
        } else {
            $scope.property.value = null;
        }

        $scope.updatePropertyInModel($scope.property);
        $scope.close();
    };

    $scope.cancel = function() {
    	$scope.$hide();
    	$scope.property.mode = 'read';
    };

    // Close button handler
    $scope.close = function() {
    	$scope.$hide();
    	$scope.property.mode = 'read';
    };

}];