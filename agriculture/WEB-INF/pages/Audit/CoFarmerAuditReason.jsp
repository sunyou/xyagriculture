<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>生产商审核</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css" />
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
                errorPlacement: function (error, element) {
                    //".AreaList"
                    var placement = $(element).parents("td").next();
                    placement.text('');
                    error.appendTo(placement);
                },
                rules: {
                    rejectreason: "required"
                },
                messages: {
                    rejectreason: "请填写拒绝原因",
                },
        		submitHandler : function(form) {
        			var url = form.action;
        			var data = $("#form1").serialize();
        			doSubmit(url, data);
        		}
            });

        });
        
        function doSubmit(url,data){
        	$.ajax({
        	    url:  url,
        	    type: 'post',
        	    dataType: 'json',
        	    data: data,
        	    success: function(data){
        	    	//console.log(data);
        	    	if(data.success){
        	    		//alert("驳回成功！");
        	    		showTips(data.message,'${ctx}/Base/Material/materialNYSave.html');
        	    		//清理数据
        	    		
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
    <form method="post" action="${ctx}/CoFarmerAudit/AuditCoFarmer.ajax?type=2&applyId=${applyId}" id="form1">
    <input type="hidden" name="aduitUserId" value="${userid}">
        <table cellpadding="0" width="400" cellspacing="0" border="0" class="edit_table">
            <tr>
                <td colspan="2">
                    <font color="#0090D7">
                    <span id="lbl_Type">填写</span>驳回原因</font>
                </td>
                <td align="left" class="error_td">&nbsp;</td>
            </tr>
            <tr>
                <td>审核人</td>
                <td>
                    <input name="audituser" type="text" value="${userName}" id="txt_AuditUser" class="inw input_select" disabled="disabled"/>
                </td>
                <td align="left" class="error_td">&nbsp;</td>
            </tr>
            <tr>
                <td>拒绝原因</td>
                <td>
                    <input name="rejectreason" type="text" id="rejectreason" class="inw" /></td>
                <td align="left" class="error_td">&nbsp;</td>
            </tr>
            <tr>
                <td align="left">&nbsp;</td>
                <td>
                    <label id="butt" class="butt">
                        <input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn" /></label>
                </td>
                <td align="left" class="error_td">&nbsp;</td>
            </tr>
        </table>

    </form>
</body>
</html>
