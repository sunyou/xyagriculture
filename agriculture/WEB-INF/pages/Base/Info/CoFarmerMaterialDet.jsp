<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>生产者采购详细信息</title>
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
    <table class="data_grid" cellpadding="0" cellspacing="0" border="0" width="470">
        <tbody>
            <tr>
                <th width="20%">物资名称
                </th>
                <td width="30%">
                   ${bean.objectName}
                </td>
                <th width="20%">物资类型
                </th>
                <td width="30%">
                   <c:choose>
						<c:when test="${bean.cmtype=='1'}">
								肥料
							</c:when>
						<c:otherwise>
								农药
						</c:otherwise>
					</c:choose> 
                </td>
            </tr>
            <tr>
                <th width="80">生产者
                </th>
                <td>
                 ${bean.cofarmerName}
                </td>
                <th>经销商
                </th>
                <td>
                ${bean.supplierName}
                </td>
            </tr>
            <tr>
                <th>采购日期
                </th>
                <td>
                    <fmt:formatDate value="${bean.operatedate}"  pattern="yyyy-MM-dd"/>
                </td>
                <th>采购量
                </th>
                <td>
                   ${bean.qty} ${bean.unitname}
                </td>
            </tr>
            <tr>
                <th>操作人
                </th>
                <td colspan="3">
                    ${bean.operateuser}
                </td>
            </tr>
        </tbody>
    </table>
     <div align=center><br><br> 
			<input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
</body>
</html>
