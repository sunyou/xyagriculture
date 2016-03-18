<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农产品存储详细信息</title>
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
                        <th width="80">存储日期：</th>
                        <td width="250">
                            <fmt:formatDate value="${bean.operdate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <th width="80">仓库名称： </th>
                        <td width="250">
                           ${bean.shName}
                        </td>
                       
                    </tr>
                    
                    <tr>
                        <th>采收 ：</th>
                        <td>
                            ${bean.plotharvestNo}
                        </td>
                        <th>农作物：</th>
                        <td>
                             ${bean.goodsName}
                        </td>
                    </tr>
                    <tr>
                        <th>温度(℃)：</th>
                        <td>
                           ${bean.tem}
                        </td>
                        <th>湿度(%)：</th>
                        <td>
                            ${bean.hum}
                        </td>
                    </tr>
                    <tr>
                        <th>压强(kPa)：</th>
                        <td>
                            ${bean.pres}
                        </td>
                        <th>光照(Lux)：</th>
                        <td>
                            ${bean.beam}
                        </td>
                    </tr>
                    <tr>
                        <th>存储类型：</th>
                        <td>
                            <asia:write name="stype" dictId="detection_accroding"></asia:write>

                        
                        </td>
                        <th>存储天数：</th>
                        <td>
                            ${bean.days}
                        </td>
                    </tr>
                    <tr>
                        <th>说明： </th>
                        <td colspan="3">
                            ${bean.remark}
                        </td>
                    </tr>
                    
                    <tr>
                     <th>存储人：</th>
                        <td>
                            ${bean.operater}
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

