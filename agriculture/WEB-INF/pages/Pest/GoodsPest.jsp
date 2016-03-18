<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>作物病虫害</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015101410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015101410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015101410080444"></script>
    <script type="text/javascript">
		var grid=null;
		$(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '农作物的病虫害名称', name: 'GoodPest_Name', width: '250' ,render: showPestDetailRender },
                    { display: '农作物名称', name: 'Goods_Name', width: '200' },
                    { display: '病虫害名称', name: 'Pest_Name', width: '200' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 540,
                    height: 150
                },
                leftBtns: {
                	show:false   
                 <shiro:hasPermission name="1606:GoodsPest.edit"> 
                	,show:true,   
					showDelete: {
						url:"${ctx}/Pest/delGoodsPest.ajax",
                        close: function () {
                            grid.reload();
                        }
					},
                    showDetail: false,
                    showEdit: {
                        url: "${ctx}/Pest/GoodsPestEdit.html",
                        width:660,
                        height:460,
						close: function () {
                            grid.reload();
						},
						title:"修改农作物病虫害信息"
                    }
                    </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "GOODSPEST_ID",
                ajaxURL: "${ctx}/Pest/GetGoodsPestList.ajax"
            });
            $("#btn_Search").click(function () {
                grid.setParm("goodPestName", $("#txt_GoodPest_Name").val());
                grid.reload();
            }
            );
            $("#btn_Search").click(function () {
                grid.setParm("goodPestName", $("#txt_GoodPest_Name").val());
                grid.reload();
            });

            $("#btn_Add").click(function () {
                ligerWin(660,460, '${ctx}/Pest/GoodsPestEdit.html?Type=1', '新增农作物病虫害信息', function () {
                    grid.reload();
                });
            });

        });
        
         
        
        function showPestDetailRender(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPestDetail('"
             	+rowdata["GOODSPEST_ID"]+"','"+rowdata["GOODPEST_NAME"]+"');\">"+value+"</a>";
             return html;
        } 
        
        function showPestDetail(pestId ,pestName){
        	myopen("${ctx}/Pest/GoodsPestDet.html?type=3&id="+pestId,"查看农作物病虫害 " + pestName + " 的详情"  ,660,360);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">农作物病虫害名称：</div>
					<div class="sert left">
						<input type="text" name="txt_GoodPest_Name" id="txt_GoodPest_Name" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					
					<shiro:hasPermission name="1606:GoodsPest.edit"> 
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
