<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农资经销商新增/修改</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
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
                    txt_Supplier_Name: "required",
                    txt_Legal_Represent: "required",
                    txt_Reg_Capital: { required: true, number: true },
                    txt_License_Number: "required",
                    txt_Record_Date: "required",
                    txt_Contact: "required",
                    txt_Tel: { required: true, isTel: true },
                    txt_Email: { required: true, email: true },
                    txt_Supplier_Address: "required"
                },

                messages: {
                    txt_Supplier_Name: "请填写经销商",
                    txt_Legal_Represent: "请填写法定代表人",
                    txt_Reg_Capital: { required: "请填写注册资金",number:"请填写正确的资金" },
                    txt_License_Number: "请填写工商登记证",
                    txt_Record_Date: "请选择注册日期",
                    txt_Contact: "请填写联系人",
                    txt_Tel: { required: "请填写电话" },
                    txt_Email: { required: "请填写邮箱" },
                    txt_Supplier_Address: "请填写注册地址"
                }
            });

        });
    </script>
</head>
<body>
<br>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/ProducerEdit.html');</script>
	</c:if>
    <form method="post" action="${ctx}/Base/Material/ProducerSave.html" id="form1">
       <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th width="20%"><div class="th_text">生产商:</div></th>
                <td width="30%">
                    <input name="txt_Supplier_Name" type="text" id="txt_Supplier_Name" class="inw" /></td>
                <th width="20%"><div class="th_text">地址:</div></th>
                <td width="30%">
                    <input name="txt_Supplier_Address" type="text" id="txt_Supplier_Address" class="inw" /></td>
            </tr>
        </table>
        <input type="hidden" name="hf_Supplier_ID" id="hf_Supplier_ID" />
        <div align=center>
			<br>
			<br> 
			<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp; 
			<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
		</div>
    </form>
</body>
</html>

