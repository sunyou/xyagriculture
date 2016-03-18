<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>技术员详细信息</title>
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
<br/>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <th>技术员姓名
                    </th>
                    <td colspan="3">
                        ${bean.userName}
                    </td>                    
                </tr>
                <tr>
                    <th>性别
                    </th>
                    <td>
                       ${bean.sex}
                    </td>
                    <th>注册日期
                    </th>
                    <td>
                        ${bean.recordDate}
                    </td>                
                </tr>
                <tr>
                    <th>邮箱
                    </th>
                    <td>
                       ${bean.email}
                    </td>                   
                    <th>专业特长
                    </th>
                    <td>
                     ${bean.professional}
                    </td>
                </tr>
                <tr>
                    <th>手机
                    </th>
                    <td>
                         ${bean.mobile}
                    </td>
                    <th>联系电话
                    </th>
                    <td>
                        ${bean.tel}
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                     <th>联系地址
                    </th>
                    <td>
                         ${bean.address}
                    </td>
                    <th>用户简介
                    </th>
                    <td colspan="3">
                        ${bean. pyshort}
                    </td>
                </tr>

            </tbody>
        </table>
        
        <div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
    </div>
</body>
</html>
