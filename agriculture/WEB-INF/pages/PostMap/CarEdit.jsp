<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>车辆编辑</title>
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
                	carno:"required",
                	cartype:"required",
                	carcheck:"required",
                	carstate:"required",
                	maxcap:{ required: true, number: true, min: 0 },
                	gpsNo:"required"
                },

                messages: {
                	carno: { required: "请填写车辆编号"},
                	cartype: { required: "请填写车辆类型"},
                	carcheck: { required: "请填写年审时间"},
                	carstate: { required: "请填写车辆状态"},
                	maxcap: { required: "请填写最大载重量(KG)"},
                	gpsNo: { required: "GPS编号"}
                }
            });
            
            var chkObjs = document.getElementsByName("carstate");
            for(var i=0;i<chkObjs.length;i++){
            	 if(chkObjs[i].value=="${bean.carstate }"){  //比较值
            		 chkObjs[i].checked=true; //修改选中状态
                     break; //停止循环
                 }
            }

        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/ProducerEdit.html');</script>
	</c:if>
    <form method="post" action="${ctx}/PostMap/IgCarSave.html" id="form1">
       <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td><div class="th_text">车辆编号:</div></td>
                <td>
                	<input type="text" name="carno" value="${bean.carno }" class="inw" />    
                	<input type="hidden" name="carId" value="${bean.carid }" />    
				</td>
				<td><div class="th_text">车辆类型:</div></td>
                <td>
                <asia:select name="cartype" sort="ASC" sortMode="CODE" styleClass="inw" dictId="PostMap_CarType"  nullOption="true" nullText="请选择" defaultValue="${bean.cartype }" disabled="false"></asia:select>
                </td>
            </tr>
            <tr>
                <td><div class="th_text">年审时间:</div></td>
                <td>
					<input type="text" id="carcheck" name="carcheck" class="inw" value="<fmt:formatDate value="${bean.carcheck }"  pattern="yyyy-MM-dd"/>" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });" readonly /></dd>
				</td>
				<td><div class="th_text">车辆状态:</div></td>
                <td>
                    <input type="radio" name="carstate" value="1" id="radio1" /><label for="radio1">正常</label>
                    <input type="radio" name="carstate" value="0" id="radio2" /><label for="radio2">维修</label></td>
            </tr>
            <tr>
           		<td><div class="th_text">最大载重量(KG):</div></td>
                <td><input type="text" name="maxcap" value="${bean.maxcap }" class="inw" /></td>
                <td><div class="th_text">GPS编号:</div></td>
                <td>
                    <input type="text" name="gpsNo" value="${bean.gpsNo }" class="inw" /></td>
            </tr>
        </table>
         <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
    </form>
</body>
</html>

