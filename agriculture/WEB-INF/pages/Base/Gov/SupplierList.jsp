<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>经销商列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            
            $("#btn_Add").hide();
            
			$('#layout').ligerLayout({ topHeight: 30 });
            grid = $("#datagrid").createLigerGrid({
                header: [
                    { display: '用户名', name: 'User_Name' },
                    { display: '所属区域', name: 'Area_ID' },
                    { display: '电话', name: 'Tel' },
                    { display: '邮箱', name: 'Email' },
                    { display: '状态', name: 'IsActive',render:function(record, rowindex, value, column){return (record["IsActive"]=="True" ? "<font color='blue'>启用</font>" : "<font color='red'>禁用</font>");} }

                ],
                param: { 'flag': 1, "userType": 3 },
                editor: {
                    width: 630,
                    height: 280
                },
                //addTools: function (record, rowindex, value, column) {
                //    return "<a href='javascript:;' onclick=\"ligerWin(300, 200, 'ZZ_LoginUserEdit.aspx?type=1&ID=" + record["User_ID"] + "&userName=" + record["User_Name"] + "', '操作成功');\">更改密码</a>";
                //},
                addTools: function (record, rowindex, value, column) {
                    return "<a href='javascript:;' class=\"ligerBtnEdit\" onclick=\"ligerWin(300, 200, 'ZZ_LoginUserEdit.aspx?type=1&ID=" + record["User_ID"] + "&userName=" + record["User_Name"] + "', '操作成功');\">更改密码</a>&nbsp;&nbsp;"+
                    "<a href='javascript:;' class=\"ligerBtnEdit\" onclick=\"ligerWin(300, 200, 'ZZ_LoginUserEdit.aspx?type=2&ID=" + record["User_ID"] + "&userName=" + record["User_Name"] + "&IsActive=" + record["IsActive"] + "', '操作成功',function(){grid.reload();});\">"+(record["IsActive"]=="False" ? "<font color='blue'>启用</font>" : "<font color='red'>禁用</font>")+"</a>";
                },
                leftBtns: {
                    showDelete: {                        
                        show:false,
                        close: function () {
                            grid.reload();
                        }
                    },                   
                    showDetail: {
                        show:false,
                        url: "/Pages/Base/Gov/LoginUserDet.aspx",
                        width: 500,
                        height: 180
                    },
                    showEdit: {
                        show:false,
                        url: "/Pages/Base/Info/TechEdit.aspx",
                        close: function () {
                            grid.reload();
                        }
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "User_ID",
                ajaxURL: "/ZZ_LoginUser/GetZZ_LoginUser"
            });
            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_GoodsName").val());
                grid.setParm("userType", 3);
                grid.reload()
            }
            );
        })
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">农资经销商名称：</div>
					<div class="sert left">
						<input type="text" id="txt_GoodsName" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="datagrid"></div>
		</div>
	</div>
</body>
</html>
