<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>召回详细信息</title>
    <%@ include file="/common/include.jsp"%>
    
</head>
<body>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <th>预警日期
                    </th>
                    <td>
                    	<fmt:formatDate value="${bean.opDate}" pattern="yyyy-MM-dd" />	
                    </td>
                    <th>预警编号
                    </th>
                    <td>
                        ${bean.alertNo}
                    </td>
                </tr>
                <tr>
                    <th>生产者
                    </th>
                    <td>
                        ${bean.cofarmerName}
                    </td>
                    <th>农户姓名
                    </th>
                    <td>
                        ${bean.farmerName}
                    </td>
                </tr>
                <tr>
                    <th>作物名称
                    </th>
                    <td>
                        ${bean.goodsName}
                    </td>
                    <th>种植批次
                    </th>
                    <td>
                        ${bean.lotNo}
                    </td>
                </tr>

                <tr>
                    <th>采收批次
                    </th>
                    <td>
                        ${bean.plotharvestNo}
                    </td>
                    <th>包装
                    </th>
                    <td>
                        ${bean.packageNo}
                    </td>
                </tr>
                <tr>
                    <th>操作人
                    </th>
                    <td>
                        ${bean.operators}
                    </td>
                    <th>预警原因
                    </th>
                    <td colspan="3">
                        ${bean.notes}
                    </td>
                </tr>
            </tbody>
        </table>
            <div align=center style="margin-top: 20px">
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
    </div>
</body>
</html>

