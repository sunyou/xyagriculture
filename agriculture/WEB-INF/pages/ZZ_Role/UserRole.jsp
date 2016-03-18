<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	权限分配
</title><link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=&lt;%=LastVersion%>" /><link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=&lt;%=LastVersion%>" /><link rel="Stylesheet" type="text/css" href="${ctx}/content/css/report.css" /><link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" /><link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <style type="text/css">
        body {
            padding: 5px;
            margin: 0;
            padding-bottom: 15px;
        }

        #layout1 {
            width: 100%;
            margin: 0;
            padding: 0;
        }

        .l-page-top {
            height: 80px;
            margin-bottom: 3px;
        }
    </style>

    <script type="text/javascript">
        var grid = null;
        var tree = null;
        var RightData = null;
        var details = new Array();
        var roleflag = null;
        var rightOld = new Array();

        $(document).ready(function () {
            $("#toptoolbar").ligerToolBar({
                items: [
                    { text: '保存配置',click: function (item) { SaveData(); } },
                    { line: true }
                ]
            });
            grid = $("#tree1").createLigerGrid({
                header: [
                    { display: '角色名称', name: 'RoleName', width: 200 }
                ],
                param: { 'flag': 1 },
                width: '100%',
                height: '100%',
                leftBtns: {
                    show: false
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                    roleflag = rowdata.RoleID;
                    getRoleRight(rowdata["RightIDs"]);
                },
                keyID: "RoleID",
                ajaxURL: "/ZZ_Role/GetRole"
            });
            menu = $.ligerMenu({
                top: 100, left: 100, width: 120, items:
                [
                {
                    text: '增加子权限', click: function (item) {
                        var node = menu.node;
                        doAddRight(node.data.RightName, node.data.RightID, node.data.RightFlag, node.data.ParentID);
                    }
                },
                { line: true },
                {
                    text: '修改权限', click: function (item) {
                        var node = menu.node;
                        doEditRight(node.data.RightID, node.data.RightName, node.data.ParentID, node.data.Notes, node.data.roleflag, node.data.PageName, node.data.FuncName, node.data.UpRightName);
                    }
                },
                { line: true },
                {
                    text: '删除权限', click: function (item) {
                        var node = menu.node;
                        if (node.data.children == undefined || node.data.children.length == 0) {
                            $.ligerDialog.confirm('确认删除该权限--？' + node.data.RightName, function (yes) {
                                if (yes) {
                                    doDeleteRight(node.data.RightID);
                                    getRightData();
                                }
                            });
                        } else {
                            $.ligerDialog.alert("该权限下含有子权限，无法删除！");
                        }
                    }
                }
                ]
            });
            getRightData();
            tree = $("#container").ligerTree({
                nodeWidth: 200,
                checkbox: true,
                idFieldName: 'RightID',
                textFieldName: 'RightName',
                parentIDFieldName: 'ParentID',
                isExpand: false,
                slide: false,
                onContextmenu: function (node, e) {
                    menu.node = node;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                }
            });
        });
        
        function getRightData() {
            getAjax('/ZZ_Right/GetRightTree', null, function (data) {
                MyLoading(false);
                tree.setData(data);
            });
        }

        function doEditRight(RightID, RightName, ParentID, Notes, RightFlag, PageName, FuncName, UpRightName) {
            var url = "AddRight.aspx?type=2&RightName=" + escape(RightName) + "&RightID=" + RightID + "&ParentID=" + ParentID + "&Notes=" + escape(Notes) + "&RightFlag=" + RightFlag + "&PageName=" + escape(PageName) + "&FuncName=" + escape(FuncName) + "&UpRightName=" + escape(UpRightName);
            art.dialog.open(url
                ,
                {
                    title: "修改权限",
                    width: 300,
                    height: 300,
                    close: function () {
                        getRightData();
                    }
                },
                false
                );
        }

        function doDeleteRight(RoleID) {
            $.ajax({
                url: "/ZZ_Right/DeleteRight",
                dataType: "json",
                type: "POST",
                data: { "ID": RoleID },
                complete: function (state) {
                    var ob = eval("(" + state.responseText + ")");
                    if (ob.success) {
                        alert("删除成功");
                    } else {
                        artDialog.alert(ob.message);
                    }
                }
            });
        }

        function doAddRight(RightName, RightID, RightFlag,ParentID) {
            var url = "AddRight.aspx?type=1&RightName=" + escape(RightName) + "&RightID=" + RightID + "&ParentID=" + ParentID;
            art.dialog.open(url
                ,
                {
                    title: "新增权限",
                    width: 500,
                    height: 300,
                    close: function () {
                        getRightData();
                    }
                },
                false
                );
        }

        function getRoleRight(Rights) {
            var fun = function (data) {
                return Rights.indexOf(data.RightID + ',') != -1;
            };
            tree.selectNode(fun);
        }
        function SaveData() {
            var nodes = tree.getChecked();
            for (var i = 0; i < nodes.length; i++) {
                details.push({ 'RoleID': roleflag, 'RightID': nodes[i].data["RightID"] });
            }
            $.ajax({
                url: "/ZZ_RoleRight/SaveRoleRight",
                dataType: "json",
                type: "POST",
                data: { "Details": JSON.stringify(details), "RightFlag": roleflag },
                complete: function (state) {
                    var ob = eval("(" + state.responseText + ")");
                    alert("已更新" + ob + "条数据，保存成功！");
                }
            });
        }
    </script>
</head>
<body>
    <div id="layout1" class="l-layout" ligeruiid="layout1">
        <div class="l-layout-left" style="left: 0px; width: 200px; top: 0px;">
            <div position="left" class="l-layout-content">
                <div id="tree1" style="margin: 0; padding: 0;"></div>
            </div>
        </div>
        <div class="l-layout-center" style="width: 100%; top: 0px; left: 205px; ">
            <div position="center" title="" class="l-layout-content" >
                <div id="toptoolbar"></div>
                <div id="container" class="ChartView" style="width: 100%; height: 100%; margin: 0px; padding: 0px;"></div>
            </div>
        </div>
    </div>
</body>
</html>
