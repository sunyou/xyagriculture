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
            grid=$("#grid").createLigerGrid({
                header: [
					{ display: '申请编号', width:'300',name: 'MATERIALAPPLY_ID', render: function (rowdata, index, value) { 
						return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['MATERIALAPPLY_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['MATERIALAPPLY_ID'] +"</a>"; 
						} 
					},
                    { display: '申请日期', name: 'Apply_Date' },
                    { display: '申请类型', name: 'APPLY_TYPE' },                    
                    { display: '审核时间', name: 'Audit_Date' },
                    { display: '审核状态', name: 'AUDIT_RESULT' },
                    { display: '农资名称', name: 'Material_Name' },
                    { display: '单价', name: 'Price' },
                    { display: '农资经销商', name: 'Supplier_Name' ,width:'200',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showSupplierDetail('"+rowdata["SUPPLIER_ID"]+"');\">"+value+"</a>" ;
                        return html ;
                    }}
                ],
                param: { 'flag': 1 },
                editor: {
                    url: "${ctx}/Audit/SupplierMaterialAuditDet.html",
                    para: ["MATERIALAPPLY_ID"],
                    width: 600,
                    height: 380
                },
                leftBtns: {
                	show: false
                    /**
                    showDetail: {
                        url: "${ctx}/Audit/SupplierMaterialApplyDet.html"
                    },
                    showEdit: {
                        show: true,
                        url: "${ctx}/Audit/SupplierMaterialApplyEdit.html",
                        width:660,
                        height:360
                    },
                    showDelete: {
                        close: function () {
                            grid.reload();
                        },
                        show: false
                    }
                    **/
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "MATERIALAPPLY_ID",
                ajaxURL: "${ctx}/Audit/getSupplierMaterialApplyList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("ApplyType", $("#ddl_ApplyType").val());
                grid.setParm("AuditResult", $("#ddl_AuditResult") .val());
                grid.setParm("SupplierName", $("#txt_SupplierName").val());
                grid.setParm("MaterialName", $("#txt_MaterialName").val());
                grid.setParm("ApplyDate", $("#in_ApplyDate").val());
                grid.reload()
            }
            );
            
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '/agriculture/Audit/SupplierMaterialApplyAdd.html', '农资准入申请', function () {
                    grid.reload();
                });
            });

        });

        function showDetail(id, name){
        	ligerWin(660, 360,"${ctx}/Audit/SupplierMaterialApplyDet.html?id="+id,"查看农资 " + name + " 的申请详情");
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
					<div class="rtxt left">申请类型： </div>
					<div class="sert left">
						<asia:select name="ddl_ApplyType" styleClass="inw"  style="width:90px;" id="ddl_ApplyType" dictId="cofarmer_apply_type" nullOption="true" nullText="--请选择--"></asia:select>
					</div>
					<div class="rtxt left">审核状态：</div>
					<div class="sert left">
						<asia:select name="ddl_AuditResult" styleClass="inw"  style="width:90px;" id="ddl_AuditResult" dictId="cofarmer_audit_result" nullOption="true" nullText="--请选择--"></asia:select>
					</div>
					<div class="rtxt left">经销商：</div>
					<div class="sert left">
						<input name="txt_SupplierName" type="text" id="txt_SupplierName" class="inw" style="width:120px;"/>&nbsp; 
					</div>
					<div class="rtxt left">农资：</div>
					<div class="sert left">
						<input name="txt_MaterialName" type="text" id="txt_MaterialName"  class="inw" style="width:120px;"/>&nbsp; 
					</div>
					<div class="rtxt left">申请日期：</div>
					<div class="sert left">
						<input name="in_ApplyDate" type="text" id="in_ApplyDate" class="Wdate inw" 
							onclick="WdatePicker({ dateFmt: &#39;yyyy-MM-dd&#39; })" readonly="readonly" />  
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="申请" class="btn_tool_add" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="SearchResult"></div>
			<div id="grid"></div>
		</div>
	</div>
</body>
</html>

