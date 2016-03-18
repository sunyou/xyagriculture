<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植标准新增/编辑</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link href="${ctx}/content/css/FileUpload.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script src="${ctx}/content/js/FileLoad/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/FileLoad/fileload.js"></script>
    <script src="${ctx}/content/js/FileLoad/jquery.form.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            createHtml($("#str"));
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
                	critereriadocNo: "required",
                	criteriadocName: "required",
                	goodsNames: "required",
                    txt_DocFileName: "required"
                },

                messages: {
                	critereriadocNo: "请输入标准编号",
                	criteriadocName: "请输入标准",
                	goodsNames: "请选择作物",
                    txt_DocFileName: "请输入文件名称"
                }
            });
        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/Plant/CriteriaEdit.ajax" id="form1">
       <input type="hidden" id="docType" name="docType" value="${docType }"/> 
       <input type="hidden" id="criteriadocId" name="criteriadocId" value="${bean.criteriadocId }"/> 
       <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
             
            <tr>
                <th>
                    <div class="th_text">种植规范名称:</div>
                </th>
                <td>
                    <input name="critereriadocName" type="text" id="txt_CritereriaDoc_Name" value="${bean.critereriadocName }" class="inw" />
                </td>
                <th>
                    <div class="th_text">农作物:</div>
                </th>
                <td>
                    <input name="goodsNames" type="text" id="txt_Goods_Names" value="${bean.goodsNames }" class="inw"  readonly="readonly"/>
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_Goods_Names,hf_Goods_ID', key: 'GOODS_NAME,GOODS_NAME'}, '请选择一条农作物信息', 660, 400);"/>
                </td>
                
            </tr>
            <tr>
                <th>
                    <div class="th_text">种植方式:</div>
                </th>
                <td>
					<asia:select name="criteriaLevel" dictId="std_criteriaLevel" nullOption="true" nullText="请选择" defaultValue="${bean.criteriaLevel}"></asia:select>
                </td>

                <th>
                    <div class="th_text">标准类型:</div>
                </th>
                <td>
					<asia:select name="criteriatype" dictId="std_criteriaType" nullOption="true" nullText="请选择" defaultValue="${bean.criteriatype}"></asia:select>
                </td>
            </tr>
            <tr>
            	<th>
                    <div class="th_text">规范编号:</div>
                </th>
                <td>
                    <input name="critereriadocNo" type="text" id="txt_CritereriaDoc_No" value="${bean.critereriadocNo }" class="inw" />
                </td>
                <th>
                    <div class="th_text">文件名称:</div>
                </th>
                <td>
                     <div id="str" data-filename="txt_FilePath"> </div>
                </td> 
            </tr>

            <tr>
                <th>
                    <div class="th_text">制定人:</div>
                </th>
                <td>
                	<c:choose>
                		<c:when test="${not empty bean.criteriaMaker }">
		                    <input name="criteriaMaker" type="text" id="txt_Criteria_Maker" value="${bean.criteriaMaker }" disabled="disabled" class="inw" />
                		</c:when>
                		<c:otherwise>
		                    <input name="criteriaMaker" type="text" id="txt_Criteria_Maker" class="inw" />
                		</c:otherwise>
                	</c:choose>
                </td>
                <th>
                    <div class="th_text">版本号:</div>
                </th>
                <td>
                    <input name="version" type="text" id="txt_Version" class="inw" value="${bean.version }"/></td>
                
            </tr> 
            <tr>
            	<td colspan="4" style="text-align:center;">
            		<input type="submit" name="btn_SaveData" value="保存" id="btn_SaveData" class="xybtn" />
			  		<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
            	</td>
            </tr>
        </table>
			
		</div>
        <input type="hidden" name="HF_Path" id="HF_Path" />
    </form>
</body>
</html>
