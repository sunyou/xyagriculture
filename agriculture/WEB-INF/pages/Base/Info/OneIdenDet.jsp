<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>地理标志详细信息</title>
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
                <th width="100">核准登记产品全称
                </th>
                <td>
                   ${bean.oneidenname}
                </td>
           
                <th  width="100">证书编号
                </th>

                <td>
                 ${bean.oneidenno}
                </td>
            </tr>
            <tr>
                <th>登记申请人
                </th>
                <td>
                   ${bean.register}
                </td>
           
                <th>产品生产总规模
                </th>
                <td>
                    ${bean.prodscale}
                </td>
            </tr>
            <tr>
                <th>质量控制规范编号
                </th>
                <td colspan="3">
                     ${bean.specnum}
                </td>
            </tr>
        </tbody>
    </table>
       <div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
</body>
</html>
