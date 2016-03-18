<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp"%>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>技术员编辑/新增</title>
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
    <script src="${ctx}/content/js/area.js"></script>
     <script type="text/javascript" src="${ctx}/content/js/jquery.form.js"></script>
    <script type="text/javascript">
        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            if (obj.type == 1) {
                aspnetForm.txt_Dept_Name.value = obj.name; //将对象的值赋给表单
                aspnetForm.HFDept_UID.value = obj.no;
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
                    //alert($(placement).html());
                },
                rules: {
                    txt_Dept_Name: "required",
                    txt_professional: "required",
                    txt_UserNo: "required",
                    txt_Password: "required",
                    txt_Duty: "required",
                    txt_Mobile: { required: true, isMobile: true },
                    txt_Email: { required: true, email: true },
                    Provice_AreasName$ddlTown: { min: 1 },
                    town:{
      				  required:true
      			  }
                },

                messages: {
                    txt_Dept_Name: "请选择所属部门",
                    txt_professional: "请填写专业特长",
                    txt_UserNo: "请填写账号",
                    txt_Password: "请填写密码",
                    txt_Duty: "请填写职务",
                    txt_Mobile: { required: "请填写移动电话", isMobile: "格式不正确" },
                    txt_Email: { required: "请填写邮箱", email: "格式不正确" },
                    Provice_AreasName$ddlTown: "请选择地区",
                    town:{
  					  required:"请选择所在地区"
  				  }
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/Users/TechEdit.html?Type=1" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMjAzODMxMjA4NQ9kFgJmD2QWBAIBDxYCHgVzdHlsZQUNZGlzcGxheTpub25lOxYCAgEPZBYCAgEPDxYCHgRUZXh0BQoyMDE1LTA5LTIzZGQCAw8PFgIeB0VuYWJsZWRnZGRkTaeauNH8j0FDHrgpPz5jQ6LIEpHQYg3SuPlt/GTmuf0=" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWEAKE5uGhDQLTtPDPAgK8592/BQL4v92/BQK14vbRCQKeiOGKCAKLqrnsAQK1hraNBwK25eDbCgL+w6vSBQLHgveoCALBi5DPDwK7j93iAQK1s9viDwLo3NW4AgLa75WuA4iJDi5EAPKzlLasCrcvg+O1amc1vupUIIXEBcyHS2CL" />
</div>
        <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
                <tr id="tr_RecordDate" >

                      <th>
                        <div>姓名:</div>
                    </th>
                    <td>
                        <input name="txt_User_Name" type="text" id="txt_User_Name" class="inw" value="${bean.userName}"/>
                    </td>
       
                    <th width="70">
                        <div>性别:</div>
                    </th>
                    <td><span id="rbl_sex"><input id="rbl_sex_0" type="radio" name="rbl_sex" value="男"  <c:if test="${bean.sex=='男'}">checked</c:if> /><label for="rbl_sex_0">男</label><input id="rbl_sex_1" type="radio" name="rbl_sex" value="女" <c:if test="${bean.sex=='女'}">checked</c:if> />  <label for="rbl_sex_1">女</label></span>
                    </td>
                </tr>
                <tr>
                     <th width="70">
                        <div>职务:</div>
                    </th>
                    <td>
                        <input name="txt_Duty" type="text" id="txt_Duty" class="inw" value="${bean.duty}"/>
                    </td>
   
                    <th>
                        <div>专业特长:</div>
                    </th>
                    <td>
                        <input name="txt_professional" type="text" id="txt_professional" class="inw" value="${bean.professional}"/>
                    </td>
                    
                    
                </tr>
                <tr>
                     <th>
                        <div>移动电话:</div>
                    </th>
                    <td>
                        <input name="txt_Mobile" type="text" id="txt_Mobile" class="inw" value="${bean.mobile}"/>

                    </td>  
                    <th>
                        <div>固定电话:</div>
                    </th>
                    <td>
                        <input name="txt_Tel" type="text" id="txt_Tel" class="inw" value="${bean.tel}"/>
                    </td>
                 
                </tr>
                <tr>
                     <th>
                        <div>电子邮箱:</div>
                    </th>
                    <td colspan=3>
                        <input name="txt_Email" type="text" id="txt_Email" class="inw" value="${bean.email}"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <div>所在地区:</div>
                    </th>
                    <td colspan='3' >
                        

<div class="EditAreas">
                      <select name="bean.provinceCode" class="input-select"
								id="province" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> 
							<select name="bean.cityCode" class="input-select" id="city"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> 
							<select name="bean.districtCode" class="input-select"
								id="county" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> 
							<select name="bean.streetCode" class="input-select" id="town"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> 
</div>

                    </td>
                    
                </tr>
                <tr>
                    <th>
                        <div>联系地址:</div>
                    </th>
                    <td colspan='3'>
                        <input name="txt_Address" type="text" id="txt_Address" class="inw" value="${bean.address}"/>
                    </td>
                    
                </tr>

               
            </table>
            <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        </div>
        <input type="hidden" name="HFDept_UID" id="HFDept_UID"  value="${bean.deptUid}"/>
        <input type="hidden" name="HFUser_UID" id="HFUser_UID" value="${bean.userUid}"/>
        <input type="hidden" name="recordDate" id="recordDate" value="${bean.recordDate}"/>
        <input type="hidden" name="areaId" id="recordDate" value="${bean.areaId}"/>
        
        	<input type="hidden" id="provinceValue" name="provinceValue" value="${bean.provinceAid}" /> 
			<input type="hidden" id="cityValue" name="cityValue" value="${bean.cityAid}" /> 
			<input type="hidden" id="countyValue" name="countyValue" value="${bean.countyAid}" /> 
			<input type="hidden" id="townValue" name="townValue" value="${bean.townAid}" /> 
    </form>
</body>
</html>

