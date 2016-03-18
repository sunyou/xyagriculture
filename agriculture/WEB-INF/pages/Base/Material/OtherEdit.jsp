<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增/修改其他投入品</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        function CategoryHelper() {
//            var code = $("#ddl_MaterialType_Code").val();
            var code = "all";
            openHelper('${ctx}/Base/Material/MaterialCategory.html?code=' + code, { id: 'txt_Category_ID,hf_Category_ID', key: 'CATEGORY_NAME,CATEGORY_ID' }, '农用物资类别--选择帮助界面', 660, 360);
        }


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
                    txt_Material_Name: "required",
                    txt_Price: "required",
                    txt_Producer: "required",
                    txt_Notes: "required",
                    txt_Price: { required: true, number: true ,min:0 ,max:10000 },
                    txt_UnitName: "required"
                },

                messages: {
                    txt_Material_Name: "请填写农资",
                    txt_Price: "请填写单价",
                    txt_Producer: "请选择生产厂家",
                    txt_Notes: "请填写使用方法",
                    txt_Price: "请填写数量",
                    txt_UnitName: "请选择单位"
                }
            });
            $(".spinner").ligerSpinner({ height: 28, type: 'int',min:1,max:10000 });
        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/OtherSave.html');</script>
	</c:if>
    <form method="post" action="${ctx}/Base/Material/OtherSave.html" id="form1">
        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="15%"><div class="th_text">其他农资:</div></td>
                <td width="35%">
                    <input name="txt_Material_Name" type="text" id="txt_Material_Name" value="${bean.materialName }" class="inw" /></td>
            
            	<td width="15%"><div class="th_text">物资类别:</div></td>
                <td width="35%">
                    <input name="txt_Category_ID" type="text" id="txt_Category_ID" value="${materialCategoryBean.categoryName }" class="inw" readonly="readonly"/>
               		<input type=button class='rowSelectButton' value='选择' onclick="CategoryHelper()"/>
                </td>
            </tr>
            <tr>
                <td><div class="th_text">通用名:</div></td>
                <td>
                    <input name="txt_CommonName" type="text" id="txt_CommonName" class="inw" value="${bean.commonname }"/></td>
                <td><div class="th_text">登记证号:</div></td>
                <td>
                    <input name="txt_Produce_No" type="text" id="txt_Produce_No" class="inw" value="${bean.produceNo }"/></td>
            </tr>
            <tr>
                
                <td><div class="th_text">数量:</div></td>
                <td>
                    <input name="txt_Price" type="text" id="txt_Price"  class="inw spinner"  value="${bean.price }" /></td>
                <td><div class="th_text">单位:</div></td>
                <td>
                    <input type="text" name="txt_UnitName" id="txt_UnitName" class="inw" readonly="readonly"  value="${bean.specification }"  />
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/UnitsHelper/Units_Helper.html', { id: 'txt_UnitName', key: 'UNITNAME' }, '单位选择界面', 660, 360);"  />
                </td>
            </tr>
            <tr>
                <td><div class="th_text">生产厂家:</div></td>
                <td>
                    <input name="txt_ProducerOther" type="text" id="txt_ProducerOther" readonly="readonly" value="${producerBean.producerName }" class="inw" />
                	<input type=button class='rowSelectButton' value='选择' onclick="openHelper(&#39;${ctx}/Base/Material/Producer_Helper.html&#39;, { id: &#39;txt_ProducerOther,hf_Producer_ID&#39;, key: &#39;PRODUCER_NAME,PRODUCER_ID&#39; }, &#39;生产厂家--选择界面&#39;, 660, 360);"/>
                </td>
                 <td><div class="th_text">主要成分:</div></td>
                <td>
                    <input name=MAINCOMPONENT type="text" id="MAINCOMPONENT" value="${bean.maincomponent }" class="inw"  />
                </td>
            </tr>
            <tr>
            	<!-- 
            	<td><div class="th_text">含量:</div></td>
                <td>
                    <input name=hanliang type="text" id="hanliang" value="" class="inw"  />
                </td>
            	 -->
                
                <td><div class="th_text">使用方法:</div></td>
                <td>
                    <input name=txt_Notes type="text" id="txt_Notes" value="${bean.notes }" class="inw"  />
                </td>
                <td><div class="th_text">适用对象:</div></td>
                <td>
                	<input name=usablerange type="text" id="usablerange" value="${bean.usablerange }" class="inw"  />
                </td>
            </tr>
        </table>
        <div align=center><br><br>
			<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
		</div>
        <input type="hidden" name="hf_Producer_ID" id="hf_Producer_ID" value="${bean.producer}"/>
        <input type="hidden" name="hf_Category_ID" id="hf_Category_ID" value="${bean.categoryId}"/>
        <input type="hidden" name="hf_Material_ID" id="hf_Material_ID" value="${bean.materialId}"/>
        <input type="hidden" name="Type" id="Type" value="${Type}" />
    </form>
</body>
</html>
