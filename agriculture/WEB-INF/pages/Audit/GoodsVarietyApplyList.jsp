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
    <script type="text/javascript"src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript"src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript"src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript"src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
        	$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#gv_SupplierGoodsVarietyApply").createLigerGrid({
                header: [
                	{ display: '申请编号', name: 'APPLYGOODSVARIETY_ID',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"+value+"');\">"+value+"</a>";
                       
                        return html ;
                    	}
                    },
                    
                    { display: '申请日期', name: 'Apply_Date',  type: 'date', format: 'yyyy-MM-dd'},
                    { display: '申请类型', name: 'Apply_Type__show'  ,render:
                        function(record, rowindex, value, column){
                            var r= record["APPLY_TYPE"];
                            if(r=="1"){
                                return "<font color='black'>申请注册</font>";
                            }else if(r=="2"){
                                return "<font color='blue'>变更名称</font>";
                            }else if(r=="3"){
                                return "<font color='blue'>变更属性</font>";
                            }else 
                                return "<font color='red'>申请注销</font>";
                        }},
                    { display: '审核时间', name: 'Audit_Date',  type: 'date', format: 'yyyy-MM-dd'},
                    { display: '审核状态', name: 'Audit_Result__show'  ,render:
                        function(record, rowindex, value, column){
                            var r= record["AUDIT_RESULT"];
                            if(r=="0"){
                                return "<font color='black'>未审核</font>";
                            }else if(r=="1"){
                                return "<font color='blue'>审核通过</font>";
                            }else 
                                return "<font color='red'>审核失败</font>";
                        }},
                    { display: '种苗名称', name: 'GoodVariant_Name' },
                    { display: '作物', name: 'Goods_Name' },
                   { display: '农资经销商', name: 'Supplier_Name' ,width:'200',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showSupplierDetail('"+rowdata["SUPPLIER_ID"]+"');\">"+value+"</a>" ;
                        return html ;
                    }},
                    { display: '产地', name: 'Origin' ,width:'200'}
                ],
                
                param: { 'flag': 1 },
                editor: {
                    url: "/Pages/Audit/SupGoodsVarietyAuditDet.aspx",
                    para: ["MaterialApply_ID"],
                    width: 800,
                    height: 350
                },
                leftBtns: {
                  show: false,
                    showDetail: {
                          show: false,
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
                keyID: "APPLYGOODSVARIETY_ID",
                ajaxURL: "${ctx}/GoodVariety/GetGoodsVarietyApply.ajax"
            });

            $("#btn_Search").click(function () {
             //   grid.setParm("applyType", $("#ddl_ApplyType").val());
                grid.setParm("auditResult", $("#ddl_AuditResult").val());
                grid.setParm("goodvariantName", $("#txt_GoodVariant_Name").val());
                grid.setParm("goodsName", $("#txt_Goods_Name").val());
                grid.setParm("applyDate", $("#in_ApplyDate").val());
                grid.reload()
            }
            );
            
             $("#btn_Add").click(function () {
                ligerWin(660, 400, '${ctx}/GoodVariety/SupGoodsVarietyApply.html', '申请', function () {
                    grid.reload();
                });
            });
        });
        
         function detail(id){
        	myopen("${ctx}/GoodVariety/SupGoodsVarietyAuditDet.html?type=3&id="+id,"查看种苗申请详情"  ,660,360);
        }
        
         function showSupplierDetail(supplierId){
			parent.f_addTab(supplierId, '经销商详情', '${ctx}/Base/Material/SupplierDet.html?deptId='+supplierId);		
        }
    </script>
</head>
<body>

<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">审核状态：</div>
					<div class="sert left">
						<select name="ddl_AuditResult" id="ddl_AuditResult">
							<option value="">--请选择--</option>
							<option value="1">通过</option>
							<option value="0">正在审核</option>
							<option value="2">未通过</option>
						</select>
					</div>
					<div class="rtxt left">农作物：</div>
					<div class="sert left">
						<input name="txt_Goods_Name" type="text" id="txt_Goods_Name" />
					</div>
					<div class="rtxt left"> 种苗：</div>
					<div class="sert left">
						<input name="txt_GoodVariant_Name" type="text" id="txt_GoodVariant_Name" />
					</div>
					
					<div class="rtxt left">申请日期：</div>
					<div class="sert left">
						<input name="in_ApplyDate" type="text" id="in_ApplyDate" class="Wdate" onclick="WdatePicker({ dateFmt: yyyy-MM-dd })" readonly="readonly" />
					</div>
					<div class="serb left">
						  <input id="btn_Search" type="button" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
					    <input id="btn_Add" type="button" value="申请" class="btn_tool_add" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_SupplierGoodsVarietyApply"></div>
		</div>
	</div>
<!--  
     <form method="post" action="SupGoodsVarietyAudit.aspx" id="form1">

        <div style="margin-left: 20px">
            <div>
            申请类型：<select name="ddl_ApplyType" id="ddl_ApplyType">
	<option value="">--请选择--</option>
	<option value="1">申请注册</option>
	<option value="2">变更名称</option>
	<option value="3">变更属性</option>
	<option value="4">申请注销</option>

</select>
            审核状态：<select name="ddl_AuditResult" id="ddl_AuditResult">
	<option value="">--请选择--</option>
	<option value="1">通过</option>
	<option value="0">正在审核</option>
	<option value="2">未通过</option>

</select>
            作物：<input name="txt_Goods_Name" type="text" id="txt_Goods_Name" />&nbsp;
            种苗：<input name="txt_GoodVariant_Name" type="text" id="txt_GoodVariant_Name" />&nbsp;
            申请日期：<input name="in_ApplyDate" type="text" id="in_ApplyDate" class="Wdate inw" onclick="WdatePicker({ dateFmt: yyyy-MM-dd })" readonly="readonly" />
            <input id="btn_Search" type="button" value="查询" class="btn_tool_search" />
            <input id="btn_Add" type="button" value="申请" class="btn_tool_add" />
            </div>
            <div id="gv_SupplierGoodsVarietyApply"></div>
        </div>
    </form>
    
    -->
</body>
</html>
