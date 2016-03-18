<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植批次编辑/新增</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#areas").ligerSpinner({ height: 28, type: 'float',minValue: 0.00, maxValue: $("#areas").val() });
          
            $("#form1").validate({
                //debug: true,
				 onfocusout : false,
				 showErrors : function(errorMap, errorList) {
				   var msg = "";  
				 $.each(errorList, function(i, v) { 
				  msg += (v.message + "\r\n");   });
				  if (msg != "")  alert(msg);   
				}, 
                errorPlacement: function (error, element) {
                    //".AreaList"
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                	farmerName: "required",
                	userName: "required",
                	plantDate: "required",
                	goodsName: "required",
                	goodvarietyName: "required",
                	plotName: "required",
                    areas: "required"
                },
                messages: {
                	farmerName: "请选择农户",
                	userName: "请选择技术员",
                	plantDate: "请选择种植日期",
                	goodsName: "请选择作物",
                	goodvarietyName: "请选择种苗名称",
                	plotName: "请选择种植区域",
                    areas: "请填写种植面积"
                }
            });
        });
        function GoodVarietyHelper() {
            var Goods = $("#goodsId").val();
            openHelper('${ctx}/GoodVariety/Helper/GoodVariety_Helper.html?Goods=' + Goods, {
                id: 'txt_GoodVariety_Name,goodvarietyId', key: 'GOODVARIANT_NAME,GOODVARIETY_ID'
            }, '种子苗--选择帮助界面', 660, 360);
        }
        
        function doSubmit(url,data){
        
        	$.ajax({
        	    url:  url,
        	    type: 'post',
        	    dataType: 'json',
        	    data: data,
        	    success: function(data){
        	    	//console.log(data);
        	    	if(data.success){
        	    		alert("保存成功！");
        	    		//TODO 清理数据或跳转
        	    		
        	    	}else if(data.message){
        	    		alert(data.message);
        	    	}
        	    },
        	    error:function(result){
        	    	
        	  	}
        	 });
        }
    </script>
</head>
<body>
    <form method="post" action="${ctx }/Plant/addOrUpdatePlantLot.ajax" id="form1">
        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td nowrap><div class="th_text">生产者:</div></td>
                <td>
                	<c:choose>
                		<c:when test="${not empty plantLot.cofarmerId }">
		                    ${plantLot.cofarmerName }
		                    <input type="hidden" name="cofarmerId" id="cofarmerId" value="${plantLot.cofarmerId }" />
                		</c:when>
                		<c:when test="${not empty plot }">
		                    ${plot.cofarmerName }
		                    <input type="hidden" name="cofarmerId" id="cofarmerId" value="${plot.cofarmerId }" />
                		</c:when>
                		<c:otherwise>
		                    ${cofarmerName }
		                    <input type="hidden" name="cofarmerId" id="cofarmerId" value="${cofarmerId }" />
                		</c:otherwise>
                	</c:choose>
                </td>
                <td nowrap><div class="th_text">农户:</div></td>
                <td>
                    <input name="farmerName" type="text" id="txt_FarmerName" value="${plantLot.farmerName }"  readonly="readonly" class="inw"  />
                	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Farmer/Helper/Farmer_Helper.html', { id: 'txt_FarmerName,farmerId,cofarmerId', key: 'FARMER_NAME,FARMER_ID,COFARMER_ID' }, '农户--选择帮助界面', 660, 360);"/>
                </td>
            </tr>
            <tr>
                <td nowrap><div class="th_text">作物:</div></td>
                <td>
                    <input name="goodsName" type="text" id="txt_Goods" value="${plantLot.goodsName }" readonly="readonly" class="inw"  />
                	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_Goods,goodsId,goodType', key: 'GOODS_NAME,GOODS_ID,GOOD_TYPE' }, '农作物--选择帮助界面', 660, 360);"/>
                </td>
                <td nowrap><div class="th_text">种植日期:</div></td>
                <td>
                	<c:choose>
	               		<c:when test="${not empty plantLot.plantDate }">
		                    <input name="plantDate" type="text" id="txt_Operate_Date" value="<fmt:formatDate value="${plantLot.plantDate }" pattern="yyyy-MM-dd"/>" class="Wdate inw" style="width: 160px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" />
	               		</c:when>
	               		<c:otherwise>
		                    <input name="plantDate" type="text" id="txt_Operate_Date" value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>" class="Wdate inw" style="width: 160px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" />
	               		</c:otherwise>
	               	</c:choose>
                </td>
            </tr>
            <tr>
                <td nowrap><div class="th_text">技术员:</div></td>
                <td>
                    <input name="userName" type="text" id="txt_Technics" value="${plantLot.userName }" readonly="readonly" class="inw"  />
                	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Users/Helper/JSY_Helper.html', { id: 'txt_Technics,technicsId', key: 'USER_NAME,USER_UID' }, '技术员--选择帮助界面', 660, 360);"/>
                </td>
                <td nowrap><div class="th_text">种苗名称:</div></td>
                <td>
                    <input name="goodvarietyName" type="text" id="txt_GoodVariety_Name" value="${plantLot.goodvarietyName }" readonly="readonly" class="inw"  />
                   <input type=button class='rowSelectButton' value='选择' onclick="GoodVarietyHelper()"/>
                    <br>没有找到？点击<a href="javascript:void(0);" onclick="ligerWin(660, 360, '${ctx}/Base/Material/GoodVarietyEdit.html', '新增种苗');
">这里</a>添加一个
                </td>  
            </tr>
            <tr>
                <td nowrap><div class="th_text">种植方式:</div></td>
                <td>
                    <select name="plantyield" id="Drop_PlantYield" class="inw">
						<option value="1">种子播种</option>
						<option value="2">种苗移栽</option>
						<option value="3">扦插</option>
					</select>
                </td>
                <td nowrap><div class="th_text">种植区域:</div></td>
                <td>
                	<c:choose>
                		<c:when test="${not empty plantLot.plotName }">
		                    <input name="plotName" type="text" value="${plantLot.plotName }" id="txt_Plot_Name" readonly="readonly" class="inw" />
					        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PLot_Helper.html', { id: 'txt_Plot_Name,plotId,plotNo,lotNo', key: 'PLOT_NAME,PLOT_ID,PLOT_NO,AREA_ID' }, '种植区域--选择帮助界面', 950, 440);"  />
					        <input type="hidden" name="plotNo" id="plotNo" value="${plantLot.plotNo }" />
		                    <input type="hidden" name="plotId" id="plotId" value="${plantLot.plotId }" />
					        <input type="hidden" name="lotNo" id="lotNo" value="${plantLot.lotNo }" />
                		</c:when>
                		<c:when test="${not empty plot.plotName }">
		                    <input name="plotName" type="text" value="${plot.plotName }" id="txt_Plot_Name" readonly="readonly" class="inw"  />
					        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PLot_Helper.html', { id: 'txt_Plot_Name,plotId,plotNo,lotNo', key: 'PLOT_NAME,PLOT_ID,PLOT_NO,AREA_ID' }, '种植区域--选择帮助界面', 950, 440);"/>
					        <input type="hidden" name="plotNo" id="plotNo" value="${plot.plotNo }" />
		                    <input type="hidden" name="plotId" id="plotId" value="${plot.plotId }" />
					        <input type="hidden" name="lotNo" id="lotNo" value="" />
                		</c:when>
                		<c:otherwise>
		                    <input name="plotName" type="text" value="" id="txt_Plot_Name" readonly="readonly" class="inw" />
					        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PLot_Helper.html', { id: 'txt_Plot_Name,plotId,plotNo,lotNo', key: 'PLOT_NAME,PLOT_ID,PLOT_NO,AREA_ID' }, '种植区域--选择帮助界面', 950, 440);" />
					        <input type="hidden" name="plotNo" id="plotNo" value="" />
		                    <input type="hidden" name="plotId" id="plotId" value="" />
					        <input type="hidden" name="lotNo" id="lotNo" value="" />
                		</c:otherwise>
                	</c:choose>
                </td>
            </tr>
            <tr>
                <td nowrap><div class="th_text">种植面积(亩):</div></td>
                <td>
                    <input name="areas" type="text" value="${plantLot.areas }" id="txt_Areas" class="inw" />
                </td>
                <td nowrap><div class="th_text">生产标准:</div></td>
                <td>
                    <select name="criteriaLevel" id="Drop_Criteria_Level" class="inw">
						<option value="1">绿色</option>
						<option value="2">有机</option>
						<option value="3">无公害</option>
					</select>
                </td>
            </tr>
            <tr>
                
                <td nowrap><div class="th_text">茬口:</div></td>
                <td>
                    <select name="stubbles" id="Drop_Stubbles" class="inw">
						<option value="1">春茬</option>
						<option value="2">秋沿</option>
						<option value="3">越冬</option>
					</select>
                </td>
                <td nowrap><div class="th_text">备注:</div></td>
                <td>
                    <input name="notes" type="text" id="txt_Notes" class="inw" value="${plantLot.notes }"  />
                </td>
            </tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<label id="butt" class="butt">
							<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" /></label>
					</td>
				</tr>
        </table>
		</div>
        <input type="hidden" name="farmerId" id="farmerId" value="${plantLot.farmerId }" />
        <input type="hidden" name="goodsId" id="goodsId" value="${plantLot.goodsId }" />
        <input type="hidden" name="goodType" id="goodType" value="${plantLot.goodType }" />
        <input type="hidden" name="technicsId" id="technicsId" value="${plantLot.technicsId }" />
        <input type="hidden" name="goodvarietyId" id="goodvarietyId" value="${plantLot.goodvarietyId }" />
        <input type="hidden" name="plantlotId" id="plantlotId" value="${plantLot.plantlotId }" />

    </form>
</body>
</html>
