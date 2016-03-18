<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农户列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#gv_Farmer").createLigerGrid({
                header: [
                    { display: '农户姓名', name: 'Farmer_Name' ,render:showFarmerDetail },
                    {display: '联系电话', name: 'Tel', width: '150'},
                    { display: '隶属生产者', name: 'CoFarmer_Name', width: '250',render:showCoFarmerDetail},
                    { display: '所属地区', name: 'Area_FullName', width: '200' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 540
                },
                leftBtns: {        
                	show:false   
                	
                <shiro:hasPermission name="1003:framer.edit">     
                	,show:true,   
                    showDetail: {
                		show:false
                    },                    
                    showDelete: {
                    	show:true,
                        url: "${ctx}/Farmer/FarmerDelete.ajax",
                        close: function () {
                            grid.reload();
                        }
                    },                    
                    showEdit: {
                        show:true,
                        title:'编辑农户信息',
                        url: "${ctx}/Farmer/GotoFarmerEdit.html",
                    	width: 660,
                        height: 360,
                        close: function () {
                            grid.reload();
                        }
                    }
                 </shiro:hasPermission>
                    
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "FARMER_ID",
                ajaxURL: "${ctx}/Farmer/GetFarmer.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_FarmerName").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/Farmer/AddFarmerEdit.html?Type=1', '新增农户');
            });
        });
        
        
        
        function showFarmerDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"
             	+rowdata["FARMER_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function showPlantBase(farmerId ,farmerName){
        	myopen("${ctx}/Farmer/FarmerDet.html?type=3&id="+farmerId,"查看农户 " + farmerName + " 的详情"  ,660,360);
        }
        
        	function showCoFarmerDetail(rowdata, index, value) {
			var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoshowCoFarmer('"
					+ rowdata["COFARMER_ID"]
					+ "','"
					+ value
					+ "');\">" + value + "</a>";
			return html;
		}

		function gotoshowCoFarmer(cofarmerId, name) {
			parent.f_addTab(cofarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+cofarmerId);		
					}
        
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">农户姓名：</div>
					<div class="sert left">
						<input type="text" id="txt_FarmerName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<shiro:hasPermission name="1003:framer.edit"> 
						<div class="serb left" >
							<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
						</div>
					
						<div class="serb left" style="display: none">
						    <input onclick="javascript: ligerWin(540, 360, '/Pages/Import/ImportExcel.aspx?name=2', '导入农户');" type="button" value="导入" class="btn_tool_import" />
						</div>
					</shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_Farmer"></div>
		</div>
	</div>
</body>
</html>
