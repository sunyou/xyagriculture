<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>





<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农作物编辑/新增</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
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
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                    txt_GoodsSTD_No: "required",
                    txt_Goods_Name: "required",
                    txt_GoodsType_ID: "required",
                    txt_Unit: "required"
                },
                messages: {
                    txt_GoodsSTD_No: "请填写作物编号",
                    txt_Goods_Name: "请填写作物名称",
                    txt_GoodsType_ID: "请选择类别",
                    txt_Unit: "请填写计量单位"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/Goods/GoodsEdit.html?Type=1" id="form1">
<div class="aspNetHidden">
 
 <input type="hidden" name="goods_id" id="__goods_id" value="${bean.goodsId}" />
</div>

 
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="100" nowrap>作物编号:</th>
                    <td>
                   
                 <input name="txt_GoodsSTD_No" type="text" value="<c:if test="${empty bean}">自动生成</c:if><c:if test="${!empty bean}">${bean.goodsstdNo}</c:if>" id="txt_GoodsSTD_No" disabled="disabled" class="inw" />
                 
                      
                    </td>
                    
               
                    <th width="100" nowrap> 作物名称: </th>
                    <td>
                        <input name="txt_Goods_Name" type="text" id="txt_Goods_Name" class="inw" value="${bean.goodsName}"/>
                    </td>
                    
                </tr>
                <tr>
                    <th>通用名:</th>
                    <td>
                        <input name="txt_CommonName" type="text" id="txt_CommonName" class="inw" value="${bean.commonname}" />

                    </td>
                    
               
                    <th>农作物类别:</th>
                    <td>
                        <input name="txt_GoodsType_Name" readonly type="text" id="txt_GoodsType_Name" value="${bean.goodstypeName}" class="inw" />
                         <input type=button value='选择' class='rowSelectButton' onfocus="openHelper(&#39;${ctx}/GoodsType/GoodsType_Helper.html&#39;, { id: &#39;txt_GoodsType_Name,GoodsType_ID&#39;, key: &#39;GOODSTYPE_NAME,GOODSTYPE_ID&#39; }, &#39;请选择一条农作物类别&#39;, 660, 400);">
                    </td>
                    
                </tr>
                
                <tr>
                    <th>
                        <div class="th_text">说明:</div>
                    </th>
                    <td colspan="3">
                        <textarea name="txt_Remark" rows="15" cols="50" id="txt_Remark"  style="width:550px;">${bean.remark}
</textarea>
                    </td>
                    
                </tr>
                
            </table>
            
             <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        </div>
        <input type="hidden" name="GoodsType_ID" id="GoodsType_ID"  value="${bean.goodstypeId}"/>
        <input type="hidden" name="Goods_ID" id="Goods_ID" value="${bean.goodsId}"/>
       <input type="hidden" name="txt_GoodsSTD_No_L" id="txt_GoodsSTD_No_L" value="${bean.goodsstdNo}"/>
    </form>
</body>
</html>


