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
                    operators: "required",
                    txt_CoFarmer_ID: "required",
                    txt_Goods_ID: "required",
                    txt_PlantLot_ID: "required",
                    materialName: "required",
                    producer: "required",
                    safeDays: "required",
                    amountper: "required",
                    qty: "required"
                },

                messages: {
                    txt_Operate_Date: "请选择操作日期",
                    txt_Operators: "请填写操作人",
                    txt_CoFarmer_ID: "请填写生产者",
                    txt_Goods_ID: "请选择农作物",
                    txt_PlantLot_ID: "请选择种植批次",
                    materialName: "请选择肥料名称",
                    producer: "请选择生产商",
                    safeDays: "请填写安全间隔期",
                    amountper: "请填写每亩标准用量",
                    qty: "请填写每亩使用量"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx }/PlantOper/Vegetables/PlantFertilizeEdit.ajax" id="form1">
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <input type="hidden" name="plotoperId" id="hf_PLotOper_ID" value="${plantLot.plotoperId }" />
                </td>
				
            </tr>
            <tr>
                <td><div class="th_text">操作日期:</div></td>
                <td>
                    <input name="operateDate" type="text" id="txt_Operate_Date" value="${plantLot.operateDate }" class="Wdate inw" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" value="2013/1/10 0:00:00" />
                </td>
                
            </tr>
           
            <tr>
                <td><div class="th_text">生产者:</div></td>
                <td>
                    <input name="txt_CoFarmer_ID" type="text" value="${plantLot.cofarmerName }" id="txt_CoFarmer_ID" class="inw" />
                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">农作物:</div></td>
                <td>
                    <input name="txt_Goods_ID" type="text" value="${plantLot.goodsName }" id="txt_Goods_ID" class="inw" />
                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">种植批次:</div></td>
                <td>
                    <input name="txt_PlantLot_ID" type="text" value="${plantLot.lotNo }" id="txt_PlantLot_ID" class="inw"  />
                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">肥料名称:</div></td>
                <td>
                    <input name="materialName" type="text" id="txt_Material_Name" value="${plantLot.materialName }" class="inw" onclick="openHelper('${ctx}/CoFarmerMaterial/Helper/CoFarmerMaterial_Helper.html?TypeCode=1', { id: 'txt_Material_Name,hf_Material_ID,hf_CMID,txt_Producer_Name', key: 'OBJECT_NAME,OBJECT_ID,COMAT_UID,PRODUCE_NAME' }, '企业农资库--选择帮助界面', 500, 400);" />                    
                    <br/>没有找到？点击<a href="javascript:void(0);" onclick="ligerWin(500, 600, '${ctx}/CoFarmerMaterial/Base/Info/CoFarmerMaterialEdit.html?Type=1', '新增企业投入品');
">这里</a>添加一个
                </td>
                

            </tr>
            <tr>
                <td><div class="th_text">生产商:</div></td>
                <td>
                    <input name="producer" type="text" value="${plantLot.producer }" readonly="readonly" id="txt_Producer_Name" class="inw" />                    
                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">安全间隔期:</div></td>
                <td>
                    <input name="safeDays" type="text" value="${plantLot.safeDays }" id="txt_Safe_Days" class="inw" />天</td>
                
            </tr>
            <tr>
                <td><div class="th_text">每亩标准用量:</div></td>
                <td>
                    <input name="amountper" type="text" value="${plantLot.amountper }" id="txt_AmountPer" class="inw" />Kg</td>
                
            </tr>
            <tr>
                <td><div class="th_text">每亩使用量:</div></td>
                <td>
                    <input name="qty" type="text" value="${plantLot.qty }" id="txt_Qty" class="inw" />
                    Kg</td>
                
            </tr>
             <tr>
                <td><div class="th_text">操作人:</div></td>
                <td>
                    <input name="operators" type="text" value="${plantLot.operators }" id="txt_Operators" class="inw" /></td>
                
            </tr>
            <tr>

                <td><div class="th_text">操作说明:</div></td>
                <td>
                    <input name="notes" type="text" value="${plantLot.notes }" id="txt_Notes" class="inw" /></td>
                
            </tr>
			<tr>
				<td>&nbsp;</td>
                <td>
					<label id="butt" class="butt">
						<input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn" /></label>
                </td>
				
			</tr>
        </table>
		</div>
        <input type="hidden" name="cofarmerId" id="hf_CoFarmer_ID" value="${plantLot.cofarmerId }" />
        <input type="hidden" name="goodsId" id="hf_Goods_ID" value="${plantLot.goodsId }" />
        <input type="hidden" name="plantlotId" id="hf_PlantLot_ID" value="${plantLot.plantlotId }" />
        <input type="hidden" name="materialId" id="hf_Material_ID" value="${plantLot.materialId }" />
        <input type="hidden" name="cmId" id="hf_CMID" value="${plantLot.cmId }" />
    </form>
</body>
</html>
