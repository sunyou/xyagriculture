<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>生产者申请驳回</title>
    <%@ include file="/common/include.jsp"%>
    
    <script type="text/javascript">
    $(document).ready(function () {
        $("#saveForm").validate({
			 onfocusout : false,
			 showErrors : function(errorMap, errorList) {
			   	var msg = "";  
			 	$.each(errorList, function(i, v) { 
			  		msg += (v.message + "\r\n");   
			  	});
			  	if (msg != "")  alert(msg);   
			}, 
            errorPlacement: function (error, element) {
            },
            rules: {
            	rejectReason: "required"
            },
            messages: {
            	rejectReason: "请填写驳回原因"
            },
            submitHandler : function() {
				ajaxSubmitForm($('#saveForm'), ajaxSubmitFormDefCallback);
			}
        });
    })
    </script>
</head>
<body>
    <form method="post" action="auditSupplierUnpass.ajax" id="saveForm">
    	<input type="hidden" name="id" value="${id}"/>
    <div align=center>
			<textarea name="rejectReason" style="width:95%;height:200px"></textarea>
    </div>
    
    <div align=center style="margin: 20px 0 10px 0">
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
    </form>
</body>
</html>
