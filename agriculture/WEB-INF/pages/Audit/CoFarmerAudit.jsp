<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
										<title>生产者审核</title>
			<link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
			<link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
			<link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
			<link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
			<script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
			<script type="text/javascript" 	src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
			<script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
			<script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
			<script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
			<script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
	<script type="text/javascript">
        var grid ;
        $(document).ready(function () {
             grid = $("#grid").createLigerGrid({
                header: [
                	{ display: '申请日期', name: 'APPLY_DATE', width:'100',type: 'date', format: 'yyyy-MM-dd'},
                    { display: '申请生产者名称', name: 'CoFarmer_Name', width:'250',render:showCoFarmerNameRender},
                    { display: '生产者法人', name: 'Legal_Represent' },
                    { display: '联系电话', name: 'Tel' },
                    { display: 'Email', name: 'Email' , width:'150'},
                    { display: '审核人', name: 'AuditName' },
                    { display: '审核状态', name: 'Audit_Result' ,render:
                        function(record, rowindex, value, column){
                            var r= record["AUDIT_RESULT"];
                            if(r=="1"){
                                return "<font color='black'>审核通过</font>";
                            }else if(r=="2"){
                                return "<font color='blue'>正在审核</font>";
                            }else 
                                return "<font color='red'>未通过</font>";
                        } }
                ],
                
                 addTools: function (record, rowindex, value, column) {
                    if (record["AUDIT_RESULT"]=="2") {
                        return "<a href='javascript:;' onclick=\"audit('" + record["APPLY_ID"] + "');\">批准</a>&nbsp&nbsp"+"<a href='javascript:;' onclick=\"ligerWin(415,180, '${ctx}/CoFarmerAudit/CoFarmerAuditReason.html?type=2&id=" + record["APPLY_ID"] + "', '填写驳回原因');\">驳回</a>";
                    }else{
                        return "已审核";

                    }
                },
                param: { 'flag': 1 ,'requestType':$("#requestType").val()},
				editor: {
                    width: 890,
                    height: 460
                },
                leftBtns: {
                    showDetail: false,
                    showEdit: {
                        url: "",
                        show:false
                    },
                    showDelete: {
                        show: false
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "APPLY_ID",
                ajaxURL: "${ctx}/CoFarmerAudit/GetCoFarmerAudit.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("ApplyType", $("#ddl_ApplyType").val());
                grid.setParm("AuditResult", $("#ddl_AuditResult").val());
                grid.setParm("CoFarmerName", $("#txt_CoFarmerName").val());
                grid.setParm("ApplyDate", $("#in_ApplyDate").val());
                grid.reload()
            });

        });
        
        function showCoFarmerNameRender(record, rowindex, value, column){
         	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCoFarmerDetail('" +record["APPLY_ID"]+"');\">"+value+"</a>";
            return html;
        }
        function showCoFarmerDetail(comFarmerId){
        	myopen("${ctx}/CoFarmerAudit/CoFarmerAuditDet.html?id="+comFarmerId,"申请生产者详细信息",800,500);
        }
        
        function audit(applyId){
        	if (confirm("确定批准吗？")) {
			 $.ajax({
				type : 'POST',
				url : "${ctx}/CoFarmerAudit/AuditCoFarmer.ajax",
				data : {"applyId" : applyId,"type": 1},
				success : function(msg) {
					//alert(msg.message);
					showTips(msg.message,'');
					grid.reload();
				}
			});
		}
        
        }
    </script>
</head>
<body>
		<div>
			申请类型：
			<asia:select id="ddl_ApplyType" name="ddl_ApplyType"
				dictId="cofarmer_apply_type" nullOption="true" nullText="--请选择--"
				defaultValue="${ddl_ApplyType}"></asia:select>

			审核状态：
			<asia:select id="ddl_AuditResult" name="ddl_AuditResult"
				dictId="cofarmer_audit_result" nullOption="true" nullText="--请选择--"
				defaultValue="${ddl_AuditResult}"></asia:select>
				
			</select> &nbsp; 生产者名称：<input name="txt_CoFarmerName" type="text"
				id="txt_CoFarmerName" /> 申请日期： <input name="in_ApplyDate"
				type="text" id="in_ApplyDate" class="Wdate inw"
				onclick="WdatePicker({ dateFmt: &#39;yyyy-MM-dd&#39; })"
				readonly="readonly" /> <input id="btn_Search" type="button"
				value="查询" class="btn_tool_search" />
			<div id="grid"></div>
		</div>
		<input type="hidden" name="__CurrentPage" id="__CurrentPage" value="1" />
		<input type="hidden" name="__PageCount" id="__PageCount" value="0" />
		<input type="hidden" name="requestType" id="requestType" value="${requestType}" />

</body>
</html>
