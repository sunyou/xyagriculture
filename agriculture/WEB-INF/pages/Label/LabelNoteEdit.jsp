<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>标签管理新增/修改</title>
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
                    labelNo: "required",
                    notes: "required",
                },
                messages: {
                    labelNo: "填写溯源码",
                    notes: "请填写说明信息",
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
        	    		alert("保存成功！");
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
    <form method="post" action="${ctx}/LabelNote/LabelNoteEdit.ajax?Type=${type}" id="form1">
  	<div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
           
            <tr>
                <th width="80">溯源码：</th>
                <td>
                    <input name="labelNo" value="${bean.labelNo }" type="text" id="labelNo" class="inw input_select" onclick="openHelper('${ctx}/LabelNote/Label_Helper.html', { id: 'labelNo,labelId', key: 'LABEL_NO,PRINT_UID' }, '标签--选择帮助界面', 500, 400);" />
                </td>
                
            </tr>
            <tr>
                <th>说明：</th>
                <td>
                    <input name="notes" type="text" id="notes" class="inw" value="${bean.notes}"/>
                </td> 
                
            </tr>
            
        </table>
        </div>
         <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	    </div>
        <input type="hidden" name="cofarmerId" id="cofarmerId" value="${bean.cofarmerId}" />
        <input type="hidden" name="id" id="id" value="${bean.autoId}"/>
        <input type="hidden" name="labelId" id="labelId" value="${bean.labelId}"/>
    </form>
</body>
</html>
