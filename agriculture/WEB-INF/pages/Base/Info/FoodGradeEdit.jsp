<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑食品等级</title>
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
                    txt_CerName: "required",
                    txt_CerNo: "required",
                    Drop_Criteria_Level: "required",
                    txt_CoFarmer_Name: "required",
                    txt_Goods_ID: "required",
                    txt_GoodVariety_ID: "required",
                    txt_PlantBases_UID: "required",
                    in_SignDate: "required",
                    txt_EffectDate: "required"
                },
                messages: {
                    txt_CerName: "请填写产品名称",
                    txt_CerNo: "请填写证书编号",
                    Drop_Criteria_Level: { required: "请选择农产品等级" },
                    txt_CoFarmer_Name: { required: "请输入生产单位" },
                    txt_Goods_ID: { required: "请输入农作物" },
                    txt_GoodVariety_ID: { required: "请输入品种" },
                    txt_PlantBases_UID: { required: "请输入种植基地" },
                    in_SignDate: { required: "请输入证书签订日期" },
                    txt_EffectDate: { required: "请输入证书有效期" }
                }
            });
            
               $('#fileUpload1').fileupload({
            	filePathId:'docfilepath',
            	validTypes:'jpg,jpeg,gif,bmp,png'
            });

        });
        function GoodVarietyHelper() {
            var Goods = $("#Goods_ID").val();
            openHelper('/Pages/Helper/GoodVariety_Helper.aspx?Goods=' + Goods, {
                id: 'txt_GoodVariety_ID,GoodVariety_ID', key: 'GoodVariant_Name,GoodVariety_ID'
            }, '种子苗--选择帮助界面', 500, 400);
        }
    </script>
</head>
<body>
    <form method="post" action="${ctx}/FoodGrade/FoodGradeEdit.html?Type=1" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJODk2OTk2MzkxD2QWAmYPZBYEAgUPEA8WBh4NRGF0YVRleHRGaWVsZAUFdmFsdWUeDkRhdGFWYWx1ZUZpZWxkBQNrZXkeC18hRGF0YUJvdW5kZ2QQFQMG57u/6ImyBuacieacugnml6DlhazlrrMVAwExATIBMxQrAwNnZ2dkZAIHDw8WAh4HRW5hYmxlZGhkZGQ8eQqitmMNIRG+/ITkiODpOf8lnRWLd1oxx7rnTvR4DQ==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWEQLggsImArXZuuQMAr718IkCAqXcmbYLAqTcmbYLAqfcmbYLAqPP25EPAur03vEKAqiA1vMBApO95scOArLvs8wGAqjg4fQOApbrkKsIArWz2+IPApHZ4eYHAsiHqpALAoLd1M4MK6ZhFqAxUegWcD034JY+w1kZAdXXNcgs7kr3QRe+y4M=" />
</div>
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="80">
                        <div class="th_text">产品名称:</div>
                    </th>
                    <td>
                        <input name="txt_CerName" type="text" id="txt_CerName" class="inw" />
                    </td>
                    
              
                    <th width="80">
                        <div class="th_text">证书编号:</div>
                    </th>
                    <td>
                        <input name="txt_CerNo" type="text" id="txt_CerNo" class="inw" />
                    </td>
                    
                </tr>
                <tr>
                    <th>
                        <div class="th_text">农产品等级:</div>
                    </th>
                    <td>
                         <select name="Drop_Criteria_Level" id="Drop_Criteria_Level">
	<option value="1">绿色</option>
	<option value="2">有机</option>
	<option value="3">无公害</option>

</select>
                    </td>
                    
               
                    <th>
                        <div class="th_text">企业单位名称:</div>
                    </th>
                    <td>
                        <input name="txt_CoFarmer_Name" type="text" id="txt_CoFarmer_Name" disabled="disabled" class="aspNetDisabled inw" value="${cCoFarmerName}" />
                    </td>
                    
                </tr>
                <tr>
                    <th>
                        <div class="th_text">农产品:</div>
                    </th>
                    <td>
                        <input name="txt_GoodsName" type="text"  id="txt_GoodsName" class="inw input_select" />
                    </td>
                    
                
                    <th>
                        <div class="th_text">产地地址:</div>
                    </th>
                    <td>
                        <input name="txt_ChanDiAddr" type="text"  id="txt_ChanDiAddr" class="inw input_select" />
                    </td>
                    
                </tr>
                
                 <tr>
                    <th>
                        <div class="th_text">批准产量:</div>
                    </th>
                    <td>
                        <input name="txt_AppProd" type="text" id="txt_AppProd" class="inw" />
                    </td>
                    
               
                    <th>
                        <div class="th_text">发证日期:</div>
                    </th>
                    <td>
                        <input name="in_SignDate" type="text" id="in_SignDate" class="Wdate inw" onclick="WdatePicker({ dateFmt: &#39;yyyy-MM-dd&#39; })" readonly="readonly" />
                    </td>
                    
                </tr>
                 <tr>
                    <th>
                        <div class="th_text">发证单位:</div>
                    </th>
                    <td>
                        <input name="txt_SignDept" type="text" id="txt_SignDept" class="inw" />
                    </td>
                    
                
                    <th>
                        <div class="th_text">证书有效期:</div>
                    </th>
                    <td>
                        <input name="txt_EffectDate" type="text" id="txt_EffectDate" class="inw" />
                    </td>
                    
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
        <input type="hidden" name="CoFarmer_ID" id="CoFarmer_ID" />
        <input type="hidden" name="ThreeProd_ID" id="ThreeProd_ID" />
        <input type="hidden" name="HF_Path" id="HF_Path" />
        <div id="divMsg" style="display: none;"></div>
    </form>
</body>
</html>
