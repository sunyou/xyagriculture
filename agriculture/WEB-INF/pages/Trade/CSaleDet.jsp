<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>销售出库信息</title>
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
    <script type="text/javascript">
        function clickLabel(uid) {
            ligerWin(600,300,'${ctx}/PlantOper/Vegetables/PlantHarvestDet.html?type=2&id=' + uid,'采收查看',null)
        }
        function clickLabel2(uid) {
            ligerWin(600, 300, '${ctx}/Package/toPackageEdit.html?type=3&id=' + uid, '包装查看', null)
        }
        var id = GetQueryString("id");
        $(document).ready(function () {
            bindDetail();
        });
        function bindDetail(){
            $.ajax({
                url: "${ctx}/CSale/getCSaleDetails.ajax?id=" + id,
                dataType: "json",
                type: "GET",
                complete: function (state) {
                    var ob = eval("(" + state.responseText + ")");
                    if (ob.success) {
                        var bdata = ob.detailBeans;
                        for (var i = 0; i < bdata.length;i++){
                            var obj = bdata[i];
                            var trHTML = "<tr>";
                            trHTML += "<td>"
                            trHTML += obj.stype == '1' ? "散装" : "包装";
                            trHTML+="</td>";
                            trHTML += "<td>"
                            if (obj.stype == '1') {
                                trHTML += '<a title="点击查看" onclick="clickLabel(\'' + obj.Object_ID + '\');" href="javascript:;"><font color="#FF5500">' + obj.Object_No + '</font></a>';
                            } else {
                                trHTML += '<a title="点击查看" onclick="clickLabel2(\'' + obj.Object_ID + '\');" href="javascript:;"><font color="#FF5500">' + obj.Object_No + '</font></a>';
                            }                            
                            trHTML+= "</td>";
                            trHTML += "<td>" + obj.Price+ "</td>";
                            trHTML += "<td>" + obj.Qty + "</td>";
                            trHTML += "<td>" + obj.UnitName + "</td>";
                            trHTML += "<td>" + obj.Amount + "</td>";
                            trHTML += "<td>" + obj.Notes + "</td>";
                            trHTML += "</tr>";
                            $("#tb_Detail").append(trHTML);
                        }
                    }
                }
            });
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 15%;
        }
        .auto-style2 {
            width: 40%;
        }
        .auto-style3 {
            width: 15%;
        }
    </style>
</head>
<body>
    	<table class="data_grid" cellpadding="0" cellspacing="0" border="0"  width="98%">
  			<tr>
                <th width="80">单号：</th>
                <td colspan="3"><label id="lbl_BillNo"/>${bean.billNo}</td>
               
            </tr>
            <tr>
                <th width="80">购货人：</th>
                <td >${bean.resellerName }</td>
                <th >开票日期：</th>
                <td><fmt:formatDate value="${bean.opDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td colspan="4">
                    <br/>
                    <table id="tb_Detail" class="data_grid" width="100%">
                        <tr>
                            <th>产品类型</th>
                            <th>产品</th>
                            <th>单价(元)</th>
                            <th>数量</th>
                            <th>单位</th>                            
                            <th>合计(元)</th>
                            <th>备注</th>
                        </tr>                        
                    </table>
                    <br/>
                </th>
            </tr>
            <tr>
                <th>价格合计(大写)：</th>
                <td><label id="lbl_AmountShow"></label></td>
                <th>价格合计(小写)：</th>
                <td><label id="lbl_Amount">${bean.amount }</label></td>
            </tr>
            <tr>
                <th>开票单位：</th>
                <td><label id="lbl_CoFarmer">${bean.cofarmerName }</label></td>
                <th>开票人：</th>
                <td><label id="lbl_Operater">${bean.operators }</label></td>
            </tr>
        </table>
        	<div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
 
</body>
<script type="text/javascript">

$(function(){
	$("#lbl_AmountShow").html(numToCny($("#lbl_Amount").text()));

});
function numToCny(num) {
    var strOutput = "";
    var strUnit = '仟佰拾亿仟佰拾万仟佰拾元角分';
    num += "00";
    var intPos = num.indexOf('.');
    if (intPos >= 0)
        num = num.substring(0, intPos) + num.substr(intPos + 1, 2);
    strUnit = strUnit.substr(strUnit.length - num.length);
    for (var i = 0; i < num.length; i++)
        strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(num.substr(i, 1), 1) + strUnit.substr(i, 1);
    return strOutput.replace(/零角零分$/, '整').replace(/零[仟佰拾]/g, '零').replace(/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/, '元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元");
}
</script>
</html>
