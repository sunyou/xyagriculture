<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>施肥操作新增/编辑</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/JSON2.JS"></script>
    <script type="text/javascript" src="${ctx}/content/js/Guid.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
</head>
<body>
	<c:if test="${!empty message}">
		<script>showTips('${message }');</script>
	</c:if>
    <form method="post" action="PlantFertilizeEdit.aspx?type=1&amp;id=5a0cd7c7-8fdf-4347-afee-8f795f0e7f63++++&amp;_=1444232063202" id="form1">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="4">
                    <b><font color="#0090D7">施肥操作</font></b>
                    <input type="hidden" id="hf_PLotOper_ID" />
                </td>
                
            </tr>
            <c:forEach items="${plantLots }" var="plantLot" varStatus="status">
               	<c:if test="${status.index == 0 }">
	                <tr>
	                    <td width="80">
	                        <div class="th_text">操作日期:</div>
	                    </td>
	                    <td>
	                        <input name="operateDate" type="text" id="txt_Operate_Date" value="${plantLot.operateDate }" class="Wdate inw" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" />
	                    </td>
	                    <td>
	                        <div class="th_text">生产者:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_CoFarmer_ID" value="${plantLot.cofarmerName }" class="inw" />
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <div class="th_text">农作物:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_Goods_ID" value="${plantLot.goodsName }" class="inw"  />
	                    </td>
	                    <td>
	                        <div class="th_text">种植批次:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_PlantLot_ID" value="${plantLot.plotNo }" class="inw" />
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <div class="th_text">操作人:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_Operators" name="operators" value="${plantLot.operators }" class="inw" />
	                    </td>
	                    <td nowrap>肥料名称</td>
	                    <td>
                  			<input type="text" class="inw" id="txt_Material_Name${status.index}" data-message="肥料名称" name="txt_Material_Name" value="${plantLot.materialName }" readonly="readonly" onclick="selectObject('${status.index}')">
                  		</td>
                  	</tr>
                  	<tr>
                  		<td nowrap>使用方式</td>
                  		<td>
                  			<input type="text" class="inw" data-message="使用方式" name="txt_UsageMode" value="${plantLot.usagemode }" id="txt_UsageMode${status.index}" >
                  		</td>
                  		<td nowrap>标准用量</td>
                  		<td>
                  			<input type="text" class="inw" data-message="标准用量" name="txt_AmountPer" value="${plantLot.amountper }" id="txt_AmountPer${status.index}" >
                  		</td>
                  	</tr>
                  	<tr>
                  		<td nowrap>实际使用量</td>
                  		<td>
                  			<input type="text" class="inw" data-message="实际使用量" name="txt_Qty" value="${plantLot.qty }" id="txt_Qty${status.index}" >
                  		</td>
                  		<td nowrap>安全间隔期</td>
                  		<td>
                  			<input type="text" class="inw" data-message="安全间隔期" name="txt_Safe_Days" value="${plantLot.safeDays }" id="txt_Safe_Days${status.index}" >
                  		</td>
	                </tr>
		            <tr>
		                <td>
		                    <div class="th_text">操作说明:</div>
		                </td>
	                    <td colspan="3">
	                        <input type="text" id="txt_Notes" value="${plantLot.notes }" name="notes" class="inw" />
	                        <input type="hidden" id="hf_PlantLot_ID" value="${plantLot.plantlotId }"/>
					        <input type='hidden' id="hf_CoFarmer_ID" value="${plantLot.cofarmerId }"/>
					        <input type='hidden' id="hf_Goods_ID" value="${plantLot.goodsId }"/>
	                    </td>
		            </tr>
	        	</c:if>
	        </c:forEach>
        </table>
    </form>
</body>
</html>
