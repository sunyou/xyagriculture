<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>角色列表</title>
    <%@ include file="/common/meta.jsp" %>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30 });
            grid = $("#gv_sysrole_frame").createLigerGrid({
                header: [
                    { display: '角色编码', name: 'ROLEID' },
                    { display: '角色名称', name: 'ROLENAME' }
                ],
                param: { 'flag': 1 },
                pageSize: 20,//页码大小
                editor: {
                    width: 520,
                    height: 300
                },
                leftBtns: {
                	width:170,
                    showDelete: {
                        show:true,
                        buttonName:"删除",
                        url: "${ctx}/sysrole/roleDelete.ajax",
                        close: function () {
                            grid.reload();
                        }                        
                    },
                    showEdit: {
                        show:true,
                        buttonName:"修改",
                        url: "${ctx}/sysrole/roleView.html",
                        width: 660,
                        height: 160,
                        close: function () {
                            grid.reload();
                        }
                    },                   
                    showDetail: {
                        show:true,
                        buttonName:"授权",
                        url: "${ctx}/sysrole/roleRight.html",
                        width: 960,
                        height: 560
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "ROLEID",
                ajaxURL: "${ctx}/sysrole/queryRoleList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("roleName", $("#txt_RoleName").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                openDialogInIframe(660, 160, '${ctx}/sysrole/roleView.html', '新增角色', null, grid);
            });

        });
       
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">角色名称：</div>
					<div class="sert left">
						<input type="text" id="txt_RoleName" />
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
			<div id="gv_sysrole_frame"></div>
		</div>
	</div>
</body>
</html>

