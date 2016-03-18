<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑农户信息</title>
   <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctxt}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/area.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.form.js"></script>
<script type="text/javascript">

	
	$(document).ready(function() {
		$("#form1").validate({
			//debug: true,
			onfocusout : true,
			showErrors : function(errorMap, errorList) {
				var msg = "";
				$.each(errorList, function(i, v) {
					msg += (v.message + "\r\n");
				});
				if (msg != "")
					alert(msg);
			},
			errorPlacement : function(error, element) {
				//".AreaList"
				//var placement = $(element).parents("td").next();
				//placement.text('');
				//error.appendTo(placement);
			},
			rules : {
				txt_FarmerName : "required",
				txt_CoFarmerName : "required",
				txt_Tel : {
					required : true,
					isPhone : true
				},
				txt_PersonID:{
					required: true,
				    minlength:18
				},
			  town:{
				  required:true
			  }
				
			   
			},
			messages : {
				txt_FarmerName : "请填写农户名称",
				txt_CoFarmerName : "请填写生产者",
				txt_Tel : {
					required : "请填写联系电话",
					isPhone : "请输入手机号或者固话"
				},
				txt_PersonID:{
					required: "请输入身份证号",
				    minlength:"身份证格式有误"
				},
				 town:{
					  required:"请选择所在地区"
				  }
			}
		});

	});
</script>
</head>
<body>
	<form method="post" action="${ctx}/Farmer/FarmerEdit.html" id="form1">
 
		<div class="jspHidden">

			
		</div>
		<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<th width="80">  农户名称:  </th>
					<td><input name="txt_FarmerName" type="text"
						id="txt_FarmerName" class="inw" value="${bean.farmerName}" />
					</td>

	
					<th>
						<div class="th_text">性别   </div>
						
					</th>
					<td><input value="男" name="sex" type="radio" id="radsex1" 	<c:if test="${bean.sex=='男'}">checked="checked"</c:if> /> 
					<label for="radsex1">男</label> 
					<input value="女" name="sex" type="radio" id="radsex2"   <c:if test="${bean.sex=='女'}">checked="checked"</c:if>/> 
					<label for="radsex2">女</label>
					</td>
					
				</tr>
				<tr>
					<th>
						<div class="th_text">电话:</div>
					</th>
					<td><input name="txt_Tel" type="text" id="txt_Tel" class="inw"
						value="${bean.tel}" />
					</td>

					<th>
						<div class="th_text">身份证号码:</div>
					</th>
					<td><input name="txt_PersonID" type="text" id="txt_PersonID"
						class="inw" value="${bean.personid}" />
					</td>

				</tr>
				<tr>
					<th>
						<div class="th_text">所在地区:</div>
					</th>
					<td colspan='3'>
						<div class="EditAreas">
							  <select name="bean.provinceCode" class="inw"
								id="province" style="margin-right:10px; width: 110px;">
								<option value="">--请选择--</option>
							</select> 
							<select name="bean.cityCode" class="inw" id="city"
								style="margin-right:10px; width: 110px;">
								<option value="">--请选择--</option>
							</select> 
							<select name="bean.districtCode" class="inw"
								id="county" style="margin-right:10px; width: 110px;">
								<option value="">--请选择--</option>
							</select> 
							<select name="bean.streetCode" class="inw" id="town"
								style="margin-right:10px; width: 110px;">
								<option value="">--请选择--</option>
							</select> 
						</div>
					</td>

				</tr>
				<tr>
					<th>
						<div class="th_text">详细地址:</div>
					</th>
					<td  colspan='3'><input name="txt_Address" type="text" id="txt_Address"
						class="inw" value="${bean.address}" />
					</td> 
				</tr>
				
				<tr>
					<th>
						<div class="th_text">备注:</div>
					</th>
					<td colspan='3'><input name="txt_Remark" type="text" id="txt_Remark"
						class="inw" value="${bean.remark}" />
					</td>

				</tr>

				<tr>
					<th>
						<div class="th_text">所属生产者:</div>
					</th>
					<td colspan='3'>
					${cCoFarmerName}
					</td>
				</tr> 
			</table>
			
			<div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
		<input type="hidden" name="CoFarmer_ID" id="CoFarmer_ID" value="${bean.cofarmerId}" /> 
		<input type="hidden" name="Farmer_ID" id="Farmer_ID" value="${bean.farmerId}" />
			
			<input type="hidden" id="provinceValue" name="provinceValue" value="${bean.provinceAid}" /> 
			<input type="hidden" id="cityValue" name="cityValue" value="${bean.cityAid}" /> 
			<input type="hidden" id="countyValue" name="countyValue" value="${bean.countyAid}" /> 
			<input type="hidden" id="townValue" name="townValue" value="${bean.townAid}" /> 
			
			<input type="hidden" name="txt_Area_Id" value="${bean.areaId}" />
				
	</form>
</body>
</html>

