<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>喷药信息</title>
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
	<c:if test="${!empty message}">
		<script>showTips('${message }');</script>
	</c:if>
    <div id="MaterialsBody" style="padding-top:20px;padding-left:10px;">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <td>标准编号
                    </td>
                    <td>
                        ${bean.critereriadocNo }
                    </td>
                    <td>标准名称
                    </td>
                    <td>
                        ${bean.critereriadocName }
                    </td>
                </tr>
                <tr>
                    <td>作物名称
                    </td>
                    <td>
                        ${bean.goodsNames }
                    </td>
                    <td>种植方式
                    </td>
                    <td>
						<asia:select name="criteriaLevel" dictId="std_criteriaLevel" nullOption="true" nullText="请选择" defaultValue="${bean.criteriaLevel}"></asia:select>
                    </td>
                </tr>
                <tr>
                    <td>标准类型
                    </td>
                    <td>
						<asia:select name="criteriatype" dictId="std_criteriaType" nullOption="true" nullText="请选择" defaultValue="${bean.criteriatype}"></asia:select>
                    </td>
                     <td>标准制定人
                    </td>
                    <td>
                        ${bean.criteriaMaker }
                    </td>
                </tr>
                <tr>
                    <td>文档名称
                    </td>
                    <td>
                        ${bean.docfilename }
                    </td>
                   <td>文档内容
                    </td>
                    <td>
                        ${bean.docfilecontent }
                    </td>
                </tr>
                <tr>
                    <td>版本号
                    </td>
                    <td>
                        ${bean.version }
                    </td>
                    <td>启用/禁用
                    </td>
                    <td>
                        <c:choose>
                        	<c:when test="${bean.isactive == 1 }">启用</c:when>
                        	<c:otherwise>禁用</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>
        <div align=center><br>
      	  <c:choose>
          	<c:when test="${not empty bean.docfilepath }">
          		<input value='下载文档' type=button class='xybtn'  onclick="window.open('${ctx}${bean.docfilepath }');" >
          	</c:when>
          	<c:otherwise></c:otherwise>
          </c:choose>
		  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
    </div>
</body>
</html>

