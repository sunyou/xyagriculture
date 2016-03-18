<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>种植基地详细信息</title>
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
</head>
<body>

<br>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
               
                <tr>
                    <th>生产者
                    </th>
                    <td>
                      ${coFarmerBean.cofarmerName}
                    </td>
                    <th>农户名称
                    </th>
                    <td>
                         ${farmerBean.farmerName}
                    </td>
                </tr>
                <tr>
                    <th>地块编号
                    </th>
                    <td>
                         ${bean.plotNo}
                    </td>     
                    <th>地块名称
                    </th>
                    <td>
                         ${bean.plotName}
                    </td>               
                </tr>
                <tr>
                    
                    <th>面积（亩）
                    </th>
                    <td>
                          ${bean.areas}
                    </td>
                     <th>栽培方式
                    </th>
                    <td>
                      <c:choose>
							<c:when test="${bean.facilities=='1'}">
								露地
							</c:when>
							<c:when test="${bean.facilities=='2'}">
								塑料大棚
							</c:when>
							<c:when test="${bean.facilities=='3'}">
								日光温室
							</c:when>
							<c:when test="${bean.facilities=='4'}">
								地膜覆盖
							</c:when>
							<c:when test="${bean.facilities=='5'}">
								其他设施
							</c:when>
							<c:otherwise>
								未知
							</c:otherwise>
						</c:choose>
                    </td>
                </tr>
                <tr>
                    <th>土地状态
                    </th>
                    <td colspan="3">
                         <c:choose>
							<c:when test="${bean.state=='1'}">
								<font color='#FF5500'>已使用</font>
							</c:when>
							<c:otherwise>
								<font color='#0063DC'>未使用</font>
							</c:otherwise>
						</c:choose>
                    </td>
                </tr>
            </tbody>
        </table>
           <div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
    </div>
</body>
</html>
