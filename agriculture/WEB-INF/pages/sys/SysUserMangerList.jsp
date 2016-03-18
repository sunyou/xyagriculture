<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户列表</title>
    <%@ include file="/common/meta.jsp" %>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            
			
			$('#layout').ligerLayout({ topHeight: 68 });

            grid = $("#gv_sysuser_frame").createLigerGrid({
                header: [
                    { display: '登陆名', name: 'USER_NO' },
                    { display: '姓名', name: 'User_Name',render:showUserDetail },
                    { display: '区域', name: 'AREA_ID', width: '250' },
                    { display: '电话', name: 'Tel', width: '80'},
                    { display: '邮箱', name: 'Email', width: '100' },
                    { display: '类型', name: 'USERTYPE_ID' },
                    { display: '状态', name: 'ISACTIVE', width: '50'}
                ],
                param: { 'flag': 1},
                pageSize: 25,//页码大小
                editor: {
                    width: 520,
                    height: 300
                },
                leftBtns: {
                	width:170,
                    showDelete: {
                        show:true,
                        buttonName:"禁用",
                        url: "${ctx}/sysmanage/sysUserDelete.ajax",
                        close: function () {
                            grid.reload();
                        }                        
                    },
                    showEdit: {
                        show:true,
                        url: "${ctx}/sysmanage/userView.html",
                        width: 660,
                        height: 360,
                        close: function () {
                            grid.reload();
                        }
                    },                   
                    showDetail: {
                        show:false,
                        url: "${ctx}/sysmanage/userView.html",
                        width: 660,
                        height: 360
                    }
                },
                addTools: function (record, rowindex, value, column) {
                    return "<input  type='button' href='javascript:void(0);' value='密码重置' class='rowEditButton' onclick=\"pwdReset('" + record["USER_ID"] + "');\">&nbsp;&nbsp;";
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "USER_ID",
                ajaxURL: "${ctx}/sysmanage/queryUserList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("userName", $("#txt_UserName").val());
                grid.setParm("userType", $("#txt_UserType").val());
                grid.setParm("areaId", $("#areaId").val());
                grid.reload();
            }
            );
            $("#btn_Add").click(function () {
                openDialogInIframe(660, 360, '${ctx}/sysmanage/userView.html', '新增', null, grid);
            });

        });
        
        function pwdReset(userId) {
        	$.ajax({
			    type: "post",
			    url: "${ctx}/sysmanage/userPwdReset.ajax",
			    data: {"id":userId},
			    dataType: "json",
			    returnType:"json",
			    error : function(XMLResponse) {
				},
			    success : function(jsonData) {
					//后台操作成功
					if(jsonData.success && jsonData.success == true){
						art.dialog.tips('操作成功！',1);
					}
					//后台操作失败
					else{
						art.dialog.tips('操作失败，失败原因：'+jsonData.message,1);
					}
				}
			});
        }
        
        function showUserDetail(rowdata,index,value){
            var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"
            	+rowdata["USER_ID"]+"','"+value+"');\">"+value+"</a>";
            return html;
       } 
       
       function showPlantBase(farmerId ,farmerName){
       	myopen("${ctx}/sysmanage/userView.html?type=3&id="+farmerId,"查看用户 " + farmerName + " 的详情"  ,660,360);
       }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top" class="l-layout-content">
		<input type="hidden" id="areaId" name="areaId" />
			<div class="rtittab">
				<div class="rtitbg2">
				    <div class="rtxt left">所属区域：</div>
				   <div class="rtxt left">
							<select name="provinceAid" class="input-select"
								id="province" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="cityAid" class="input-select" id="city"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="countyAid" class="input-select"
								id="county" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="townAid" class="input-select" id="town"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="rtittab">
			
				<div class="rtitbg2">
					<div class="rtxt left">用户姓名：</div>
					<div class="sert left">
						<input type="text" id="txt_UserName" />
					</div>
					<div class="rtxt left">用户类型：</div>
					<div class="sert left">
						<asia:select id="txt_UserType" name="SYS_USER_TYPE" dictId="SYS_USER_TYPE" nullOption="true" nullText="请选择" ></asia:select>
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
			<div id="gv_sysuser_frame"></div>
		</div>
	</div>
</body>
</html>

