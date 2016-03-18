<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农产品加工详细信息</title>
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


	<table class="data_grid" cellpadding="0" cellspacing="0" border="0"  width="98%">
         <tbody>
             
             <tr>
                 <th width="80">加工日期：</th>
                 <td width="250">
                  <fmt:formatDate value="${bean.operateDate}" pattern="yyyy-MM-dd"/>
                 </td>
       
                 <th  width="80">农作物：</th>
                 <td  width="250">
                     ${bean.goodsName}
                 </td>
             </tr>
             <tr>
                
            
                 <th>种植批次 ：</th>
                 <td>
                     ${bean.lotNo}
                 </td>
                  <th>采收批次：</th>
                 <td>
                    ${bean.plotharvestNo}
                 </td>
             </tr>
             <tr>
                
             
                 <th>加工数量：</th>
                 <td>
                     ${bean.processQty}
                 </td>
                  <th>说明： </th>
                 <td >
                     ${bean.notes}
                 </td>
             </tr>
             <tr>
             	<th>加工人： </th>
                 <td>
                     ${bean.operators}
                 </td>
                 <th>生产商：</th>
                 <td>
                    ${bean.cofarmerName}
                 </td>
             
                 
             </tr>
         </tbody>
     </table>
	<div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
</body>
</html>

