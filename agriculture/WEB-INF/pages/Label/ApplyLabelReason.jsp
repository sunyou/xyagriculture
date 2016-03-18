<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>申请标签</title>
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
                rules: {
                    txt_Label_No: "required",
                    txt_Notes: "required",
                },
                messages: {
                    txt_Label_NO: "填写溯源码",
                    txt_Notes: "请填写说明信息",
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
        	    	if(data.success){
        	    		showTips("驳回成功！");
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
    <form method="post" action="${ctx}/ApplyLabel/ApplyLabelReason.ajax" id="form1">
		 <input type="hidden" name="type" value="2"/>
		 <input type="hidden" name="id" value="${bean.applyId}"/>
         <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
           
          
            <tr>
                <th width="80">审核人：</th>
                <td>
                	
                      <input name="audituser"  type="hidden"  id="txt_AuditUser"   value="${audituser}"/>
                    ${audituser }
                      	
                </td>
               
          
                <th width="80">拒绝原因：</th>
                <td>
                    <input name="rejectreason" type="text" id="rejectreason" class="inw" /></td>
               
            </tr>
           
        </table>
 		</div>
        <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	    </div>
    </form>
</body>
</html>
