<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>仓库新增/修改</title>
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
                    shName: "required",
                    amout: "required"
                },
                messages: {
                    shName: "填写仓库名,
                    amout: "填写仓库大小"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/StoreHouse/StoreHouseEdit.ajax?type=1" id="form1">

    	<input type="hidden" name="id" value="${bean.shId}"/>
		  <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
           
           
            <tr>
                <th width="80">仓库名称：</th>
                <td>
                    <input name="shName" type="text" id="txt_SH_Name" class="inw" value="${bean.shName}" /></td>
                
           		<th>仓库大小(㎡)：</th>
                <td>
                    <input name="amout" type="text" id="txt_Amout" class="inw"  value="${bean.amout}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))" /></td>
                
                
              
            </tr>
           
             <tr>
                <th>温度(℃)：</th>
                <td>
                    <input name="tem" type="text" id="txt_Tem" class="inw"  value="${bean.tem}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))" /></td>
                
           
                <th>湿度(%)：</th>
                <td>
                    <input name="hum" type="text" id="txt_Hum" class="inw" value="${bean.hum}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))" /></td>
                
            </tr>
             <tr>
                <th>压强(kPa)：</th>
                <td>
                    <input name="pres" type="text" id="txt_Pres" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  class="inw" value="${bean.pres}"/></td>
                
           
                <th>光照强度(Lux)：</th>
                <td>
                    <input name="beam" type="text" id="txt_Beam" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  class="inw" value="${bean.beam}"/></td>
                
            </tr>
           
            <tr>
                <th>仓库正常：</th>
                <td>
                   <input id="isactive" type="radio" name="isactive" value="${bean.isactive}" onclick="isCheck(this)"/><label for="rdi_IsActive">正常</label>
                </td>
                
          
                <th>说明：</th>
                <td>
                    <input name="remark" type="text" id="txt_Remark" class="inw"  value="${bean.remark}"/></td>
                
            </tr>
            <tr>
                <th>管理员：</th>
                <td>
                	<c:choose>
                        	<c:when test="${not empty bean.operater }">
                        	 	<input name="operater"  type="hidden"  id="txt_Operater"  value="${bean.operater}"/>
		                        ${bean.operater}
                        	</c:when>
                        	<c:otherwise>
                        		<input name="operater"  type="hidden"  id="txt_Operater"  value="${operator}"/>
		                       ${operator }
                        	</c:otherwise>
                        </c:choose>
                        
                <th>生产商：</th>
                <td>
                  <c:choose>
                    	<c:when test="${not empty bean.cofarmerName }">
                      		${bean.cofarmerName}
                    	</c:when>
                    	<c:otherwise>
                      		${cofarmerName }
                    	</c:otherwise>
                    </c:choose> 
				</td>
                
            </tr>
        </table>
        </div>
        <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	    </div>
        <input type="hidden" name="hf_CoFarmer_ID" id="hf_CoFarmer_ID" value="78db0529-12da-493b-a3af-7d532d5b0053" />
        <input type="hidden" name="hf_SH_ID" id="hf_SH_ID" />
    </form>
</body>

 <script type="text/javascript">
 	$(function(){
 		if($("#isactive").val()=='1'){
 		   $("#isactive").attr("checked","checked");
 		}else{
 			$("#isactive").attr("checked",false);
 		}
 	});
    
    function isCheck(obj){
    	if(obj.value=='1'){
    	 	$("#isactive").val("0");
    		$("#isactive").attr("checked",false);
    	   
 		}else{
 			$("#isactive").val("1");
 			$("#isactive").attr("checked","checked");
 			
 		}
    }
 </script>
</html>
