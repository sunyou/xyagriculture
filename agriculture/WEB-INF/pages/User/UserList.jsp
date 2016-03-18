<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            
            $("#btn_Add").hide();
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#gv_Users").createLigerGrid({
                header: [
                    { display: '用户账号', name: 'User_no' },
                    { display: '用户名称', name: 'User_Name', width: '300' },
                    { display: '联系电话', name: 'Tel' },
                    { display: '邮箱', name: 'Email' }
                ],
                param: { 'flag': 1, 'Dept_ID': "Dept_ID" },
                editor: {
                    width: 540,
                },
                leftBtns: {

                    show:false,
                    showDetail: {
                        url: "/Pages/User/UsersDet.aspx",
                        height: 200
                    },
                    
                    show:false,
                    showEdit: {
                        url: "/Pages/User/UserEdit.aspx",
                        height: 360
                    },
                    
                    show:false,

                    showDelete: {
                        show:false,
                        close: function () {
                            grid.reload();
                        }
                    },
                    editor: {
                        para: ["User_Name"]
                    }

                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "User_ID",
                ajaxURL: "/ZZ_LoginUser/getZZ_LoginUser"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_User_Name").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(540, 360, 'UserEdit.aspx?Type=1', '新增用户');
            });

        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">用户姓名：</div>
					<div class="sert left">
						<input type="text" id="txt_User_Name" class="serchInput" />
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
			<div id="gv_Users"></div>
		</div>
	</div>
</body>
</html>
