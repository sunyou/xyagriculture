<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>经销商审核列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            grid = $("#gv_Supplier").createLigerGrid({
                header: [
                    { display: '申请日期', name: 'Apply_Date' },
                    { display: '申请类型', name: 'Apply_Type__show' },
                    { display: '审核人', name: 'User_Name2' },
                    { display: '审核时间', name: 'Audit_Date' },
                    { display: '审核状态', name: 'Audit_Result__show' },
                    { display: '经销商名称', name: 'Supplier_Name' },
                    { display: '注册资金(万元)', name: 'Reg_Capital' },
                    { display: '法定代表人', name: 'Legal_Represent' },
                    { display: '联系人', name: 'Contact' },
                    { display: '联系方式', name: 'Tel' }
                ],
                param: { 'flag': 1 },
                editor: {
                    url: "/Pages/Audit/SupplierAuditDet.aspx",
                    para: ["Apply_ID"],
                    width: 740,
                    height: 630
                },
                leftBtns: {
                    showDetail: {
                        url: "/Pages/Audit/SupplierAuditDet.aspx",
                        height: 300
                    },
                    showEdit: {
                        show: false,
                    },
                    showDelete: {
                        close: function () {
                            grid.reload();
                        },
                        show: false
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "Apply_ID",
                ajaxURL: "/SupplierAudit/GetSupplierAudit"
            });

            $("#btn_Search").click(function () {
                grid.setParm("ApplyType", $("#ddl_ApplyType").val());
                grid.setParm("AuditResult", $("#ddl_AuditResult") .val());
                grid.setParm("SupplierName", $("#txt_SupplierName").val());
                grid.setParm("ApplyDate", $("#in_ApplyDate").val());
                grid.reload()
            }
            );
        });
    </script>
</head>
<body>
     <form method="post" action="SupplierAudit.aspx" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMjI4OTk5MTYxZGTfqKZ2R3z6x7WoI1AnGkKRdju4gShPjMwfgkrcFu6hjQ==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWDAKPqKqaCQK1k6ylAQKqk6ylAQKrk6ylAQKok6ylAQKpk6ylAQLj3YjHDQL83YjHDQL93YjHDQL+3YjHDQLtxeywAgL5ntFSjC+pXSlY+UGa2vCWUYsU2bWuvepMcrI1HWGtCvYYh7w=" />
</div>
        <div style="margin-left: 20px">
            <div>
            申请类型：<select name="ddl_ApplyType" id="ddl_ApplyType">
	<option value="0">--请选择--</option>
	<option value="1">申请注册</option>
	<option value="2">变更名称</option>
	<option value="3">变更属性</option>
	<option value="4">申请注销</option>

</select>
            审核状态：<select name="ddl_AuditResult" id="ddl_AuditResult">
	<option value="0">--请选择--</option>
	<option value="1">通过</option>
	<option value="2">正在审核</option>
	<option value="3">未通过</option>

</select>
            经销商：<input name="txt_SupplierName" type="text" id="txt_SupplierName" />&nbsp;
            申请日期：    
            <input name="in_ApplyDate" type="text" id="in_ApplyDate" class="Wdate inw" onclick="WdatePicker({ dateFmt: yyyy-MM-dd })" readonly="readonly" />
            <input id="btn_Search" type="button" value="查询" class="btn_tool_search" />
            </div>
            <div id="gv_Supplier"></div>
        </div>
    </form>
</body>
</html>
