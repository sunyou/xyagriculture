<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农残检测详细信息</title>
    <%@ include file="/common/include.jsp"%>
</head>
<body>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <th>检测日期
                    </<th>
                    <td>
                    	<fmt:formatDate value="${bean.detectionDate}" pattern="yyyy/MM/dd" />
                    </td>
                    <th>检测编号
                    </th>
                    <td>
                        ${bean.detectionNo}
                    </td>
                </tr>
                <tr>
                    <th> 检测部门
                    </th>
                    <td>
                        ${bean.deptName}
                    </td>
                    <th>检测人
                    </th>
                    <td>
                        ${bean.detector}
                    </td>
                </tr>
                <tr>
                    <th>生产者
                    </th>
                    <td>
                        ${bean.cofarmerName}
                    </td>
                    <th>种植批次
                    </th>
                    <td>
                        ${bean.lotNo}
                    </td>
                </tr>
                <tr>
                    <th>采收
                    </th>
                    <td>
                        ${bean.plotharvestNo}
                    </td>
                    <th>抽检数量
                    </th>
                    <td>
                        ${bean.amount}
                    </td>
                </tr>
                <tr>
                    <th>检测依据
                    </th>
                    <td>
                    	<asia:write name="accroding" dictId="detection_accroding"></asia:write>
                    </td>
                    <th>检测类型
                    </th>
                    <td>
                    	<asia:write name="typeId" dictId="detection_type"></asia:write>
                    </td>
                </tr>
                <tr>
                    <th>检测方式
                    </th>
                    <td>
                    	<asia:write name="method" dictId="detection_method"></asia:write>
                    </td>
                    <th>检测结果
                    </th>
                    <td>
                    	<asia:write name="result" dictId="detection_result"></asia:write>
                    </td>
                </tr>
                <tr>
                    <th>检测证书
                    </th>
                    <td colspan="3">
                    	<c:if test="${!empty bean.docfilepath}">
                    	<img src="${ctx}/${bean.docfilepath}" alt="证书" width="460" height="350"/>
                    	</c:if>
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
