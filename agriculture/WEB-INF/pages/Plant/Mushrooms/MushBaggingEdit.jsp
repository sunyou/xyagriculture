﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>清茬编辑/新增</title>
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
                    txt_Goods: "required",
                    txt_PlantLot: "required",
                    amount: "required",
                    spec: "required",
                    operators: "required"
                },

                messages: {
                	operateDate: "请选择操作日期",
                    txt_Goods: "请选择作物",
                    txt_PlantLot: "请选择种植批次",
                    amount: "请填写数量",
                    spec: "请填写规格",
                    operators: "请填写操作人"
                }
            });

        });
    </script>

</head>
<body>
    <form method="post" action="${ctx }/PlantOper/Mushrooms/MushBaggingEdit.ajax" id="form1">
    <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="80">
                    <div class="th_text">操作日期:</div>
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
                <td width="60">
                    <div class="th_text">生产者:</div>
                </td>
                <td>
                    <input name="txt_CoFarmerName" type="text" value="${plantLot.cofarmerName }" id="txt_CoFarmerName" disabled="disabled" class="aspNetDisabled" class="inw" />
                </td>
               
            </tr>
            <tr>
                <td>
                    <div class="th_text">作物:</div>
                </td>
                <td>
                    <input name="txt_Goods" type="text" value="${plantLot.goodsName }" disabled="disabled" id="txt_Goods" class="inw"/>
                </td>
                <td>
                    <div class="th_text">种植批次:</div>
                </td>
                <td>
                    <input name="txt_PlantLot" type="text" value="${plantLot.plotNo }" disabled="disabled" id="txt_PlantLot" class="inw"  />
                </td>
               
            </tr>
            <tr>
                <td>
                    <div class="th_text">数量:</div>
                </td>
                <td>
                    <input name="amount" type="text" value="" id="txt_Amount" class="inw" />KG
<%--                     <input name="amount" type="text" value="${plantLot.amount }" id="txt_Amount" class="inw" />KG --%>
                </td>
                <td>
                    <div class="th_text">规格:</div>
                </td>
                <td>
                    <input name="spec" type="text" value="" id="txt_SPEC" title="指介绍产品的 成份、性能、品牌、产地、型号等 产品的基础数据" class="inw" />
<%--                     <input name="spec" type="text" value="${plantLot.spec }" id="txt_SPEC" title="指介绍产品的 成份、性能、品牌、产地、型号等 产品的基础数据" class="inw" /> --%>
                </td>

            </tr>
            <tr>
                <td>
                    <div class="th_text">操作人:</div>
                </td>
                <td>
                    <input name="operators" type="text" value="" id="txt_Operators" class="inw" />
<%--                     <input name="operators" type="text" value="${plantLot.operators }" id="txt_Operators" class="inw" /> --%>
                </td>
                <td>
                    <div class="th_text">备注:</div>
                </td>
                <td>
                    <input name="notes" value="" type="text" id="txt_Notes" class="inw" />
<%--                     <input name="notes" value="${plantLot.notes }" type="text" id="txt_Notes" class="inw" /> --%>
                </td>

            </tr>

            <tr>
					<td colspan="4" style="text-align:center;">
						<label id="butt" class="butt">
							<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" /></label>
					</td>

				</tr>

        </table>
        <input type="hidden" name="plotoperId" id="plotoperId" value=""/>
        <input type="hidden" name="plantlotId" id="plantlotId" value="${plantLot.plantlotId }" />
        <input type="hidden" name="goodsId" id="goodsId" value="${plantLot.goodsId }" />
        <input type="hidden" name="cofarmerId" id="cofarmerId" value="${plantLot.cofarmerId }" />
      </div>
    </form>
</body>
</html>

