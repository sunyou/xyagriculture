<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增/修改投入品</title>
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
        function CategoryHelper() {
            var code = $("#ddl_MaterialType_Code").val();
            openHelper('${ctx}/Base/Material/MaterialCategory.html?code=' + code, { id: 'txt_Category_ID,hf_Category_ID', key: 'CATEGORY_NAME,CATEGORY_ID' }, '农用物资类别--选择帮助界面', 500, 400);
        }

        $(document).ready(function () {

            $("#form1").validate({
                //debug: true,
                errorPlacement: function (error, element) {
                    //".AreaList"
                    var placement = $(element).parents("td").next();
                    placement.text('');
                    error.appendTo(placement);
                },
                rules: {
                    txt_Material_Name: "required",
                    txt_CommonName: "required",
                    txt_Specification: "required",
                    txt_Produce_No: "required",
                    txt_Category_ID: "required",
                    ddl_DoseType: { min: 1 },
                    txt_Producer: "required",
                    txt_Price: { required: true, number: true }
                },

                messages: {
                    txt_Material_Name: "请填写肥料名称",
                    txt_CommonName: "请填写通用名",
                    txt_Specification: "请填写规格",
                    txt_Produce_No: "请填写登记证号",
                    txt_Category_ID: "请选择物资类别",
                    ddl_DoseType: { min: "请选择剂型" },
                    txt_Producer: "请填写生产厂家"
                }
            });

        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/FertilizerSave.html');</script>
	</c:if>
    <form method="post" action="${ctx}/Base/Material/FertilizerSave.html" id="form1">
       <div class="edit_panel">
            <table class="edit_table"  border="0" cellpadding="0" cellspacing="0" width="470">
            <tbody>
                <tr>
                    <td colspan="2">
                        <font color="#0090D7">
                            <span id="lbl_Type">新增</span>肥料</font>
                        <input type="hidden" name="hf_Material_ID" id="hf_Material_ID"  value="${bean.materialId}"  />
                    </td>
					<td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td width="60"><div class="th_text">肥料名称:</div>
                    </td>
                    <td width="210">
                        <input name="txt_Material_Name" type="text" id="txt_Material_Name" class="inw" value="${bean.materialName}"/>
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>

                    <td><div class="th_text">编号:</div>
                    </td>
                    <td>
                        <span id="lbl_Material_No">(自动生成)</span>
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td><div class="th_text">通用名:</div>
                    </td>
                    <td>
                        <input name="txt_CommonName" type="text" id="txt_CommonName" class="inw" value="${bean.commonname}" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>

                    <td><div class="th_text">规格:</div>
                    </td>
                    <td>
                        <input name="txt_Specification" type="text" id="txt_Specification" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td><div class="th_text">登记证号:</div>
                    </td>
                    <td>
                        <input name="txt_Produce_No" type="text" id="txt_Produce_No" class="inw" value="${bean.produceNo}"  />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>

                    <td><div class="th_text">物资种类:</div>
                    </td>
                    <td>
                        <select name="ddl_MaterialType_Code" id="ddl_MaterialType_Code" disabled="disabled" class="aspNetDisabled">
							<option selected="selected" value="1">肥料</option>
							<option value="2">农药</option>
							<option value="9">其他</option>
						</select>
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td><div class="th_text">物资类别:</div>
                    </td>
                    <td>
                        <input name="txt_Category_ID" type="text" readonly="readonly" id="txt_Category_ID" class="inw" onfocus="CategoryHelper()" value="${materialCategoryBean.categoryName}" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
               
                <tr>
                    <td><div class="th_text">剂型:</div>
                    </td>
                    <td>
                    	<asia:select name="ddl_DoseType" dictId="material_doseType" nullOption="true" nullText="请选择" defaultValue="${bean.dosytype}" disabled="false"></asia:select>
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>

                    <td><div class="th_text">生产厂家:</div>
                    </td>
                    <td>
                        <input name="txt_ProducerName" type="text" id="txt_ProducerName" class="inw" value="${bean.producer}" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>

                    <td><div class="th_text">适用作物:</div>
                    </td>
                    <td>
                        <input name="txt_SuitableGoods" type="text" id="txt_SuitableGoods" class="inw" value="${bean.usablerange}" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td><div class="th_text">使用方法:</div>
                    </td>
                    <td>
                        <input name="txt_Notes" type="text" id="txt_Notes" class="inw" value="${bean.notes}"/>
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>

                    <td><div class="th_text">主要成分:</div>
                    </td>
                    <td>
                        <input name="txt_MainComponent" type="text" id="txt_MainComponent" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
				<tr>
					<td align="left">&nbsp;</td>
					<td>
						<label id="butt" class="butt">
							<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" /></label>
					</td>
					<td align="left" class="error_td">&nbsp;</td>
				</tr>
            </tbody>
        </table>
		</div>
        <input type="hidden" name="hf_Category_ID" id="hf_Category_ID" value="${bean.materialtypeCode}"/>
        <input type="hidden" name="hf_CoFarmerID" id="hf_CoFarmerID" />
        <input type="hidden" name="Type" id="Type" value="${Type}" />
    </form>
</body>
</html>
