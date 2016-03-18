<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>食品标准详细信息</title>
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
                        <th style="width:120px;">食品标准编号：  </th>
                        <td  >
                            ${std.sno }
                        </td>
                        <th style="width:120px;">食品标准类型： </th>
                        <td>
                          ${std.stype }
                        </td>
                    </tr>
                    
                    <tr>
                    	<th >食品标准名称：  </th>
                        <td colspan="3">
                          ${std.sname } 
                        </td>
                    </tr>
                     <tr>
                        <td>说明备注 </td>
                        <td  colspan="3">
                            ${std.introduction }
                        </td>
                    </tr>
                    
                     <tr>
                        <td>上传日期：
                        </td>
                        <td>
                            2007/10/24
                        </td>
                        <td>更新日期：
                        </td>
                        <td>
                             ${std.uploaddate }
                        </td>
                    </tr>
                    <tr>
                    	<td>文件下载 ：
                        </td>
                        <td colspan="3">  <a  href="${std.docsrc };" target="_blank">点击下载，文件大小：${std.docsize }</a> 
              
                        </td>
                    </tr>
                    
                    
                </tbody>
            </table>
           
        </div>
		<div align=center><br>  
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
</body>
</html>
