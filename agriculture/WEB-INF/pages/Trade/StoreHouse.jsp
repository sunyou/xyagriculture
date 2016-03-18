<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>仓库管理</title>
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

        var grid = null;
        $(document).ready(function () {
            

			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '仓库名称', name: 'SH_Name' ,render:showDetail, width: '150'},
                  
                    { display: '温度(℃)', name: 'Tem' },
                    { display: '湿度(%)', name: 'Hum' },
                    { display: '压强(kPa)', name: 'Pres' },
                    { display: '光照(Lux)', name: 'Beam' },
                    { display: '仓库大小(㎡)', name: 'Amout' },
                    { display: '管理员', name: 'Operater' },
                      { display: '所属生产商', name: 'CoFarmer_Name', width: '250',render:function(rowdata, index, value) {
                          var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCofarmerInfo('"+rowdata["COFARMER_ID"]+"');\">"+value+"</a>";
                          return html ;
                      } },
                    { display: '说明', name: 'Remark', width: '250' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 500,
                    height: 470
                },
                leftBtns: {
                    show:true,
                    showDetail: {
                     show:false,
                    },
                    
                    show:false,
                    showDelete: {
                        show:true,
                        url:"${ctx}/StoreHouse/delStoreHouse.ajax",
                        close: function () {
                            grid.reload();
                        }
                    },                    
                    show:true,
                    showEdit: {
                    	width: 660,
                        height: 360,
                        url: "${ctx}/Trade/StoreHouseEdit.html"
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "SH_ID",
                ajaxURL: "${ctx}/StoreHouse/GetStoreHouse.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("shName", $("#txt_SH_Name").val());
                grid.reload()
            });

            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/Trade/StoreHouseEdit.html?type=1', '新增仓库', function () {
                    grid.reload();
                });
            });
        });
        
          function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
             	+rowdata["SH_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function detail(id ,name){
        	myopen("${ctx}/Trade/StoreHouseEdit.html?type=3&id="+id,"查看仓库详情"  ,660,360);
        }
        
        function showCofarmerInfo(cofarmerId){
        	parent.f_addTab(cofarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+cofarmerId);		
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">仓库名称：</div>
					<div class="sert left">
						<input type="text" name="txt_SH_Name" id="txt_SH_Name" class="serchInput" />
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

