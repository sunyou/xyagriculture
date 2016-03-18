<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/common/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色权限管理</title>
<%@ include file="/common/meta.jsp" %>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/ztree/zTreeStyle.css"/>
    <script type="text/javascript" src="${ctx}/js/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/Pages/sys/role-manger.js"></script>
</head>
<body>
		<div>
			<table class="data_grid" width="100%">
            	<tbody>
					<tr>
						<td>
							<div>角色编码:</div>
						</td>
						<td><span>${bean.roleid}</span></td>
						<td>
							<div>角色名称:</div>
						</td>
						<td><span>${bean.rolename}</span>
						</td>
					</tr>
			 	</tbody>
			</table>
		</div>
		
		<div id="roletab" >
			  <div tabid="role_menu" title="菜单权限" lselected="true" style="height: 400px">
				  <form id="inputForm" name="inputForm" action="${ctx}/sysrole/sysRoleMenuSave.ajax" method='post'>
				  	 	<input type="hidden" name="id"  id="roleId" value="${bean.roleid}"/>
  						<input type="hidden" name="role2menuList"  id="role2menuList" value="${searchModel.role2menuList}"/>
   						<input type="hidden" name="sysRole2menuList"  id="sysRole2menuList"/>
					  	
					  	
					  	<div id="menuTree" class="ztree" style="height: 340px;overflow: auto;">
					  	</div>
					  	<div align=center>
					  		<input
								type="submit" name="btn_SaveData" value="保存" id="btn_SaveData"
								class="xybtn" /> 
					  	</div>
				  </form>
	          </div><%--改为一个人员只有一个角色，所以这个没必要了
	          <div tabid="role_user" title="人员分配"  style="height: 400px">
	          	<iframe frameborder="0" name="roleuser" id="roleuser" src="${ctx}/sysrole/queryRoleUser.html?id=${bean.roleid}"></iframe>
	          </div>
	     --%></div>
</body>
</html>

