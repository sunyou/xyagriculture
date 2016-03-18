<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增/修改农药</title>
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
            var code = $("#ddl_MaterialType_code").val();
            openHelper('${ctx}/Base/Material/MaterialCategory.html?code=' + code, { id: 'txt_Category_ID,hf_Category_ID', key: 'CATEGORY_NAME,CATEGORY_ID' }, '农用物资类别--选择帮助界面', 500, 400);
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
                    txt_Category_ID: "required",
                    txt_CommonName: "required",
                    txt_CompositeDays: { required: true, number: true },
                    txt_Produce_No: "required",
                    txt_Specification: "required",
                    ddl_DoseType: { min: 1 },
                    txt_Usage: { required: true, number: true },
                    txt_SuitableGoods: "required",
                    txt_Producer: "required",
                    txt_MainComponent: "required",
                    txt_Notes: "required",
                    txt_Price: { required: true, number: true }
                },

                messages: {
                    txt_Material_Name: "请填写肥料名称",
                    txt_Category_ID: "请选择物资类别",
                    txt_CommonName: "请填写通用名",
                    txt_CompositeDays: { required: "请填写分解天数"},
                    txt_Produce_No: "请填写登记证号",
                    txt_Specification: "请填写规格",
                    ddl_DoseType: { min: "请选择剂型" },
                    txt_Usage: { required: "请填写参考用量"},
                    txt_SuitableGoods: "请填写适用作物",
                    txt_Producer: "请填写生产厂家",
                    txt_MainComponent: "请填写主要成分",
                    txt_Notes: "请填写使用方法"
                }
            });

        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/materialNYSave.html');</script>
	</c:if>
    <form method="post" action="${ctx}/Base/Material/materialNYSave.html" id="form1">
        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="60"><div class="th_text">农药名称:</div></td>
                <td>
                    <input name="txt_Material_Name" type="text" id="txt_Material_Name" class="inw" value="${bean.materialName}" />
                </td>
                <td><div class="th_text">物资类别:</div></td>
                <td>
                    <input name="txt_Category_ID" type="text" readonly="readonly" id="txt_Category_ID" class="inw" onfocus="CategoryHelper()" value="${materialCategoryBean.categoryName}" />
                </td>
            </tr>
            <tr>
                <td><div class="th_text">通用名:</div></td>
                <td>
                    <input name="txt_CommonName" type="text" id="txt_CommonName" class="inw" value="${bean.commonname}" />
                </td>
                <td><div class="th_text">分解天数:</div></td>
                <td>
                    <input name="txt_CompositeDays" type="text" id="txt_CompositeDays" class="inw" />
                </td>
            </tr>
            <tr>
                <td><div class="th_text">登记证号:</div></td>
                <td>
                    <input name="txt_Produce_No" type="text" id="txt_Produce_No" class="inw" value="${bean.produceNo}" /></td>
                <td><div class="th_text">规格:</div></td>
                <td>
                    <input name="txt_Specification" type="text" id="txt_Specification" class="inw" /></td>
            </tr>
            <tr>
                <td><div class="th_text">剂型:</div></td>
                <td>
                    <select name="ddl_DoseType" id="ddl_DoseType" class="inw">
						<option value="1">液体</option>
						<option value="2">固体</option>
						<option value="3">气雾剂</option>
						<option value="4">颗粒</option>
						<option value="5">水分散粒剂</option>
						<option value="6">水溶剂</option>
						<option value="7">熏蒸剂</option>
						<option value="8">片剂</option>
						<option value="9">烟剂</option>
						<option value="10">其他</option>
					</select>
                </td>
                <td><div class="th_text">参考用量:</div></td>
                <td>
                    <input name="txt_Usage" type="text" id="txt_Usage" class="inw" /></td>
                
            </tr>
            <tr>
                <td><div class="th_text">适用作物:</div></td>
                <td>
                    <input name="txt_SuitableGoods" type="text" id="txt_SuitableGoods" class="inw" /></td>
                <td><div class="th_text">生产厂家:</div></td>
                <td>
                    <input name="txt_Producer" type="text" id="txt_Producer" value="${bean.producer}" class="inw" />
                </td>
                
            </tr>
            <tr>
                <td><div class="th_text">防治对象:</div></td>
                <td>
                    <input name="txt_UsableRange" type="text" id="txt_UsableRange" class="inw" value="${bean.usablerange}" /></td>
                <td><div class="th_text">主要成分:</div></td>
                <td>
                    <input name="txt_MainComponent" value="${bean.maincomponent}" type="text" id="txt_MainComponent" class="inw" /></td>
            </tr>
            <tr>
                <td><div class="th_text">使用方法:</div></td>
                <td colspan="3">
                    <input name="txt_Notes" type="text" id="txt_Notes" class="inw" value="${bean.notes}" /></td>
                
            </tr>
			<tr>
				<td align="left">&nbsp;</td>
                <td colspan="3">
					<label id="butt" class="butt">
						<input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn"/></label>
                </td>
			</tr>
        </table>
		</div>
		<input type="hidden" name="ddl_MaterialType_code" id="ddl_MaterialType_code" value="2" />
		<input type="hidden" name="hf_Material_ID" id="hf_Material_ID" value="${bean.materialId}" />
        <input type="hidden" name="hf_Category_ID" id="hf_Category_ID" value="${bean.categoryId}"/>
        <input type="hidden" name="hf_CoFarmerID" id="hf_CoFarmerID"/>
        <input type="hidden" name="Type" id="Type" value="${Type}" />
    </form>
</body>
</html>
