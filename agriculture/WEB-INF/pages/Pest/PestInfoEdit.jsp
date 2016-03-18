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
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            aspnetForm.txt_GoodsType_ID.value = obj.name; //将对象的值赋给表单
            aspnetForm.GoodsType_ID.value = obj.no;
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
                    pestNo: "required",
                    pestName: "required"
                },

                messages: {
                	pestNo: "请填写病虫害编号",
                    pestName: "请填写病虫害名称"
                }
            });

        });
    </script>
</head>
<body>
<br>
    <form id="form1" action="${ctx}/Pest/PestInfoEdit.ajax" method="post">
        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th nowrap width='100px'>病虫害编号</th>
                <td>
                    <input name="pestNo" value="${pest.pestNo }" type="text" class="inw" ></input>
                </td>
                
            </tr>
            <tr>
                <th nowrap>病虫害种类</th>
                <td>
                    <asia:select name="pesttypeId" dictId="PEST_TYPE" nullOption="true" nullText="请选择" defaultValue="${pest.pesttypeId}"></asia:select>
                </td>
                
            </tr>
            <tr>
                <th nowrap>病虫害名称</th>
                <td>
                    <input name="pestName" value="${pest.pestName }" type="text" class="inw"></input>
                </td>
                
            </tr>
			 
        </table>
        
              
        <div align=center><br> <br> 
			   <input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn" />
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
        <input type="hidden" name="pestId" id="pestId" value="${pest.pestId}"/>
    </form>
</body>
</html>

