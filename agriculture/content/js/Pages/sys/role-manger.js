$(function() {
			InfoBean.init();
			$("#roletab").ligerTab(
				{ height: "400" }
			);
});

var InfoBean = {
	tree : null,
	init : function() {
		InfoBean.initEl();

	},
	initEl : function() {
		InfoBean.initForm();
		InfoBean.initMenuTree();
	},
	initForm : function() {
		$("#inputForm").validate({
					rules : {},
					submitHandler : InfoBean.commit
		});
	},
	eachChildNodes:function(node,array){
		var data = {};
		data.menuId = node.id;
		data.parentMenuId = node.pid;
		data.menuName = node.name;
		array.push(data);
		if (node.children == undefined){
			return;
		}
		
         for (var i = 0; i < node.children.length; i++) {
           InfoBean.eachChildNodes(node.children[i], array);
       }
	},
	commit : function() {
		var nodes = InfoBean.tree.getNodes();
		var array = [];
		if(nodes&&nodes.length>0){
			for(var i=0;i<nodes.length;i++){
				InfoBean.eachChildNodes(nodes[i],array);
			}
			var menuIds = "";
			for(var i=0;i<array.length;i++){
				var menu = array[i];
				if(menu.menuId!="-999"){
					menuIds+=menu.menuId+",";
				}
			}
			if(menuIds!=""){
				$("#sysRole2menuList").val(menuIds.substr(0, menuIds.length - 1));
			}else {
				$("#sysRole2menuList").val("");
			}
		}else{
			$("#sysRole2menuList").val("");
		}
		var menuNodes = InfoBean.tree.getCheckedNodes();
		if (menuNodes && menuNodes.length > 0) {
			var menuIds = "";
			for (var i = 0; i < menuNodes.length; i++) {
				var id = menuNodes[i].id;
				if(id!="-1"&&id!="-2"){
					menuIds += menuNodes[i].id+ ",";
				}
			}
			$("#role2menuList").val(menuIds.substr(0, menuIds.length - 1));// 角色对应的菜单

		}else{
			$("#role2menuList").val("");// 角色对应的菜单
		}
		//ajaxSubmitForm($("#inputForm"), ajaxSubmitFormDefCallback);
		ajaxSubmitForm($("#inputForm"), null);
	},
	initMenuTree : function() {
		var chkStyle = "checkbox";
		var setting = {
			view : {
				showLine : true,
				selectedMulti : true
			},
			check : {
				enable : true,
				chkStyle : "checkbox",
				chkboxType : {
					"Y" : "ps",
					"N" : "ps"
				}
			},
			data : {
				keep : {
					leaf : false,
					parent : false
				},
				key : {
					checked : "checked",
					children : "children",
					name : "name"
				},
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "pid"
				}
			},
			callback : {
				onClick : function(evt, treeId, treeNode) {
					InfoBean.tree.checkNode(treeNode, !treeNode.checked, true);
				}
			}
		};
		$.ajax({
					url : GLOBAL.WEBROOT + "/sysrole/queryRoleMenu.ajax",
					dataType : 'json',
					method : "post",
					data:{"id":$("#roleId").val()},
					success : function(data) {
						InfoBean.tree = $.fn.zTree.init($("#menuTree"),
								setting, data.menuTree);
						InfoBean.tree.expandAll(true);
						$("#role2menuList").val(data.menuIds);
						// 回填
						var menus = $("#role2menuList").val().split("_");
						if (menus && menus.length > 0) {
							for (var i = 0; i < menus.length; i++) {
								InfoBean.tree.checkNode(InfoBean.tree
										.getNodeByParam("id", menus[i]));
							}
						}
					},

					complete : function() {
					}
				});

	}

};