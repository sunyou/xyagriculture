<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>






<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农作物详细信息</title>
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
                    <th width="70">农作物编号
                    </th>
                    <td>
                       ${bean.goodsstdNo}
                    </td>
               
                    <th width="70">作物名称
                    </th>
                    <td>
                        ${bean.goodsName}
                    </td>
                </tr>
                <tr>
                    <th>类别名称
                    </th>
                    <td>
                   ${bean.goodstypeName}
                    </td>
               
                    <th>通用名
                    </th>
                    <td>
                       ${bean.commonname} 
                    </td>

                </tr>
               
            </tbody>
        </table>
         <div align=center><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
			<br> 
				<c:if test="${bean.remark!=null}">	
        <div align=center style='font-size:16px'><b>农作物详细说明</b></div><br>
        <div>
			 ${bean.remark}
        </div>
        </c:if>
    </div>
</body>
</html>
