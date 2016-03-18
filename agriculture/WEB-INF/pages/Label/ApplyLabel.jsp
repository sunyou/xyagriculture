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
                //debug: true,
                errorPlacement: function (error, element) {
                    //".AreaList"
                    var placement = $(element).parents("td").next();
                    placement.text('');
                    error.appendTo(placement);
                },
                rules: {
                    txt_Label_No: "required",
                    txt_Notes: "required",
                },
                messages: {
                    txt_Label_NO: "填写溯源码",
                    txt_Notes: "请填写说明信息",
                }
            });

        });
    </script>
    
   
</head>
<body>
    <form method="post" action="${ctx}/Label/ApplyLabelEdit.ajax?type=1" id="form1">

  <div class="edit_panel">
      <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <c:if test="${!empty message}">
				<script>showTips('${message }');</script>
			</c:if>
            <tr>
                <th width="80">申请人：</th>
                <td>
                
                	<c:choose>
                        	<c:when test="${not empty bean.applyUser }">
                        	 	<input name="operateuser"  type="hidden"   id="txt_Operator" value="${bean.applyUser}"/>
		                        ${bean.applyUser}
                        	</c:when>
                        	<c:otherwise>
                        		<input name="operateuser"  type="hidden"  id="txt_Operator"  value="${operator}"/>
		                        ${operator }
                        	</c:otherwise>
                        </c:choose>
                        
                </td>
           
                <th>申请数量：</th>
                <td>
                    <input name="amout" type="text" id="txt_Amount" class="inw" value="${bean.amount}"/></td>
            </tr>
           
        </table>
		</div>
		<div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	    </div>
        <input type="hidden" name="packageUid" id="hf_Object_UID" value="${packageUid}" />
        
    </form>
</body>
</html>
