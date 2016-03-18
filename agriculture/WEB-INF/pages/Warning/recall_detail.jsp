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
                    <th>召回日期
                    </th>
                    <td>
                    	<fmt:formatDate value="${bean.opDate}" pattern="yyyy-MM-dd" />
                    </td>
                    <th>召回编号
                    </th>
                    <td>
                        ${bean.recallNo}
                    </td>
                </tr>
                <tr>
                    <th>种植批次
                    </th>
                    <td>
                        ${bean.lotNo}
                    </td>
                    <th>采收批次
                    </th>
                    <td colspan="3">
                        ${bean.plotharvestNo}
                    </td>
                </tr>

                <tr>
                    <th>包装
                    </th>
                    <td>
                        ${bean.packageNo}
                    </td>
                    <th>作物名称
                    </th>
                    <td>
                        ${bean.goodsName}
                    </td>
                </tr>

                <tr>
                    <th>购入量
                    </th>
                    <td>
                        ${bean.purchaseamount}
                    </td>
                    <th>召回量
                    </th>
                    <td>
                        ${bean.recallamount}
                    </td>
                </tr>
                <tr>
                    <th>操作人
                    </th>
                    <td>
                        ${bean.operators}
                    </td>
                    <th>召回原因
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

