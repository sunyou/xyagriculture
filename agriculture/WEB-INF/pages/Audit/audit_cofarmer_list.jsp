<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>生产者审核</title>
    <%@ include file="/common/include.jsp"%>
    
    <script type="text/javascript">
    	var grid = null;
        $(document).ready(function () {
            grid = $("#grid").createLigerGrid({
                header: [
					{ display: '申请日期', name: 'APPLY_DATE', width:'100',type: 'date'},
                    { display: '生产者名称', name: 'COFARMER_NAME' ,render: renderDetail},
                    { display: '申请类型', name: 'APPLY_TYPE',render:
                        function(record, rowindex, value, column){
                        var r= record["APPLY_TYPE"];
                        if(r=="1"){
                            return "<font color='black'>申请注册</font>";
                        }
                        else if(r=="2"){
                            return "<font color='blue'>变更名称</font>";
                        }
                        else if(r=="3"){
                            return "<font color='blue'>变更属性</font>";
                        }
                        else{
                            return "<font color='red'>申请注销</font>";
                        }
                    } },
                    { display: '生产者法人', name: 'LEGAL_REPRESENT' },
                    { display: '联系电话', name: 'TEL' },
                    { display: 'Email', name: 'EMAIL', width:'150' },
                    { display: '审核人', name: 'AUDITNAME' },
                    { display: '审核状态', name: 'AUDIT_RESULT' ,render:
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
                    	var html = '<input type="button" value="批准" onclick="auditPass(\''+record["APPLY_ID"]+'\')" class="rowDetailButton">';
                    	html += '<input type="button" value="驳回" onclick="auditUnpass(\''+record["APPLY_ID"]+'\')" class="rowDeleteButton" style="margin-left:5px">';
                        return html;
                    }else{
                        return "已审核";

                    }
                },
                param: { 'flag': 1 },
				editor: {
                    width: 890,
                    height: 460
                },
                leftBtns: {
                    showDetail: {
                    	show:false
                    },
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
                ajaxURL: "getAuditCofarmerList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("applyType", $("#ddl_ApplyType").val());
                grid.setParm("auditResult", $("#ddl_AuditResult").val());
                grid.setParm("coFarmerName", $("#txt_CoFarmerName").val());
                grid.setParm("applyDate", $("#in_ApplyDate").val());
                grid.reload()
            });

        });
        
        function renderDetail(rowdata,index,value){
            var html = '<a href="javascript:showDetail(\'#id\',\'#name\');" class="ligerBtnDetail" >#name</a>';
            html = html.replace('#id',rowdata["APPLY_ID"]);
            html = html.replaceAll('#name',value);
            return html;
       } 
       function showDetail(id ,name){
       	myopen("${ctx}/Audit/audit_cofarmer_detail.html?id="+id,"申请生产者详细信息" ,800, 400);
       }
       function auditPass(_id){
    	   ajaxConfirmOperation('确定批准',  '${ctx}/Audit/auditCoFarmerPass.ajax',{id:_id});
       }
       function auditUnpass(id){
    	   openDialogInIframe(openWinWidthDef, openWinHeightDef, '${ctx}/Audit/audit_cofarmer_unpass.html?id='+id, '生产者申请驳回', null, grid);
       }
       
    </script>
</head>
<body>
    <form method="post" action="CoFarmerAudit.aspx" id="form1">
    <div>
        申请类型：
			<asia:select id="ddl_ApplyType" name="applyType"
				dictId="cofarmer_apply_type" nullOption="true" nullText="--请选择--"
				defaultValue="${ddl_ApplyType}"></asia:select>

			审核状态：
			<asia:select id="ddl_AuditResult" name="auditResult"
				dictId="cofarmer_audit_result" nullOption="true" nullText="--请选择--"
				defaultValue="${ddl_AuditResult}"></asia:select>
				
        生产者名称：<input name="txt_CoFarmerName" type="text" id="txt_CoFarmerName" />
        申请日期：
        <input name="applyDate" type="text" id="in_ApplyDate" class="Wdate inw" onclick="WdatePicker({ dateFmt: &#39;yyyy-MM-dd&#39; })" readonly="readonly" />
        <input id="btn_Search" type="button" value="查询" class="btn_tool_search" />
        <div id="grid"></div>
    </div>
    </form>
</body>
</html>
