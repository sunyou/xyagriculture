<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农作物列表</title>
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
       var grid =null;
       $(document).ready(function () {
           
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#gv_Goods").createLigerGrid({
                header: [
                    { display: '农作物编号', name: 'GoodsSTD_No' , width: '150' ,render:showGoodsDetailRender },
                    { display: '农作物名称', name: 'Goods_Name' , width: '150',render:showGoodsDetailRender},
                    { display: '农作物通用名', name: 'COMMONNAME' , width: '150'},
                    { display: '农作物类别', name: 'GoodsType_Name' , width: '150'}
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 530,
                    height: 200
                },
                leftBtns: { 
                	show:false   
                  <shiro:hasPermission name="1608:goods.edit">     
                	,show:true,                      
                    showDelete: {
                        show:true,
                        url:"${ctx}/Goods/GoodsDelete.ajax",
                        close: function () {
                            grid.reload();
                        }
					},					
                    showDetail: {
                        show:false
                    },                    
                    showEdit: {
                        show:true,
                        title:'修改农作物信息',
                        url: "${ctx}/Goods//UpdateGoodsEdit.html",
                        width: 660,
                        height:460,
						close: function () {
						 grid.reload();
						}
                    }
                     </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "GOODS_ID",
                ajaxURL: "${ctx}/Goods/GetGoods.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_GoodsName").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(660, 460, '${ctx}/Goods/AddGoodsEdit.html?Type=1', '新增农作物');
            });
			
			})
						 
        
        function showGoodsDetailRender(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showGoodsDetail('"
             	+rowdata["GOODS_ID"]+"','"+rowdata["GOODS_NAME"]+"');\">"+value+"</a>";
             return html;
        } 
        
        function showGoodsDetail(goodId ,goodsName){
        	myopen("${ctx}/Goods/GoodsDet.html?type=3&id="+goodId,"查看农作物 " + goodsName + " 的详情"  ,660,360);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">农作物名称：</div>
					<div class="sert left">
						<input type="text" id="txt_GoodsName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					 <shiro:hasPermission name="1608:goods.edit"> 
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 </shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_Goods"></div>
		</div>
	</div>
</body>
</html>
