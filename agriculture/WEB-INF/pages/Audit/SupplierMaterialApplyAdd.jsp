<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农资申请</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/home.css?v=2015081410080444" />
    <link href="${ctx}/content/js/fancyBox/jquery.fancybox.css?v=2015081410080444" rel="stylesheet" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/fancyBox/jquery.fancybox.js?v=2015081410080444"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    
    
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        function CategoryHelper() {
            var code = $("#ddl_MaterialType_Code").val();
            openHelper('${ctx}/Base/Material/MaterialCategory.html?code=' + code, { id: 'txt_Category_ID,hf_Category_ID', key: 'CATEGORY_NAME,CATEGORY_ID' }, '农用物资类别--选择帮助界面', 660, 360);
        }

        var _imgs = _imgs || [];
        var k = 1;
        function loadUpimg(f) {
            var lodimg=f.split(','),_imglist_html = [];
            $.each(lodimg, function (i,im) {
                _imgs.push(im);
                _imglist_html.push("<div class=\"pre_img_item\" id=\"img_item_" + k + "\"><a href=\"javascript:;\" class=\"remove_pic\" onclick=\"rem_pc(" + k + ")\"><img src=\"/images/dele12x12.png\" border=\"none\" /></a><a class=\"fancybox\" href=\"" + im + "\" data-fancybox-group=\"gallery\" title=\"\"><img id=\"item_img_" + k + "\" src='" + im + "' style='width:37px;height:49px;margin:5px auto 0px auto;' /></a></div>");
                k++;
            });
            $('#pic_prvew').append(_imglist_html.join(''));
            $('.fancybox').fancybox();
            $('#field_imgage').val(_imgs.join(','));
            //$('#upload').hide();
        }
        function rem_pc(n) {
            if (_imgs==undefined) {
                _imgs=$("#field_imgage").val().split(',');
            }
            var _src = $('#item_img_' + n).attr('src');
            $.each(_imgs, function (i, im) {
                if (im == _src) {
                    _imgs.splice(i, 1);
                    return false;
                }
            });
            $("#field_imgage").val(_imgs.join(','));
            $('#img_item_' + n).remove();
            return false;
        }

        $(document).ready(function () {

            $("#form1").validate({
                //debug: true,
                onfocusout: false,
                showErrors: function (errorMap, errorList) {
                    var msg = "";
                    $.each(errorList, function (i, v) {
                        msg += (v.message + "\r\n");
                    });
                    if (msg != "") alert(msg);
                },
                errorPlacement: function (error, element) {
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                    txt_Material_Name: "required",
                    txt_CommonName: "required",
                    txt_Specification: "required",
                    txt_Produce_No: "required",
                    txt_Category_ID: "required",
                    txt_UsableRange: "required",
                    txt_CompositeDays: { required: true, number: true, min: 1 },
                    ddl_DoseType: { min: 1 }
                },

                messages: {
                    txt_Material_Name: "请填写物资名称",
                    txt_CommonName: "请填写通用名",
                    txt_Specification: "请填写规格",
                    txt_Produce_No: "请填写登记证号",
                    txt_Category_ID: "请选择物资类别",
                    txt_UsableRange: "请填写防治对象",
                    txt_CompositeDays: { required: "请填写分解天数", number: "请输入一个数字", min: "最少有1天吧，亲！" },
                    ddl_DoseType: { min: "请选择剂型" }
                }
            });

        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Audit/SupplierMaterialApplyAdd.html');</script>
	</c:if>
    <form method="post" action="${ctx}/Audit/SupplierMaterialApplySave.html" id="form1">
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
	            <tr>
	                <td><div class="th_text">物资通用名</div></td>
	                <td>
	                   <input name="txt_CommonName" value="${bean.commonname}" type="text" id="txt_CommonName" class="inw" />
	                </td>
	                <td><div class="th_text">物资种类</div></td>
	                <td>
	                    <asia:select name="ddl_MaterialType_Code" styleClass="inw" id="ddl_MaterialType_Code" dictId="MaterialType_Code"></asia:select>
	                </td>
	            </tr>
	            <tr>
	                <td><div class="th_text">物资商品名</div></td>
	                <td>
						<input name="txt_Material_Name" type="text" value="${bean.materialName}" id="txt_Material_Name" class="inw" />
					</td>
	                <td><div class="th_text">登记证号</div></td>
	                <td>
	                	<input name="txt_Produce_No" value="${bean.produceNo}" type="text" id="txt_Produce_No" class="inw" />
	                </td>
	            </tr>
	            <tr>
	                <td><div class="th_text">物资类别</div></td>
	                <td>
						<input name="txt_Category_ID" type="text" value="${materialCategoryBean.categoryName}" readonly="readonly" id="txt_Category_ID" class="inw" />
						<input type=button class='rowSelectButton' value='选择' onclick="CategoryHelper()"/>
					</td>
	                <td><div class="th_text">单价</div></td>
	                <td>
						<input name="txt_Price" type="text" id="txt_Price" value="${bean.price}" class="inw" />
					</td>
				</tr>
				<tr>
	                <td><div class="th_text">剂型</div></td>
	                <td>
	                	<asia:select name="ddl_DoseType" dictId="material_doseType" styleClass="inw"></asia:select>
	                </td>
	                <td><div class="th_text">分解天数</div></td>
	                <td>
						<input name="txt_CompositeDays" type="text" id="txt_CompositeDays" value="${bean.compositedays}" class="inw" style="width:80px;" />天
					</td>
	            </tr>
	            <tr>
	                <td><div class="th_text">规格</div></td>
	                <td>
	                	<input name="txt_Specification" type="text" id="txt_Specification" value="${bean.specification}" class="inw" />
	                </td>
	                <td><div class="th_text">经销商</div></td>
	                <td>
						<input name="txt_Supplier_ID" type="text" value="${supplierName }" readonly="readonly" id="txt_Supplier_ID" class="inw" />
					</td>
	            </tr>
	            <tr>
	                <td><div class="th_text">生产商</div></td>
	                <td>
	                	<input name="txt_Producer" readonly="readonly" type="text" value="${producerName}" id="txt_Producer" class="inw"/>
	                	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Base/Material/Producer_Helper.html', { id: 'txt_Producer,hf_Producer', key: 'PRODUCER_NAME,PRODUCER_ID' }, '生产商--选择帮助界面', 660, 360);"/>
	                </td>
	                <td><div class="th_text">有效成分</div></td>
	                <td>
						<input name="txt_MainComponent" type="text" id="txt_MainComponent" value="${bean.maincomponent}" class="inw" />
					</td>
	            </tr>
	            <tr>
	                <td><div class="th_text">适用作物</div></td>
	                <td>
	                	<input name="txt_SuitableGoods" type="text" id="txt_SuitableGoods" value="${bean.suitablegoods}" class="inw" />
	                </td>
	                <td><div class="th_text">申请人</div></td>
	                <td>
						<input name="txt_Apply_User" type="text" readonly="readonly" id="txt_Apply_User" class="inw" value="${operator }"/>
					</td>
	            </tr>
	            <tr>
	                <td><div class="th_text">物资描述</div></td>
	                <td>
	                	<input name="txt_DetailDesc" type="text" id="txt_DetailDesc" value="${bean.detaildesc}" class="inw" />
	                </td>
	                <td><div class="th_text">备注</div></td>
	                <td>
						<input name="txt_Notes" type="text" id="txt_Notes" value="${bean.notes}" class="inw" />
					</td>
	            </tr>
			</table>
			<div align=center><br><br>
				<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
				<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
		<input type="hidden" name="hf_Supplier_ID" id="hf_Supplier_ID" value="${supplierId }" />
        <input type="hidden" name="hf_Category_ID" id="hf_Category_ID" value="${bean.categoryId}"/>
        <input type="hidden" name="hf_Producer" id="hf_Producer" value="${bean.producer}"/>
	</form>
<br/>
<br/>
</body>
</html>
