<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑种植基地</title>
      <%@ include file="/common/include.jsp"%>
    <script type="text/javascript" src="${ctx}/content/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/area.js"></script>
    <script type="text/javascript">
    var grid2 = null;
        $(document).ready(function () {
            
          $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
          
          
          
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
                    txt_PlantLotName: "required",
                    txt_Areas: { required: true, number: true },
                    txt_CoFarmerName: "required",
                    uc_Areas$ddlTown: {
                        min: 1
                    },
                    txt_Tel: {
                        required: true,
                        isPhone: true
                    },
                    txt_Contacts: "required",
                    txt_Addr: "required",
                     town:{
				        required:true
			         }
                },
                messages: {
                    txt_PlantLotName: "请填写种植基地名称",
                    txt_Areas: { required: "请填写区域面积" },
                    txt_CoFarmerName: "请填写生产者名称",
                    uc_Areas$ddlTown: { min: "请选择地区" },
                    txt_Tel: {
                        required: "请填写电话",
                        isPhone: "请填写一个手机号码"
                    },
                    txt_Contacts: "请填联系人",
                    txt_Addr: "请填写联系地址",
                     town:{
					  required:"请选择所在地区"
				  }
                }
            });

             $('#fileUpload1').fileupload({
            	filePathId:'docfilepath',
            	validTypes:'jpg,jpeg,gif,bmp,png'
            });
            
            
            
                    
        
        });
        
        
          $(function () {
            // Invoke the plugin
            $('input, textarea').placeholder();
        });
        var GLOBAL = {
		    WEBROOT:"${ctx}"
		};
		
		
    </script>
   
</head>
<body>
    <form method="post" action="${ctx}/PlantBases/PlantBaseEdit.html?type=2&amp;id=5D1089C9-EDE9-424D-87EF-002B01D836CD" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMzE2NDg4NzgxD2QWAmYPZBYEAgEPDxYEHgRUZXh0BQ5KRDYxMDQwMzAwODEyMB4HRW5hYmxlZGhkZAIFDw8WBB8ABTDmnajlh4znqLznpr7mtqbms73njrDku6PlhpzkuJrnp5HmioDmnInpmZDlhazlj7gfAWhkZGQRWr8bPJ1ZhWXdfnPmOXkh5mR+sfSlzYX0Gecjf1d1UA==" />
</div>

        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="70">
                        <div class="th_text">生产者:</div>
                    </th>
                    <td>
                        <input name="txt_CoFarmerName" type="text" value="${cofarmerName}" id="txt_CoFarmerName" disabled="disabled" class="aspNetDisabled inw" />
                    </td>
                     <th width="70">
                        <div class="th_text">基地名称:</div>
                    </th>
                    <td>
                        <input name="plantBasesName" type="text" id="txt_PlantLotName" class="inw" />
                    </td>
                </tr>
              
                <tr>
                     <th>
                        <div class="th_text">电话:</div>
                    </th>
                    <td>
                        <input name="txt_Tel" type="text"  id="txt_Tel" class="inw" />
                    </td>
                     <th>
                        <div class="th_text">联系人:</div>
                    </th>
                    <td>
                        <input name="txt_Contacts" type="text" id="txt_Contacts" class="inw" />
                    </td>
                </tr>
             
                <tr>
                  
                      <th>
                        <div class="th_text">种植环境:</div>
                    </th>
                    <td colspan="3">
                        <input name="txt_PlotEnvironment"   type="text"  id="txt_PlotEnvironment" class="inw" />
                    </td>
                </tr>
                <tr>
                 <th>
                        <div class="th_text">基地图片:</div>
                    </th>
                    <td colspan="3">
                          <div id="fileUpload1">
                          </div>
                    </td>
                </tr>
              
                <tr>
                    <th>
                        <div class="th_text">所在地区:</div>
                    </th>
                    <td colspan="3">
                        


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
                        <div class="th_text">详细地址:</div>
                    </th>
                    <td colspan="3">
                        <input name="txt_Addr" type="text" style="width:500px;" id="txt_Addr" class="inw" />
                    </td>
                    
                </tr>
              
                <tr>
                    <th>
                        <div class="th_text">说明:</div>
                    </th>
                    <td colspan="3">
                        <textarea name="txt_Notes" rows="5" cols="20" id="txt_Notes" style="width:500px;">
</textarea>
                    </td>
                    
                </tr>
               
            </table>
              
             
             <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        </div>
         <input type="hidden" name="docfilepath" id="docfilepath" value="${bean.docfilesrc}"/>
        
        <input type="hidden" name="Areas_Help" id="Areas_Help" />
        <input type="hidden" name="hf_CoFarmer_ID" id="hf_CoFarmer_ID" value="${bean.cofarmerId}" />
        <input type="hidden" name="areaId" id="areaId" value="${bean.areaId}" />
         <input type="hidden" name="plantBasesNo" id="plantBasesNo" value="${bean.plantbasesNo}" />
        <input type="hidden" name="plantBasesName" id="plantBasesName" value="${bean.plantbasesName}" />
        
        <input type="hidden" id="provinceValue" name="provinceValue" /> 
			<input type="hidden" id="cityValue" name="cityValue"  /> 
			<input type="hidden" id="countyValue" name="countyValue"  /> 
			<input type="hidden" id="townValue" name="townValue"  /> 
        <div id="divMsg" style="display: none;"></div>
    </form>
    
    	
		
		
		</div>
	
      
</body>
</html>
