<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>食品等级详细信息</title>
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
                <th width="110">农产品等级证书名称
                </th>
                <td>
               ${bean.cername}
                </td>
                   <th width="110">农产品等级证书编号
                </th>

                <td>
                  ${bean.cerno}
                </td>
            </tr>
          
            <tr>
            	<th>农产品名称
                </th>
                <td>
                  ${bean.goodsname}
                </td>
                <th>企业单位名称
                </th>
                <td>
                  ${bean.cofarmerName}
                </td>
            
                
            </tr>
            <tr>
                 <th>证书有效期
                </th>
                <td>
                    ${bean.effectdate}
                </td>
            
                <th>批准产量
                </th>
                <td>
                   ${bean.appprod}
                </td>
            </tr>
            <tr>
                <th>发证日期
                </th>
                <td>
                  ${bean.signdate}
                </td>
           
                <th>发证单位
                </th>
                <td>
                    ${bean.signdept}
                </td>
            </tr>
            <tr>
              
                 <th>产地地址
                </th>
                <td colspan="3">
                  ${bean.chandiaddr}
                </td>
            </tr>
        </tbody>
    </table>
       <div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
		
		<br><br>农产品证书影印件：<br>
		 <a href="${ctx}/${bean.content}" target="_blank"><img src="${ctx}/${bean.content}" style="width:500px"></img></a>
</body>
</html>
