<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农用物资详细信息</title>
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
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                   
                    <th width="15%">其他农资</th>
                    <td width="30%">
                       ${bean.materialName}
                    </td>
                     <th width="15%">通用名
                    </th>
                    <td width="40%">
                         ${bean.commonname}
                    </td>
                </tr>
                <tr>
                    
                     <th >登记证号</th>
                    <td>
                        ${bean.produceNo}
                    </td>
                  <th>生产厂家
                    </th>
                    <td>
                         ${producerBean.producerName}
                    </td>
                   
                </tr>                
                <tr>
                    <th>主要成分
                    </th>
                    <td>
                         ${bean.maincomponent} 
                    </td>
                    <th>使用方法
                    </th>
                    <td>
                       ${bean.notes} 
                    </td>                   
                </tr>
                <tr><th>适用对象</th>
                    <td colspan="3">${bean.usablerange}</td>
                </tr>
            </tbody>
        </table>
        <div align=center><br><br> 
			<input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
</body>
</html>

