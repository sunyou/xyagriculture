<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农用物资-其他列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    
    <script type="text/javascript">
	    var isShowDel = false;
	    var isShowEdit = false;
    </script>
    <shiro:hasPermission name="1104:material.other.del"> 
		<script type="text/javascript">
		    isShowDel = true; 
	    </script>
	</shiro:hasPermission>
    <shiro:hasPermission name="1104:material.other.edit"> 
		<script type="text/javascript">
		    isShowEdit = true; 
	    </script>
	</shiro:hasPermission>
    <script type="text/javascript">
		 var grid =null;
		 $(document).ready(function () {
             

			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
             grid = $("#grid").createLigerGrid({
                header: [
					{ display: '采购日期', name: 'TIMESTAMP', type: 'date', options: { format: "yyyy-MM-dd" }},
					{display:'采购合作社名称', name:"COFARMER_NAME", width: '200'},
					{ display: '数量/单位', name: 'Produce_No',width:'150', render: function(rowdata, index, value) {
	                	 if(rowdata['PRICE'] && rowdata['SPECIFICATION']){
	                		 return rowdata['PRICE']+" ("+rowdata['SPECIFICATION']+")"
	                	 }else if(rowdata['SPECIFICATION']){
	                		 return "0 ("+rowdata['SPECIFICATION']
	                	 }else if(rowdata['PRICE']){
	                		 return rowdata['PRICE']+" (未填写单位)"
	                	 }
	                	 
	                 } },
					 { display: '物资名称', name: 'MATERIAL_NO' ,width:200, render: function (rowdata, index, value) { 
								return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['MATERIAL_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['MATERIAL_NAME'] +"</a>"; 
							} 
	                 },
	                 
	                 {display:'物资类别', name:"CATEGORY_NAME", width: '80'},
	                 { display: '物资登记证号', name: 'Produce_No',width:'150' }
                    
                ],
                param: { 'flag': 1, MaterialType_Code: 9},
				editor: {
                    width: 660,
                    height: 360
                },
				leftBtns: {				   
				    showDelete: {
				        show:isShowDel,
				        url: "${ctx}/Base/Material/delOtherById.ajax",
                        close: function () {
                            grid.reload();
                        }
					},
				    showDetail: {
				        show:false,
                        url: "${ctx}/Base/Material/OtherDet.html",
                        width:660,
                        height:360
                    },
				    showEdit: {
				        show:isShowEdit,
				        title:'编辑农资信息',
                        url: "${ctx}/Base/Material/OtherEdit.html",
                        width: 660,
                        height: 360,
						close: function () {
                            grid.reload();
						}
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "MATERIAL_ID",
                ajaxURL: "${ctx}/Base/Material/GetOtherList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_PlotName").val());
                grid.reload();
            });
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/Base/Material/OtherEdit.html?type=1', '新增其他农资',function () {
                    grid.reload();
				});
            });

        });
		
		function showDetail(id, name){
			ligerWin(660, 360,"${ctx}/Base/Material/OtherDet.html?id="+id,"查看农资 " + name + " 的详情");
		}
		 
		 
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">物资名称：</div>
					<div class="sert left">
						<input type="text" name="txt_PlotName" id="txt_PlotName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					
					<shiro:hasPermission name="1104:material.other.add"> 
						<div class="serb left">
							<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
						</div>
					</shiro:hasPermission>
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