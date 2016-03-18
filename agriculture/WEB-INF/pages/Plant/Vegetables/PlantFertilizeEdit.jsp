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
    <script type="text/javascript" src="${ctx}/content/js/Guid.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/Pages/Fertilize.js?v=2015081410080444"></script>
    <script type="text/javascript">
        $(document).ready(function () {

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
                	operateDate: "required",
                    txt_CoFarmer_ID: "required",
                    txt_Goods_ID: "required",
                    txt_PlantLot_ID: "required",
                    operators: "required",
                    materialName: "required",
                    safeDays: "required",
                    amountper: "required",
                    qty: "required"
                },

                messages: {
                	operateDate: "请选择操作日期",
                	operators: "请填写操作人",
                    txt_CoFarmer_ID: "请填写生产者",
                    txt_Goods_ID: "请选择农作物",
                    txt_PlantLot_ID: "请选择种植批次",
                    materialName: "请选择肥料名称",
                    safeDays: "请填写安全间隔期",
                    amountper: "请填写每亩标准用量",
                    qty: "请填写每亩使用量"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/PlantOper/Vegetables/v2/PlantFertilizeEdit.ajax" id="form1">
    <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <c:forEach items="${plantLots }" var="plantLot" varStatus="status">
               	<c:if test="${status.index == 0 }">
	                <tr>
	                    <td nowrap>
	                        <div class="">操作日期:</div>
	                    </td>
	                    <td>
	                        <%-- <c:choose>
		                		<c:when test="${not empty plantLot.operateDate }">
				                    <input name="operateDate" type="text" id="txt_Operate_Date" value="<fmt:formatDate value="${plantLot.operateDate }" pattern="yyyy-MM-dd"/>" class="Wdate inw" style="width: 228px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" />
		                		</c:when>
		                		<c:otherwise>
				                    <input name="operateDate" type="text" id="txt_Operate_Date" value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>" class="Wdate inw" style="width: 228px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" />
		                		</c:otherwise>
		                	</c:choose> --%>
		                    <input name="operateDate" type="text" id="txt_Operate_Date" value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>" class="Wdate inw" style="width: 228px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" />
	                    </td>
	                    <td nowrap>
	                        <div class="">生产者:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_CoFarmer_ID" disabled="disabled" value="${plantLot.cofarmerName }" class="inw" />
	                    </td>
	                </tr>
	                <tr>
	                    <td nowrap>
	                        <div class="">农作物:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_Goods_ID"  disabled="disabled" value="${plantLot.goodsName }" class="inw"  />
	                    </td>
	                    <td nowrap>
	                        <div class="">种植批次:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_PlantLot_ID" name="plotNo" disabled="disabled"  value="${plantLot.plotNo }" class="inw" />
	                    </td>
	                </tr>
	                <tr>
	                    <td nowrap>
	                        <div class="">操作人:</div>
	                    </td>
	                    <td>
	                        <input type="text" id="txt_Operators" name="operators" value="" class="inw" />
	                        <%-- <input type="text" id="txt_Operators" name="operators" value="${plantLot.operators }" class="inw" /> --%>
	                    </td>
	                    <td nowrap>
	                    	肥料名称
	                    </td>
                		<td>
                			<input type="text" class="inw" id="txt_Material_Name${status.index}" data-message="肥料名称" name="materialName" value="" readonly="readonly" >
                			<input type=button class='rowSelectButton' onclick="selectObject('${status.index}')" value='选择' />
                			<br>没有找到？点击<a href="javascript:void(0);" onclick="ligerWin(660, 360, '${ctx}/CoFarmerMaterial/Base/Info/CoFarmerMaterialEdit.html','新增企业投入品');">这里</a>添加一个
                			<input type="hidden" data-message="肥料名称" name="materialId" value="" id="txt_Material_ID${status.index}">
                			<input type="hidden" id="txt_CM_ID${status.index}" name="cmId" value="">
                		</td>
                	</tr>
                	<tr>
                		<td nowrap>
	                    	使用方式
	                    </td>
                		<td>
                		<!-- TODO -->
                			<input type="text" class="inw" data-message="使用方式" name="usagemode" value="" id="txt_UsageMode${status.index}" >
                		</td>
                		<td nowrap>
	                    	标准用量
	                    </td>
                		<td>
                			<input type="text" class="inw" data-message="标准用量" name="amountper" value="" id="txt_AmountPer${status.index}" >
                		</td>
                	</tr>
                	<tr>
                		<td nowrap>
	                    	实际使用量
	                    </td>
                		<td>
                			<input type="text" class="inw" data-message="实际使用量" name="qty" value="" id="txt_Qty${status.index}" >
                		</td>
                		<td nowrap>
	                    	安全间隔期
	                    </td>
                		<td>
                			<input type="text" class="inw" data-message="安全间隔期" name="safeDays" value="" id="txt_Safe_Days${status.index}" >
                		</td>
                	</tr>
                	<tr>
                		<td nowrap>
	                    	说明
	                    </td>
	                    <td colspan="3">
	                        <input type="text" id="txt_Notes" value="${plantLot.notes }" name="notes" class="inw" />
<%-- 	                        <input type="text" id="txt_Notes" value="${plantLot.notes }" name="notes" class="inw" /> --%>
	                        <input type="hidden" id="hf_PlantLot_ID" name="plantlotId" value="${plantLot.plantlotId }"/>
					        <input type='hidden' id="hf_CoFarmer_ID" name="cofarmerId" value="${plantLot.cofarmerId }"/>
					        <input type='hidden' id="hf_Goods_ID" name="goodsId" value="${plantLot.goodsId }"/>
	                    </td>
	                 </tr>
		        	</c:if>
		        </c:forEach>
            <tr>
                <td colspan="4" style="text-align:center;">
                    <label id="butt" class="butt">
                        <input type="submit" value="保存" class="xybtn" />
                    </label>
                </td>
            </tr>
        </table>
       </div>
    </form>
    <script type="text/javascript">
    function selectObject(id) {
        openHelper('${ctx}/CoFarmerMaterial/Helper/CoFarmerMaterial_Helper.html?type=1', { id: "txt_Material_Name" + id + ",txt_Material_ID" + id + ",txt_CM_ID" + id, key: 'OBJECT_NAME,OBJECT_ID,COMAT_UID' }, '企业农资库--选择帮助界面', 660, 360);
    }
    </script>
</body>
</html>

