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
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <td colspan="4">
                        <font color="#0090D7">施肥农事操作详细信息</font>
                    </td>
                </tr>
                <tr>
                    <td nowrap>基地名称
                    </td>
                    <td>
                       ${bean.plantbasesName }
                    </td>
                    <td nowrap>地块名称
                    </td>
                    <td>
                        ${bean.plotName }
                    </td>
                </tr>
                <tr>
                    <td nowrap>农作物
                    </td>
                    <td>
                       ${bean.goodsName }
                    </td>
                    <td nowrap>种苗
                    </td>
                    <td>
                        ${bean.goodvarietyName }
                    </td>
                </tr>
                <tr>
                    <td nowrap>农用物资
                    </td>
                    <td>
                       ${bean.materialName }
                    </td>
                    <td nowrap>登记证号
                    </td>
                    <td>
                        ${bean.produceNo }
                    </td>
                </tr>
                <tr>
                    <td nowrap>含量
                    </td>
                    <td>
                    	${bean.hanliang }
                    </td>
                     <td nowrap>主要成分
                    </td>
                    <td>
                        ${bean.maincomponent }
                    </td>
                </tr>
                <tr>
                    <td nowrap>生产厂家
                    </td>
                    <td >
                        ${bean.produceName }
                    </td>
                    <td nowrap>经销商
                    </td>
                    <td >
                        ${bean.supplierName }
                    </td>
                </tr>
                
                 <tr>
                    <td nowrap>每亩标准用量
                    </td>
                    <td >
                        ${bean.amountper }
                    </td>
                    <td nowrap>每亩实际用量
                    </td>
                    <td >
                        ${bean.qty }
                    </td>
                </tr>
                 <tr>
                    <td nowrap>安全天数
                    </td>
                    <td colspan="3">
                        ${bean.safeDays }       
                    </td>
                </tr>
            </tbody>
        </table>
        <div align=center><br>
		  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
    </div>
</body>
</html>

