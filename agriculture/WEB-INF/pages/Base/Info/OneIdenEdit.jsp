<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加地理标志</title>
   <%@ include file="/common/include.jsp"%>
    <script type="text/javascript" src="${ctx}/content/js/jquery.fileupload.js"></script>
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
                    txt_FarmerName: "required",
                    txt_CoFarmerName: "required",
                    txt_Tel: {
                        required: true,
                        isPhone: true
                    },
                    txt_PersonID: { required: true, idcard: true },
                    uc_Areas$ddlTown: {
                        min: 1
                    }
                },
                messages: {
                    txt_OneIdenName: "请填写核准登记产品全称",
                    txt_OneIdenNo: "请填写登记证书编号",
                    txt_Register: { required: "请选择登记申请人" },
                    txt_ProdScale: { required: "请输入产品生产总规模" },
                    txt_SpecNum: { required: "请输入质量控制规范编号" }
                }
            });
            
            $('#fileUpload1').fileupload({
            	filePathId:'docfilepath',
            	validTypes:'jpg,jpeg,gif,bmp,png'
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/OneIden/OneIdenEdit.html?Type=1" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMjAwNzk2NjI0MA9kFgJmD2QWAgIFDw8WAh4HRW5hYmxlZGhkZGTnvz8q+zzC5ERGTfwwubkUCpmzCdGjEz9HBbTSU/lldg==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCgKEo4IhAv769LIHAq7O54UBAqPP25EPAteI7okIArbgk+IOArnDx6YMArWz2+IPApHZ4eYHAvzw1doPIjqqtvbVcU/oqe7Qd8rdTPZX9S8FdkhL4HrkqVhovyI=" />
</div>
        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="100px">
                        <div class="th_text">核准登记产品:</div>
                    </th>
                    <td  >
                        <input name="txt_OneIdenName" type="text" id="txt_OneIdenName" class="inw" value="${bean.oneidenname}" />
                    </td>
                    
                
                    <th width="100px">
                        <div class="th_text">证书编号:</div>
                    </th>
                    <td>
                        <input name="txt_OneIdenNo" type="text" id="txt_OneIdenNo" class="inw" value="${bean.oneidenno}"/>
                    </td>
                    
                </tr>
                <tr>
                    <th>
                        <div class="th_text">企业单位名称:</div>
                    </th>
                    <td>
                        <input name="txt_CoFarmer_Name" type="text" id="txt_CoFarmer_Name" disabled="disabled" class="aspNetDisabled inw" value="${cCoFarmerName}"/>
                    </td>
                    
                
                    <th>
                        <div class="th_text">登记申请人:</div>
                    </th>
                    <td>
                        <input name="txt_Register" type="text" id="txt_Register" class="inw" value="${bean.register}"/>
                    </td>
                    
                </tr>
                <tr>
                    <th>
                        <div class="th_text">产品生产总规模:</div>
                    </th>
                    <td>
                        <input name="txt_ProdScale" type="text" id="txt_ProdScale" class="inw" value="${bean.prodscale}"/>
                    </td>
                    
              
                    <th>
                        <div class="th_text">质量控制编号:</div>
                    </th>
                    <td>
                        <input name="txt_SpecNum" type="text" id="txt_SpecNum" class="inw" onclick="GoodVarietyHelper()" value="${bean.specnum}"/></td>
                    
                </tr>
                <tr>
                    <th>
                        <div class="th_text">电子影印件:</div>
                    </th>
                    <td colspan="3">
                         <div id="fileUpload1">
                        </div>
                    </td>
                    
                </tr>
              
            </table>
             <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        </div>
        <input type="hidden" name="docfilepath" id="docfilepath" value="${bean.content}"/>
        
        <input type="hidden" name="CoFarmer_ID" id="CoFarmer_ID" value="${bean.cofarmerId}" />
        <input type="hidden" name="OneIden_ID" id="OneIden_ID" value="${bean.oneidenId}"/>
        <div id="divMsg" style="display: none;"></div>
    </form>
</body>
</html>
