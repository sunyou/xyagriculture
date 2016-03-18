<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>除草新增/修改</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
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
                    operators: "required"
                },

                messages: {
                	operateDate: "请选择操作日期",
                    txt_CoFarmer_ID: "请输入生产者",
                    txt_Goods_ID: "请选择作物",
                    txt_PlantLot_ID: "请选择种植批次",
                    operators: "请输入操作人"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx }/PlantOper/Vegetables/PlantWeedingEdit.ajax" id="form1">
        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td  width="60"><div class="th_text">操作日期:</div></td>
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
                
                <td><div class="th_text">生产者:</div></td>
                <td>
                    <input name="txt_CoFarmer_ID" disabled="disabled" type="text" value="${plantLot.cofarmerName }" id="txt_CoFarmer_ID" class="inw" />
                    

                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">农作物:</div></td>
                <td>
                    <input name="txt_Goods_ID" disabled="disabled" type="text" value="${plantLot.goodsName }" id="txt_Goods_ID" class="inw" />
                </td>
                

                <td><div class="th_text">种植批次:</div></td>
                <td>
                    <input name="txt_PlantLot_ID" disabled="disabled" type="text" value="${plantLot.lotNo }" id="txt_PlantLot_ID" class="inw" />
                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">操作人:</div></td>
                <td>
                    <input name="operators" type="text" value="" class="inw" /></td>
<%--                     <input name="operators" type="text" value="${plantLot.operators }" class="inw" /></td> --%>
                

                <td><div class="th_text">操作说明:</div></td>
                <td>
                    <input name="notes" type="text" value="" class="inw" /></td>
<%--                     <input name="notes" type="text" value="${plantLot.notes }" class="inw" /></td> --%>
                
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;">
					<label id="butt" class="butt">
						<input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn" /></label>
                </td>
				
			</tr>
        </table>
		</div>
        <input type="hidden" name="plotoperId" id="plotoperId" value=""/>
        <input type="hidden" name="plantlotId" id="plantlotId" value="${plantLot.plantlotId }" />
        <input type="hidden" name="goodsId" id="goodsId" value="${plantLot.goodsId }" />
        <input type="hidden" name="cofarmerId" id="cofarmerId" value="${plantLot.cofarmerId }" />
    </form>
</body>
</html>
