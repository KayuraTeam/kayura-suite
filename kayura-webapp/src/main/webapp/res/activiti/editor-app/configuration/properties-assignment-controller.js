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
 * Assignment
 */
var KisBpmAssignmentCtrl = [ '$scope', '$modal', function($scope, $modal) {

    // Config for the modal window
    var opts = {
        template:  'editor-app/configuration/properties/assignment-popup.html?version=' + Date.now(),
        scope: $scope
    };

    // Open the dialog
    $modal(opts);
}];

var KisBpmAssignmentPopupCtrl = [ '$http', '$scope', '$modal', function($http, $scope, $modal) {
    
	// 三种指派对象：指派人(assignment),候选人(candidateUsers),候选组(candidateGroups)
	
	// 改造方案:添加选择组织机构人员按钮.
	// 分别为:单选人员/多选人员/多选组织(部门/岗位/角色/群组);

	var findAssignItems = function($http, ids, type, onsuccess){
		
		// 选读取群组列表.
	    $http.get(KISBPM.URL.getAssign(), { params: { "type": type, "ids": ids } })
	    .success(function(result, status, headers) {
	    	if(onsuccess) onsuccess(result);
	    });
	};
	
    // Put json representing assignment on scope
    if ($scope.property.value !== undefined && $scope.property.value !== null
        && $scope.property.value.assignment !== undefined
        && $scope.property.value.assignment !== null) 
    {
        $scope.assignment = $scope.property.value.assignment;
    } else {
        $scope.assignment = {};
    }
    
    if($scope.assignment.assignee != undefined){
    	findAssignItems($http, $scope.assignment.assignee, "U", function(result) {
    		
    		if(result != undefined && result.length == 1) {
	        	$scope.assignment.assigneeName = result[0].name;
	        	$scope.assignment.assigneeType = result[0].type;
	        	$scope.assignment.assigneeTypeName = result[0].typeName;
    		}
    	});
    }

    if ($scope.assignment.candidateUsers == undefined || $scope.assignment.candidateUsers.length == 0)
    {
    	$scope.assignment.candidateUsers = [{value: '', name: '', type: '', typeName: '' }];
    } else {
    	
    	var users = $scope.assignment.candidateUsers;
    	var ids = [];
    	for (var int = 0; int < users.length; int++) {
			var user = users[int];
			if(user.hasOwnProperty('value')){
				ids.push(user['value']);
			}
    	}
    	
    	findAssignItems($http, ids.join(","), "U", function(result){

    		if(result != undefined && result.length > 0) {
    			
	    		var userItems = [];
	        	for (var int = 0; int < result.length; int++) {
	    			var item = {
						value: result[int].value,
						name: result[int].name,
						//fullName: result[int].name + "（" + result[int].typeName + "）",
						type: result[int].type,
						typeName: result[int].typeName
	    			};
	    			userItems.push(item);
	        	}
				$scope.assignment.candidateUsers = userItems;
    		}
    	});
    }
    
    // Click handler for + button after enum value
    var userValueIndex = 1;
    $scope.addCandidateUserValue = function(index) {
        $scope.assignment.candidateUsers.splice(index + 1, 0, {value: 'value ' + userValueIndex++});
    };

    // Click handler for - button after enum value
    $scope.removeCandidateUserValue = function(index) {
        $scope.assignment.candidateUsers.splice(index, 1);
    };
    
    if ($scope.assignment.candidateGroups == undefined || $scope.assignment.candidateGroups.length == 0)
    {
    	$scope.assignment.candidateGroups = [{value: '', name: '', type: '', typeName: '' }];
    } else {
    	
    	var groups = $scope.assignment.candidateGroups;
    	var ids = [];
    	for (var int = 0; int < groups.length; int++) {
			var group = groups[int];
			if(group.hasOwnProperty('value')){
				ids.push(group['value']);
			}
    	}
    	
    	findAssignItems($http, ids.join(","), "G", function(result){
    		
    		if(result != undefined && result.length > 0) {
    			
	    		var groupItems = [];
	        	for (var int = 0; int < result.length; int++) {
	    			var item = {
						value: result[int].value,
						name: result[int].name,
						//fullName: result[int].name + "（" + result[int].typeName + "）",
						type: result[int].type,
						typeName: result[int].typeName
	    			};
	    			groupItems.push(item);
	        	}
				$scope.assignment.candidateGroups = groupItems;
    		}
    	});
    }
    
    var groupValueIndex = 1;
    $scope.addCandidateGroupValue = function(index) {
        $scope.assignment.candidateGroups.splice(index + 1, 0, {value: 'value ' + groupValueIndex++});
    };

    // Click handler for - button after enum value
    $scope.removeCandidateGroupValue = function(index) {
        $scope.assignment.candidateGroups.splice(index, 1);
    };
    
    // 指派人选择.
    $scope.selectAssignee = function(){

    	var assignee = $scope.assignment.assignee;
    	var selectedItems = [];
    	if(assignee != undefined && assignee.length > 0){
    		selectedItems.push({ 
        		value: $scope.assignment.assignee, 
        		name: $scope.assignment.assigneeName,
        		type: $scope.assignment.assigneeType,
        		typeName: $scope.assignment.assigneeTypeName
        	});
    	}
    	
    	$scope.updateAssignment = function(selectedItems){
    		
    		if(selectedItems.length > 0){
    			var item = selectedItems[0];
        		$scope.assignment.assignee = item.value; 
        		$scope.assignment.assigneeName = item.name; 
        		$scope.assignment.assigneeType = item.type; 
        		$scope.assignment.assigneeTypeName = item.typeName; 
    		} else {
        		$scope.assignment.assignee = ""; 
        		$scope.assignment.assigneeName = ""; 
        		$scope.assignment.assigneeType = ""; 
        		$scope.assignment.assigneeTypeName = ""; 
    		}
    	};
    	
    	popupAssignmentSelector($scope, $modal, {
    		"multi": false,
    		"selectType": 'user',
    		"selectedItems" : selectedItems
    	});
    	
    };
    
    // 选择候选人员.
    $scope.selectCandidateUsers = function(){

    	var items = $scope.assignment.candidateUsers;
    	var selectedItems = [];
    	for ( var int = 0; int < items.length; int++ ) {
			if( items[int].value.length > 0 ) {
				selectedItems.push({
					value: items[int].value,
					name: items[int].name,
					type: items[int].type,
					typeName: items[int].typeName
				});
			}
    	}
    	
    	$scope.updateAssignment = function(selectedItems){
    		
    		var userItems = [], items = selectedItems;
    		if( items.length > 0 ) {
	        	for (var int = 0; int < items.length; int++) {
	    			var item = {
						value: items[int].value,
						name: items[int].name,
						type: items[int].type,
						typeName: items[int].typeName
	    			};
	    			userItems.push(item);
	        	}
    		} else {
    			userItems = [{value: '', name: '', type: '', typeName: '' }];
    		}
			$scope.assignment.candidateUsers = userItems;
    	};
    	
    	popupAssignmentSelector($scope, $modal, {
    		"multi": true,
    		"selectType": 'user',
    		"selectedItems" : selectedItems
    	});
    };
    
    // 选择候选组.
    $scope.selectCandidateGroups = function(){

    	var items = $scope.assignment.candidateGroups;
    	var selectedItems = [];
    	for ( var int = 0; int < items.length; int++ ) {
			if( items[int].value.length > 0 ) {
				selectedItems.push({
					value: items[int].value,
					name: items[int].name,
					type: items[int].type,
					typeName: items[int].typeName
				});
			}
    	}
    	
    	$scope.updateAssignment = function(selectedItems){
    		
    		var groupItems = [], items = selectedItems;
    		if( items.length > 0 ) {
	        	for (var int = 0; int < items.length; int++) {
	    			var item = {
						value: items[int].value,
						name: items[int].name,
						type: items[int].type,
						typeName: items[int].typeName
	    			};
	    			groupItems.push(item);
	        	}
    		} else {
    			groupItems = [{value: '', name: '', type: '', typeName: '' }];
    		}
        	$scope.assignment.candidateGroups = groupItems;
    	};
    	
    	popupAssignmentSelector($scope, $modal, {
    		"multi": true,
    		"selectType": 'group',
    		"selectedItems" : selectedItems
    	});
    };
    
    $scope.save = function() {

        $scope.property.value = {};
        handleAssignmentInput($scope);
        $scope.property.value.assignment = $scope.assignment;
        
        $scope.updatePropertyInModel($scope.property);
        $scope.close();
    };

    // Close button handler
    $scope.close = function() {
    	handleAssignmentInput($scope);
    	$scope.property.mode = 'read';
    	$scope.$hide();
    };
    
    // 添加的代码,用于弹出选择指派.
    
    var popupAssignmentSelector = function($scope, $modal, opts) {

    	$scope.selector = { config: opts };
    	
		$modal({
			template:  'editor-app/configuration/properties/assignment-selector-popup.html?version=' + Date.now(),
			scope: $scope
		});
    };

    var handleAssignmentInput = function($scope) {
    	
    	if ($scope.assignment.candidateUsers)
    	{
	    	var emptyUsers = true;
	    	var toRemoveIndexes = [];
	        for (var i = 0; i < $scope.assignment.candidateUsers.length; i++)
	        {
	        	if ($scope.assignment.candidateUsers[i].value != '')
	        	{
	        		emptyUsers = false;
	        	}
	        	else
	        	{
	        		toRemoveIndexes[toRemoveIndexes.length] = i;
	        	}
	        }
	        
	        for (var i = 0; i < toRemoveIndexes.length; i++)
	        {
	        	$scope.assignment.candidateUsers.splice(toRemoveIndexes[i], 1);
	        }
	        
	        if (emptyUsers)
	        {
	        	$scope.assignment.candidateUsers = undefined;
	        }
    	}
        
    	if ($scope.assignment.candidateGroups)
    	{
	        var emptyGroups = true;
	        var toRemoveIndexes = [];
	        for (var i = 0; i < $scope.assignment.candidateGroups.length; i++)
	        {
	        	if ($scope.assignment.candidateGroups[i].value != '')
	        	{
	        		emptyGroups = false;
	        	}
	        	else
	        	{
	        		toRemoveIndexes[toRemoveIndexes.length] = i;
	        	}
	        }
	        
	        for (var i = 0; i < toRemoveIndexes.length; i++)
	        {
	        	$scope.assignment.candidateGroups.splice(toRemoveIndexes[i], 1);
	        }
	        
	        if (emptyGroups)
	        {
	        	$scope.assignment.candidateGroups = undefined;
	        }
    	}
    };
    
}];

var KisBpmAssignmentSelectorPopupCtrl = [ '$http', '$scope', '$modal', function($http, $scope, $modal) {
	
	var $config = $scope.selector.config;
	var $selector = $scope.selector = {
		config: {
			multi: $config.multi,
    		selectType: $config.selectType
		},
	    findGroupType: "N",
		findGroupKeyword: "",
		findUserKeyword: "",
		inputCustomExpr: "",
		dataGroups: [],
		dataUsers: [],
		assignment: {
			assignee: {},
			candidateUsers: [],
			candidateGroups: []
		},
		selectedItems: $config.selectedItems // id,name,type
	};
	
	var $selectionItem = {
		groupId: "",
		userId: ""
	};
	
	$selector.groupCategories = [
	   { value: "N", text: "-请选择-" },
       { value: "R", text: "角色" },
       { value: "G", text: "群组" },
       { value: "D", text: "部门" },
       { value: "P", text: "岗位" }
	];
	if( $config.selectType == "user") {
		$selector.groupCategories.push({ value: "T", text: "表达式" });
	} else {
		$selector.groupCategories.push({ value: "E", text: "表达式" });
	}
	
	$selector.closeSelector = function(){
		
		$scope.selector = undefined;
		$scope.$hide();
	};
	
	$selector.saveSelector = function(){
		
		$scope.updateAssignment($selector.selectedItems);
		$selector.closeSelector();
	};
	
	$selector.addSelectionGroup = function() {
		
		if($selector.gridGroups.selectedItems.length > 0) {
			var item = $selector.gridGroups.selectedItems.pop();
			var items = $selector.selectedItems;
			if(!itemExists(items, item.value)) {
				$selector.selectedItems.push({
					value: item.value,
					name: item.name,
					type: item.type,
					typeName: item.typeName
				});
 			}
		}
	};
	
	$selector.addSelectionUser = function(){

		if($selector.gridUsers.selectedItems.length > 0) {
			var item = $selector.gridUsers.selectedItems.pop();
			var items = $selector.selectedItems;
			if( $config.multi == true || items.length == 0) {
				if(!itemExists(items, item.value)) {
					$selector.selectedItems.push({
						value: item.value,
						name: item.name,
						type: item.type,
						typeName: item.typeName
					});
				}
			}
		}
	};
	
	$selector.removeSelectionItem = function(){
		
		var selItems = $selector.gridSelectedItems.selectedItems;
		if(selItems.length > 0) {
			var item = selItems.pop();
			var items = $selector.selectedItems;
	    	for ( var i = 0; i < items.length; i++ ) {
				if( items[i].value == item.value ) {
					$selector.selectedItems.splice(i,1);
					break;
				}
	    	}
		}
	};
	
	$selector.addCustomExpr = function(){
		
		var expr = $selector.inputCustomExpr;
		if(expr.length > 0){
			var items = $selector.selectedItems;
			if(!itemExists(items, expr)) {
				$selector.selectedItems.push({
					value: expr,
					name: expr,
					type: "T",
					typeName: "表达式"
				});
			}
		}
		$selector.inputCustomExpr = "";		
	};
	
	var itemExists = function(items, value){
		
    	for ( var int = 0; int < items.length; int++ ) {
			if( items[int].value == value ) {
				return true;
			}
    	}
		return false;
	};
	
	$selector.findGroups = function(){
		
		// 选读取群组列表.
		if( $selector.findGroupType != "N" ) {
			
		    $http.get(KISBPM.URL.getGroup(), 
		    	{ params: { "type": $selector.findGroupType, "keyword": $selector.findGroupKeyword } })
		    .success(function(result, status, headers) {
		    	$selector.dataGroups = result;
		    	$selector.gridGroups.selectedItems.splice(0);
		    });
		} else {
			
			$selector.dataGroups.splice(0);
		}
	};
	
	$selector.findUsers = function(){
	
		// 选读取人员列表.
	    $http.get(KISBPM.URL.getUser(), 
	    	{ params: { "groupId": $selectionItem.groupId, "keyword": $selector.findUserKeyword } })
	    .success(function(result, status, headers) {
	    	$selector.dataUsers = result;
	    	$selector.gridUsers.selectedItems.splice(0);
	    });
	};
	
	$selector.gridGroups = {
		data: 'selector.dataGroups',
		headerRowHeight: 28,
		multiSelect: false,
		keepLastSelected : true,
		selectedItems: [],
		afterSelectionChange: function (rowItem, event) {
			
			if($selectionItem.groupId !== rowItem.entity.value){
				$selectionItem.groupId = rowItem.entity.value;
				$selector.selectionGroup = {
					value: rowItem.entity.value,
					name: rowItem.entity.name,
					type: rowItem.entity.type,
					typeName: rowItem.entity.typeName
				};
				
				if($config.selectType == 'user') {
					$selector.findUsers();
				}
			}
		},
		columnDefs: [
			{ field: 'name', displayName: '名称' },
			{ field: 'typeName', displayName: '类型', width: 60 }
		]
	};
	
	$selector.gridUsers = {
		data: 'selector.dataUsers',
		headerRowHeight: 28,
		multiSelect: false,
		keepLastSelected : true,
		selectedItems: [],
		afterSelectionChange: function (rowItem, event) {
			if($selectionItem.userId !== rowItem.entity.value){
				$selectionItem.userId = rowItem.entity.value;
				$selector.selectionUser = {
						value: rowItem.entity.value,
						name: rowItem.entity.name,
						type: rowItem.entity.type,
						typeName: rowItem.entity.typeName
					};
			}
		},
		columnDefs: [
			{ field: 'name', displayName: '名称' },
			{ field: 'typeName', displayName: '类型', width: 60 }
		]
	};
	
	$selector.gridSelectedItems = {
		data: 'selector.selectedItems',
		headerRowHeight: 28,
		multiSelect: false,
		keepLastSelected : true,
		selectedItems: [],
		columnDefs: [
			{ field: 'name', displayName: '名称' },
			{ field: 'typeName', displayName: '类型', width: 60 }
		]
	};
	
}];
