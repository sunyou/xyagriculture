<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种苗申请</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/home.css?v=2015081410080444" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
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
                    goodvariantName: "required",
                    emergenceRate: { required: true, number: true, min: 0, max: 100 },
                    seedingAge: { required: true, number: true, min: 1 },
                    survivalRate: { required: true, number: true, min: 0, max: 100 },
                    txt_Goods_ID: "required",
                    origin: "required"
                },

                messages: {
                    goodvariantName: "请填写种苗名称",
                    emergenceRate: { required: "请填写出苗率", number: "请输入一个数字", min: "出苗率最小是0", max: "出苗率最大是100" },
                    seedingAge: { required: "请填写苗龄", number: "请输入一个数字", min: "苗龄最小是0" },
                    survivalRate: { required: "请填写成活率", number: "请输入一个数字", min: "成活率最小是0", max: "成活率最大是100" },
                    txt_Goods_ID: "请选择作物",
                    origin: "请填写产地"
                }
            });

        });
    </script>
</head>
<body>
    <div class="edit_panel">
        <form method="post" action="${ctx}/GoodVariety/GoodsVarietyApplyEdit.ajax" id="form1">

            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
              <c:if test="${!empty message}">
				<script>showTips('${message }');</script>
				</c:if>
                <tr>
                    <th width="80">种苗名称</th>
                    <td>
                        <input name="goodvariantName" type="text" id="txt_GoodVariant_Name" class="inw" />
                    </td>
               
                    <th width="80" >作物</th>
                    <td>
                        <input name="txt_Goods_ID" type="text" readonly="readonly" id="txt_Goods_ID" class="inw" />
                   		<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_Goods_ID,hf_Goods_ID', key: 'GOODS_NAME,GOODS_ID' }, '农作物--选择帮助界面', 660, 360);"/>
                    </td>
                </tr>
                <tr>
                    <th>品种审定证</th>
                    <td>
                        <input name="certificateId" type="text" id="txt_Certificate_ID" class="inw" />
                    </td>
             
                    <th>出苗率</th>
                    <td>
                        <input name="emergenceRate" type="text" id="txt_EmergenceRate" class="inw" style="width:50px;"  onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))" />%
                    </td>
                </tr>
                <tr>
                    <th>苗龄</th>
                    <td>
                        <input name="seedingAge" type="text" id="txt_seedingAge" class="inw" style="width:50px;"  onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))" />天
                    </td>
               
                    <th>成活率</th>
                    <td>
                        <input name="survivalRate" type="text" id="txt_SurvivalRate" class="inw" style="width:50px;"  onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))" />%
                    </td>
                </tr>
                <tr>
                    <th>检疫证</th>
                    <td>
                        <input name="pratique" type="text" id="txt_Pratique" class="inw" />
                    </td>
               
                    <th>经销商</th>
                    <td>
                          <input name="supplierId" type="hidden" id="txt_Apply_User" value="${supplierId }"/>
		                 ${supplierName }
                        
                    </td>
                </tr>
                <tr>
                    <th>生产商</th>
                    <td>
                        <input name="txt_Producer" type="text" id="txt_Producer" class="inw"  />
                    	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Base/Material/Producer_Helper.html', { id: 'txt_Producer,hf_Producer', key: 'PRODUCER_NAME,PRODUCER_ID' }, '生产商--选择帮助界面', 660, 360);"/>
                    </td>
               
                    <th>产地</th>
                    <td>
                        <input name="origin" type="text" id="txt_Origin" class="inw" />
                    </td>
                </tr>
               
                <tr>
                    <th>申请人</th>
                    <td>
                    ${operator }
                        <input name="applyUser" type="hidden" id="txt_Apply_User" value="${operator }" />
                    </td>
                
                    <th>申请时间</th>
                    <td>
                        <input name="applyDate" type="text" id="txt_Apply_Date" class="inw" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" style="width: 100px;" />
                    </td>
                </tr>
                 <tr>
                    <th>说明</th>
                    <td colspan="3">
                    	<textarea name="remark" id="txt_Remark" rows="3" cols="80"></textarea>
                    </td>
                </tr>
               
            </table>
             <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
            <input type="hidden" name="goodsId" id="hf_Goods_ID" />
            <input type="hidden" name="hf_Producer" id="hf_Producer" />
        </form>
    </div>
</body>
</html>
