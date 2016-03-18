<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>地块编辑/新增</title>
<link rel="Stylesheet" type="text/css"
	href="${ctx}/content/css/Custom.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
<link href="${ctx}/content/css/default.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
<script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
<script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
<script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
<script src="${ctx}/content/js/area.js"></script>
 <script type="text/javascript" src="${ctx}/content/js/jquery.form.js"></script>
<script type="text/javascript">
        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            if (obj.type == 1) {
                aspnetForm.txt_FarmerName.value = obj.name; //将对象的值赋给表单
                aspnetForm.Farmer_ID.value = obj.no;
            }
            else if (obj.type == 2) {
                aspnetForm.txt_PlantBase.value = obj.name; //将对象的值赋给表单
                aspnetForm.PlantBases.value = obj.no;
            }

        }
        $(document).ready(function () {

            $("#chk_State").click(function () {
                if ($(this).attr("checked") == "checked")
                    $("label[for='chk_State']").html("<font color='red'>已使用</font>");
                else
                    $("label[for='chk_State']").html("<font color='blue'>未使用</font>");
            });
            $("#txt_Areas").ligerSpinner({ height: 28, type: 'float', step: 1, minValue: 0.0 });
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
                    txt_Plot_Name: "required",
                    txt_CoFarmerName: "required",
                    txt_FarmerName: "required",
                    Provice_AreasName$ddlTown: {
                        min: 1
                    },
                    txt_Areas: "required",
                    txt_PlantBase: "required",
                    town:{
				        required:true
			         }
                },
                messages: {
                    txt_Plot_Name: "请填写地块名称",
                    txt_CoFarmerName: "请填写生产者",
                    txt_FarmerName: "请填写农户名称",
                    Provice_AreasName$ddlTown: { min: "请选择地区" },
                    txt_Areas: "请填写面积",
                    txt_PlantBase: "请选择种植基地",
                    town:{
					  required:"请选择所在地区"
				  }
                }
            });
        });
    </script>
</head>
<body>
	<form method="post"
		action="${ctx}/Plot/PlotEdit.html?type=2&amp;id=443a43fe-b831-4fc2-a0f0-88ecd8c67ab3"
		id="form1">
		<div class="aspNetHidden">
			<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
				value="/wEPDwUKLTk0MDE1OTExOQ9kFgJmD2QWCgIBDw8WBB4EVGV4dAUONjEwNDAzMDA4LTE0NTceB0VuYWJsZWRoZGQCBQ8PFgIfAAUw5p2o5YeM56i856a+5ram5rO9546w5Luj5Yac5Lia56eR5oqA5pyJ6ZmQ5YWs5Y+4ZGQCBw8PFgIfAAUCKipkZAIPDw8WAh8ABQzogIHlvKDln7rlnLBkZAIRDxAPFgYeDURhdGFUZXh0RmllbGQFBXZhbHVlHg5EYXRhVmFsdWVGaWVsZAUDa2V5HgtfIURhdGFCb3VuZGdkEBUFBumcsuWcsAzloZHmlpnlpKfmo5oM5pel5YWJ5rip5a6kDOWcsOiGnOimhueblgzlhbbku5borr7mlr0VBQExATIBMwE0ATUUKwMFZ2dnZ2dkZGT2bqeTJ2t/fJU8/RlMzkYP8I9Xr3xAlbiqG52VTde5TQ==" />
		</div>

		<div class="aspNetHidden">

			<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
				value="/wEWFgLzxNjSCwL/7IT9BgKx4ZPMBgKmleLWCwKDnYnWBQLHgveoCALBi5DPDwKb09LyDwKBnvi+AgKA1Ly3DwKlmf/OCwKkmf/OCwKnmf/OCwKmmf/OCwKhmf/OCwLXoYH/AgK1s9viDwK09uv0AQL096C+BQKR2eHmBwKfyPjeBgLat4OpAh5UYTZJh0m76Dj/qPuGKMQCDnQkJeMFv0YjT4hqDNI8" />
		</div>
		<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					

				

					<th>
						<div class="th_text">地块名称:</div></th>
					<td><input name="txt_Plot_Name" type="text"
						value="${bean.plotName}" id="txt_Plot_Name" class="inw" /></td>
						
						<th>
						<div class="th_text">栽培设施:</div></th>
					<td><select name="Drop_Facilities" id="Drop_Facilities">
							<option value="1"
								>露地</option>
							<option value="2"
							>塑料大棚</option>
							<option value="3"
								>日光温室</option>
							<option value="4"
								>地膜覆盖</option>
							<option value="5"
								>其他设施</option>

					</select></td>

				</tr>
				<tr>
					<th>
						<div class="th_text">生产者:</div></th>
					<td><input name="txt_CoFarmerName" type="text"
						value="${cofarmerName}" readonly="readonly"
						id="txt_CoFarmerName" class="inw" /></td>

				

					<th>
						<div class="th_text">农户名称:</div></th>
					<td><input name="txt_FarmerName" type="text"
						 readonly="readonly"
						id="txt_FarmerName" class="inw input_select"
						onclick="openHelper(&#39;${ctx}/Farmer/Helper/Farmer_Helper.html&#39;, { id: &#39;txt_FarmerName,Farmer_ID&#39;, key: &#39;FARMER_NAME,FARMER_ID&#39; }, &#39;农户--选择帮助界面&#39;, 500, 400);" />
					</td>

				</tr>
				<tr>
					<th>
						<div class="th_text">所在地区:</div></th>
					<td colspan="3">

                               ${plantbaseBean.areaFullname}

						</td>

				</tr>
				<tr>
					<th>
						<div class="th_text">详细地址:</div></th>
					<td colspan="3"><input name="txt_AreasDetials" type="text" tyle="width:500px;"
						 id="txt_AreasDetials" class="inw" /></td>

				</tr>
				<tr>

					<th>
						<div class="th_text">面积:</div></th>
					<td>
						<div style="float: left;">
							<input name="txt_Areas" type="text" 
								id="txt_Areas" />
						</div>
						<div style="float: left;">亩</div></td>


				
					<th>
						<div class="th_text">种植基地:</div></th>
					<td><input name="txt_PlantBase" type="text"
						value="${baseName}" id="txt_PlantBase"
						disabled="disabled" class="aspNetDisabled inw" /></td>

				</tr>

				<tr>

					

				

					<th>
						<div class="th_text">备注:</div></th>
					<td colspan="3"><input name="txt_Notes" type="text" id="txt_Notes"
						class="inw"  /></td>


				</tr>
				

			</table>
			  <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
			<input type="hidden" name="PlantBasesId" id="PlantBasesId" value="${baseID}" />
				<input type="hidden" name="Farmer_ID" id="Farmer_ID" /> 
			<input type="hidden" name="areaId" id="areaId" value="${plantbaseBean.areaId}" /> 
			
		     <input type="hidden" id="bean.provinceCode" name="provinceValue" value="${plantbaseBean.provinceAid}" /> 
			<input type="hidden" id="bean.cityCode" name="cityValue" value="${plantbaseBean.cityAid}" /> 
			<input type="hidden" id="bean.districtCode" name="countyValue" value="${plantbaseBean.countyAid}" /> 
			<input type="hidden" id="bean.streetCode" name="townValue" value="${plantbaseBean.townAid}" /> 
	</form>
</body>
</html>
