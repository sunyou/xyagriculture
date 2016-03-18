<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>作物病虫害--编辑/新增</title>
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
                	goodpestName: {
                        required: true
                        /*,
                        remote: {
                            url: "/Pages/Handler/CheckExistHander.ashx",
                            type: "get",
                            dataType: "html",
                            data: {
                                 flag: "PestName"
                            },
                            dataFilter: function (data, type) {
                                if (data == "yes")
                                    return false;
                                else
                                    return true;
                            }
                        }*/
                    },
                    goodsName: "required",
                    pestName: "required",
                    pestdescr: "required"
                },

                messages: {
                	goodpestName: {
                        required: "请填写作物病虫害名称"/*,
                        remote: "作物病虫害名称已经存在！！"*/
                    },
                    goodsName: "请选择作物名称",
                    pestName: "请选择防治对象",
                    pestdescr: "请填写病虫害说明"
                }
                ,submitHandler : function(form) {
        			var url = form.action;
        			doSubmit(url);
        		}
            });

        });
        
        function doSubmit(url){
        	var bean = {
        			pestId:$("input[name='pestId']").val(),
        			goodsId:$("input[name='goodsId']").val(),
        			goodspestId:$("input[name='goodspestId']").val(),
        	    	goodpestName:$("input[name='goodpestName']").val(),
        	    	goodsName:$("input[name='goodsName']").val(),
        	    	pestName:$("input[name='pestName']").val(),
        	    	pestdescr:$("textarea[name='pestdescr']").val()
        	    };
        	$.ajax({
        	    url: url,
        	    type: 'post',
        	    dataType: 'json',
        	    data: {
        	    	"json":JSON.stringify(bean)
        	    },
        	    success: function(data){
        	    	if(data.success){
        	    		showTips(data.message);
	                    window.location.href = '${ctx}/Pest/GoodsPestDet.html?id=' + data.goodPestId;
        	    	}
        	    },
        	    error:function(result){
        	    	alert(result.message);
        	  	}
        	 });
        }
    </script>
</head>
<body>
    <form id="form1" action="${ctx}/Pest/v2/GoodsPestEdit.ajax" method="post">
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td nowrap="nowrap">作物病虫害名称</td>
                <td>
                    <input name="goodpestName" type="text" value="${goodsPest.goodpestName}"></input>
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap">作物名称</td>
                <td>
                    <input name="goodsName" value="${goodsPest.goodsName}" type="text" readonly="readonly" class="inw input_select" ></input>
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_Goods_Name,goodsId', key: 'GOODS_NAME,GOODS_ID' }, '请选择一条农作物信息', 660, 400);"/>
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap">防治对象</td>
                <td>
                    <input name="pestName" value="${goodsPest.pestName}" type="text" readonly="readonly" class="inw input_select" ></input>
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Pest/Helper/Pest_Helper.html', { id: 'txt_Pest_Name,pestId', key: 'PEST_NAME,PEST_ID' }, '请选择一条病虫害信息', 660, 400);">
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap">病虫害说明</td>
                <td>
					<textarea name="pestdescr" rows="15" cols="80">${goodsPest.pestdescr}</textarea>
                </td>
            </tr> 
        </table>
        
        <div align=center><br> 
			   <input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn" /></label>
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
			
		</div>
        <input type="hidden" name="pestId" id="pestId" value="${goodsPest.pestId}"/>
        <input type="hidden" name="goodsId" id="goodsId" value="${goodsPest.goodsId}" />
        <input type="hidden" name="goodspestId" id="goodspestId" value="${goodsPest.goodspestId}" />
    </form>
</body>
</html>