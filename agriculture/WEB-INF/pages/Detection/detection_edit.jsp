<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农产品检测新增/修改</title>
    <%@ include file="/common/include.jsp"%>
    <style type="text/css">
	select{width:158px}
    </style>
    <script type="text/javascript" src="${ctx}/content/js/jquery.fileupload.js"></script>
	
    <script type="text/javascript">
        $(document).ready(function () {
            $("#saveForm").validate({
                //debug: true,
				 onfocusout : false,
				 showErrors : function(errorMap, errorList) {
				   	var msg = "";  
				 	$.each(errorList, function(i, v) { 
				  		msg += (v.message + "\r\n");   
				  	});
				  	if (msg != "")  alert(msg);   
				}, 
                errorPlacement: function (error, element) {
                    //".AreaList"
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                    detectionDate: "required",
                    txt_DetectDept_ID: "required",
                    txt_CoFarmerName: "required",
                    txt_Harvest_UID: "required",
                    detector: "required",
                    amount: { required: true, number: true },
                    typeId: { min: 1 },
                    accroding: { min: 1 },
                    method: { min: 1 }
                },

                messages: {
                    detectionDate: "请选择检测日期",
                    txt_DetectDept_ID: "请选择检测部门",
                    txt_CoFarmerName: "请选择生产者",
                    txt_Harvest_UID: "请选择采收",
                    detector: "请填检测人",
                    amount: { required: "请填写抽检数" },
                    typeId: { min: "请选择检测类型" },
                    accroding: { min: "请选择检测依据" },
                    method: { min: "请选择检测方式" }
                },
                submitHandler : function() {
					ajaxSubmitForm($('#saveForm'), ajaxSubmitFormDefCallback);
				}
            });
            
	
            $('#fileUpload1').fileupload({
            	module:'detection',
            	filePathId:'docfilepath',
            	validTypes:'jpg,jpeg,gif,bmp,png'
            });
        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/Detection/saveDetection.ajax" id="saveForm" >
       <div class="edit_panel">
			<table class="edit_table" width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="80">检测日期</th>
                    <td>
                        <input name="detectionDate" type="text" id="txt_Detection_Date" class="Wdate" 
                        		onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" value="<fmt:formatDate value="${bean.detectionDate}" pattern="yyyy-MM-dd" />" /></td>
                    <th>检测人</th>
                    <td colspan="3">
                        <input name="detector" type="text" class="inw" id="txt_Detector" value="${bean.detector}"  /></td>
                    
                </tr>
                <tr>
                    <th>检测部门</th>
                    <td>
                        <input name=txt_DetectDept_ID value="${bean.deptName}" type="text" class="inw" readonly="readonly" id="txt_DetectDept_ID" />
                        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/DetectDept_Helper.html', { id: 'txt_DetectDept_ID,hf_DetectDept_ID', key: 'DEPT_NAME,DEPT_ID' }, '检测部门--选择帮助界面', 380, 400)"/>
                    </td>
                    
                    <th>采收</th>
                    <td>
                        <input name="txt_Harvest_UID" value="${bean.plotharvestNo}"  type="text" class="inw" readonly="readonly" id="txt_Harvest_UID"  />
                        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html', { id: 'txt_Harvest_UID,hf_Harvest_UID,hf_PlantLot_ID', key: 'PLOTHARVEST_NO,PLOTOPER_ID,PLANTLOT_ID' }, '采收--选择帮助界面', 800, 400)"/>
                    </td>
                </tr>
                <tr>
                    
                    <th>抽检数</th>
                    <td>
                        <input name="amount" type="text" class="inw" id="txt_Amount"  value="${bean.amount}"/></td>
                    
                    <th>检测类型</th>
                    <td>
                    	<asia:select id="ddl_Type_ID" name="typeId" 
							dictId="detection_type" nullOption="false" nullText="请选择"
							defaultValue="${bean.typeId}"></asia:select>
                    </td>
                </tr>
                <tr>
                    
                    <th>检测依据</th>
                    <td>
                    	<asia:select id="ddl_Accroding" name="accroding"
							dictId="detection_accroding" nullOption="false" nullText="请选择"
							defaultValue="${bean.accroding}"></asia:select>
                    </td>
                    
                    <th>检测方式</th>
                    <td>
                    	<asia:select id="ddl_Method" name="method"
							dictId="detection_method" nullOption="false" nullText="请选择"
							defaultValue="${bean.method}"></asia:select>
                    </td>
                    
                </tr>
                <tr>
                    <th>检测结果</th>
                    <td>
                    	<asia:select id="ddl_Result" name="result"
							dictId="detection_result" nullOption="false" nullText="请选择"
							defaultValue="${bean.result}"></asia:select>
                    </td>
                    <th></th>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th>文件名称</th>
                    <td colspan="4">
                        <div id="fileUpload1"></div>
                    </td>
                </tr>
            </table>
        </div>
        <div align=center style="margin: 20 0 10 0">
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
        <input type="hidden" name="docfilepath" id="docfilepath" value="${bean.docfilepath}"/>
        
        <input type="hidden" name="detectionUid" value="${bean.detectionUid}"/>
        <input type="hidden" name="deptId" id="hf_DetectDept_ID" value="${bean.deptId}"/>
        <input type="hidden" name="cofarmerId" id="cofarmerId" value="${bean.cofarmerId}" />
        <input type="hidden" name="harvestUid" id="hf_Harvest_UID" value="${bean.harvestUid}"/>
        <input type="hidden" name="plantlotId" id="hf_PlantLot_ID" value="${bean.plantlotId}"/>
        <div id="divMsg" style="display: none;" name="divMsg"></div>
        
    </form>
</body>
</html>
