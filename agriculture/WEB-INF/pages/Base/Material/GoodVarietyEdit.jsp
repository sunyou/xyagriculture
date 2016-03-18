<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种子苗新增/修改</title>
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
        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            aspnetForm.txt_Goods_ID.value = obj.name; //将对象的值赋给表单
            aspnetForm.Goods_ID.value = obj.no;
        }

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
                    txt_GoodVariant_Name: "required",
                    txt_Goods_ID: "required",
                    txt_EmergenceRate: { required: true, number: true ,min:0 ,max:100 },
                    txt_Origin: "required",
                    txt_SurvivalRate: { required: true, number: true, min: 0, max: 100 }
                },

                messages: {
                    txt_GoodVariant_Name: "请填写品种名称",
                    txt_Goods_ID: "请填写作物名称",
                    txt_EmergenceRate: { required: "请填写出苗率"},
                    txt_Origin: "请填写生产厂家",
                    txt_SurvivalRate: { required: "请填写成活率"}
                }
            });

            $(".spinner").ligerSpinner({ height: 28, type: 'int',min:1,max:100 });

        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/FertilizerSave.html');</script>
	</c:if>
    <form method="post" action="${ctx}/Base/Material/GoodVarietySave.html" id="form1">
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td><div class="th_text">作物名称:</div></td>
                <td>
                    <input name="txt_Goods_ID" type="text" value="${bean.goodsName}" readonly="readonly" id="txt_Goods_ID" class="inw input_select"/>
                	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Base/Material/GoodCategory.html', { id: 'txt_Goods_ID,hf_Goods_ID', key: 'GOODS_NAME,GOODS_ID' }, '农作物类别--选择帮助界面', 660, 360);"/>
                </td>
                 <td><div class="th_text">品种名称:</div></td>
                <td>
                    <input name="txt_GoodVariant_Name" type="text" id="txt_GoodVariant_Name" value="${bean.goodvariantName}" class="inw" /></td>
            </tr>
            <tr>
                <td><div class="th_text">生产厂家:</div></td>
                <td>
                    <input name="txt_Origin" type="text" id="txt_Origin" value="${bean.origin}" class="inw" /></td>
                     <td><div class="th_text">苗龄:</div></td>
                <td>
                    <input name="txt_seedingAge" type="text" id="txt_seedingAge" value="${bean.seedingage}" class="inw" /></td>
                
            </tr>
            <tr>
                <td><div class="th_text">出苗率%:</div></td>
                <td>
                    <input name="txt_EmergenceRate" type="text" id="txt_EmergenceRate" value="${bean.emergencerate}" class="inw spinner" style="width:80px;" /></td>
                <td><div class="th_text">成活率%:</div></td>
                <td>
                    <input name="txt_SurvivalRate" type="text" id="txt_SurvivalRate" value="${bean.survivalrate}" class="inw spinner" style="width:80px;" /></td>
            </tr>
            <tr>
                <td><div class="th_text">检疫证:</div></td>
                <td colspan="3">
                	<input name="pratique" type="text" id="pratique" value="${bean.pratique}" class="inw" />
                </td>
            </tr>
            <tr>
                <td><div class="th_text">说明备注:</div></td>
                <td colspan="3">
                	<textarea name="txt_Remark" rows="4" cols="90" id="txt_Remark">${bean.remark}</textarea>
                </td>
            </tr>
        </table>
        <div align=center><br><br>
			<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
		</div>
        <input type="hidden" name="hf_Goods_ID" id="hf_Goods_ID" value="${bean.goodsId}"/>
        <input type="hidden" name="Type" id="Type" value="${Type}" />
        <input type="hidden" name="hf_GoodVariety_ID" id="hf_GoodVariety_ID" value="${bean.goodvarietyId }" />
    </form>
</body>
</html>
