<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>果蔬预警新增/修改</title>
    <%@ include file="/common/include.jsp"%>
    <style type="text/css">
	select{width:154px}
	input[type="text"]{width:180px}
    </style>
<script type="text/javascript">
	$(document).ready(function () {

            $("#saveForm").validate({
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
                    txt_Op_Date: "required",
                    txt_PlantLot_ID: "required",
                    txt_Harvest_UID: "required",
                    txt_Package_UID: "required",
                    operators: "required"
                },

                messages: {
                    txt_Op_Date: "请选择检测日期",
                    txt_PlantLot_ID: "请选择种植批次",
                    txt_Harvest_UID: "请选择采收",
                    txt_Package_UID: "请选择包装",
                    operators: "请填操作人"
                },
                submitHandler : function() {
					ajaxSubmitForm($('#saveForm'), ajaxSubmitFormDefCallback);
				}
            });
        });
        
</script>
</head>
<body>
<form method="post" action="${ctx}/Warning/saveSAlert.ajax" id="saveForm">
	<div class="edit_panel">
		<table class="edit_table" width="98%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th width=80>预警日期</th>
                <td>
                    <input value="<fmt:formatDate value="${bean.opDate}" pattern="yyyy-MM-dd" />" name="opDate" type="text" id="txt_Op_Date" class="Wdate" 
                    		onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" style="width:200px"/></td>
				<th>操作人</th>
                <td>
                    <input value="${bean.operators}" name="operators" type="text" class="inw" id="txt_Operators"/></td>
            </tr>
            <tr>
                <th>种植批次</th>
                <td>
                    <input  value="${bean.lotNo}" name="txt_PlantLot_ID" type="text" class="inw" id="txt_PlantLot_ID" readonly="readonly"/>
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlantLot_Helper.html', { id: 'txt_PlantLot_ID,hf_PlantLot_ID', key: 'LOT_NO,PLANTLOT_ID' }, '种植批次--选择帮助界面', 500, 400);"/>
                </td>
                <th>采收</th>
                <td>
                    <input  value="${bean.plotharvestNo}" name="txt_Harvest_UID" type="text" class="inw" id="txt_Harvest_UID" readonly="readonly"/>
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html', { id: 'txt_Harvest_UID,hf_Harvest_UID', key: 'PLOTHARVEST_NO,PLOTOPER_ID' }, '采收--选择帮助界面', 500, 400);"/>
                </td>
            </tr>
             <tr>
                
                <th>包装</th>
                <td>
                    <input  value="${bean.packageNo}" name="txt_Package_UID" type="text" class="inw" id="txt_Package_UID" readonly="readonly"/>
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/Package_Helper.html', { id: 'txt_Package_UID,hf_Package_UID', key: 'PACKAGE_NO,PACKAGE_UID' }, '包装--选择帮助界面', 500, 400);"/>
                </td>
                 <th>备注说明</th>
                <td >
                    <input value="${bean.notes}" name="notes" type="text" class="inw" id="txt_Notes"/></td>
                
            </tr>
        </table>
    </div>
         <div align=center style="margin: 20 0 10 0">
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
        <input type="hidden" name="alertId" id="hf_Alert_ID" value="${bean.alertId}"/>
        <input type="hidden" name="plotharvestId" id="hf_Harvest_UID" value="${bean.plotharvestId}"/>
        <input type="hidden" name="plantlotId" id="hf_PlantLot_ID" value="${bean.plantlotId}"/>
        <input type="hidden" name="packageUid" id="hf_Package_UID" value="${bean.packageUid}"/>
    </form>
</body>
</html>