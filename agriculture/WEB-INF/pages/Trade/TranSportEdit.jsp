<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农产品运输新增/修改</title>
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
                    car: "required",
                    txt_SH_Name: "required"
                },
                messages: {
                    car: "填写车牌号",
                    txt_SH_Name: "请选择仓库"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/TranSport/TranSportEdit.ajax?type=1" id="form1">

		  <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
           
            <tr>
            	<th>运输单号：</th>
                <td>
                    
	                    <c:if test="${type=='1'}">自动生成</c:if>
	                    <c:if test="${type!='1'}">${bean.tsNo }</c:if>
                   
                </td>
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
           
            <tr>
                <th width="80">开始日期：</th>
                <td>
                    <input name="startdate" type="text" id="txt_StartDate" class="inw" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" value="<fmt:formatDate value="${bean.startdate}" pattern="yyyy-MM-dd"/>" /></td>
           		<th>结束日期：</th>
                <td>
                    <input name="enddate" type="text" id="txt_EndDate" class="inw" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" value="<fmt:formatDate value="${bean.enddate}" pattern="yyyy-MM-dd"/>" /></td>
                
                
            </tr>
           
              <tr>
                <th>车牌号：</th>
                <td>
                    <input name="car" type="text" value="${bean.car}"  id="txt_Car" class="inw" /></td>
                
            
                <th>司机：</th>
                <td>
                    <input name="operater" type="text" value="${bean.operater}"  id="txt_Operater" class="inw" /></td>
                
            </tr>
            <tr>
               
           
                <th>仓库名称：</th>
                <td>
                  		<input name="txt_SH_Name"  value="${bean.shName}" type="text" id="txt_SH_Name" class="inw"   readonly="readonly"/>
                        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/StoreHouse_Helper.html', { id: 'txt_SH_Name,hf_SH_ID', key: 'SH_NAME,SH_ID' }, '仓库--选择帮助界面', 660, 400);"/>
                   
                </td>
           
                <th>运输数量(KG)：</th>
                <td>
                    <input name="amout" type="text" value="${bean.amout}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  id="txt_Amout" class="inw" /></td>
                
            </tr>
          
             <tr>
                <th>车辆温度(℃)：</th>
                <td>
                    <input name="tem" type="text" value="${bean.tem}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  id="txt_Tem" class="inw" /></td>
                
           
                <th>车辆湿度(%)：</th>
                <td>
                    <input name="hum" type="text" value="${bean.hum}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  id="txt_Hum" class="inw" /></td>
                
            </tr>
            <tr>
             	<th>目的地：</th>
                <td>
                    <input name="endadd" type="text" value="${bean.endadd}" id="txt_EndAdd" class="inw" /></td>
                
                <th>说明：</th>
                <td>
                    <input name="remark" value="${bean.remark}" type="text" id="txt_Remark" class="inw" /></td>
                
            </tr>
           
        </table>
        </div>
        <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	    </div>
        <input type="hidden" name="hf_CoFarmer_ID" id="hf_CoFarmer_ID" value="78db0529-12da-493b-a3af-7d532d5b0053" />
        <input type="hidden" name="shId" id="hf_SH_ID" value="${bean.shId}" />
        <input type="hidden" name="tsId" id="hf_TS_ID" value="${bean.tsId}" />
    </form>
</body>
</html>
