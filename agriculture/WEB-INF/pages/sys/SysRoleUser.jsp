<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>角色用户列表</title>
    <%@ include file="/common/meta.jsp" %>
    <style type="text/css">
		<!--
		#main {
			width: 100%;
		}
		#left {
			float: left;
			width: 50%;
		}
		#right {
			float: left;
			width: 50%;
		}
		-->
		</style>
    <script type="text/javascript">
        var grid = null;
        var grid_use = null;
        $(document).ready(function () {
            
			
			$('#layout').ligerLayout({ topHeight: 30 });

            grid = $("#gv_sysuser_frame").createLigerGrid({
                header: [
                    { display: '账号', name: 'USER_NO' },
                    { display: '姓名', name: 'User_Name',render:showUserDetail }
                ],
                param: { 'flag': 1,'notRoleId':${roleId}},
                pageSize: 7,//页码大小
                title:"未分配人员",
                editor: {
                    width: 520,
                    height: 300
                },
                leftBtns: {
                	width:80,
                    showDelete: {
                    	show:true,
                        buttonName:"授权",
                        url: "${ctx}/sysrole/sysRoleTUser.ajax",
                        close: function () {
                            grid.reload();
                            grid_use.reload();
                        }                        
                    },
                    showEdit: {
                        show:false,
                        buttonName:"修改",
                    },                   
                    showDetail: {
                        show:false,
                        buttonName:"授权",
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "USER_ID",
                ajaxURL: "${ctx}/sysmanage/queryUserList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("userName", $("#txt_UserName").val());
                grid.reload();
            }
            );
           
			
			
			$('#layout_use').ligerLayout({ topHeight: 30 });

            grid_use = $("#gv_sysuser_frame_use").createLigerGrid({
                header: [
                    { display: '账号', name: 'USER_NO' },
                    { display: '姓名', name: 'User_Name',render:showUserDetail }
                ],
                param: { 'flag': 1,'roleId':${roleId}},
                pageSize: 7,//页码大小
                title:"已分配人员",
                editor: {
                    width: 520,
                    height: 300
                },
                leftBtns: {
                	width:80,
                	showDelete: {
                    	show:false,
                        buttonName:"授权",
                    },
                    showEdit: {
                        show:true,
                        buttonName:"解除",
                        url: "${ctx}/sysrole/sysUserOutRole.ajax",
                        width: 660,
                        height: 360,
                        close: function () {
                        	  grid.reload();
                              grid_use.reload();
                        }
                    },                   
                    showDetail: {
                        show:false,
                        buttonName:"授权",
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "USER_ID",
                ajaxURL: "${ctx}/sysmanage/queryUserList.ajax"
            });

            $("#btn_Search_use").click(function () {
                grid.setParm("userName", $("#txt_UserName_use").val());
                grid.reload();
            }
            );

        });
        
        
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
	
	<!--right begin-->
    <div class="right">

        <div class="aboutus-content">
        
        	<div id="main">
			  <div id="left">
		            <div class="honorList">
		               <div id="layout">
							<div position="top">
								<div class="rtittab">
									<div class="rtitbg2">
										<div class="rtxt left">用户姓名：</div>
										<div class="sert left">
											<input type="text" id="txt_UserName" />
										</div>
										<div class="serb left">
											<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<div position="center">
								<div id="gv_sysuser_frame"></div>
							</div>
				</div>
            </div>
			  
			  </div>
			  <div id="right">
            <div class="mapList">
            	<div id="layout_use">
					<div position="top">
						<div class="rtittab">
							<div class="rtitbg2">
								<div class="rtxt left">用户姓名：</div>
								<div class="sert left">
									<input type="text" id="txt_UserName_use" />
								</div>
								<div class="serb left">
									<input type="button" id="btn_Search_use" value="查询" class="btn_tool_search" />
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					<div position="center">
						<div id="gv_sysuser_frame_use"></div>
					</div>
				</div>
            </div>
			  
			  </div>
			</div>

            

            

        </div>


    </div>
    <!--right end-->
    <div class="clear"></div>
</body>
</html>