<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>经销商列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
       
		var grid =null;
		$(document).ready(function () {
		    $("#btn_Add").hide();
			$('#layout').ligerLayout({ topHeight: 30 });
             grid = $("#grid").createLigerGrid({
                header: [
                    { display: '编号', name: 'Supplier_No' },
                    { display: '经销商', name: 'Supplier_Name', width: '200' ,render:showDetail },
                    { display: '地址', name: 'Supplier_Address', width: '300' },
                    { display: '联系人', name: 'Contact' },
                    { display: '电话', name: 'Tel', width: '120' },
                    { display: '邮箱', name: 'Email', width: '150' }
                ],
                param: { 'flag': 1 },
				editor: {
                    width: 450,
                    height: 460
                },
				leftBtns: {
				  show:false,
				    showDelete: {
				        show:false,
                        close: function () {
                            grid.reload();
                        }
					},					
				    showDetail: {
				        show:false,
                        url: "SupplierDet.aspx",
                        width: 620,
                        height:600
                    },                   
				    showEdit: {
				        show:false,
                        url: "SupplierEdit.aspx",
						close: function () {
                            grid.reload();
						}
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "Supplier_ID",
                ajaxURL: "${ctx}/Base/Material/GetSupplier.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_SupplierName").val());
                grid.reload()
            });

        });
        
        
		function showDetail(rowdata, index, value) {
			var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoshow('"
					+ rowdata["SUPPLIER_ID"]
					+ "','"
					+ value
					+ "');\">" + value + "</a>";
			return html;
		}

		function gotoshow(deptId, name) {
			parent.f_addTab(deptId, name+'经销商详情', '${ctx}/Base/Material/SupplierDet.html?deptId='+deptId);		
					}
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">经销商名称：</div>
					<div class="sert left">
						<input type="text" id="txt_SupplierName" name="txt_SupplierName" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="grid"></div>
		</div>
	</div>
</body>
</html>
