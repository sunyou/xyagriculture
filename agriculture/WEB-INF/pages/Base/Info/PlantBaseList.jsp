<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植基地</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        
        var grid2 = null,grid=null;
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });

            
            grid = $("#gv_PlantBases").createLigerGrid({
                header: [                    
                    { display: '基地编号', name: 'PlantBases_No',render:showDetail },
                    { display: '基地名称', name: 'PlantBases_Name',width:'150',render:showDetail},
                    { display: '基地面积(亩)', name: 'Areas', type: 'double', format: '0.00' },
                    { display: '生产者', name: 'CoFarmer_Name',width:'250' ,render:showCoFarmerDetail},
                    { display: '联系人', name: 'Contacts' },
                    { display: '联系电话', name: 'Tel' }
                ],
                
               // addTools: function (record, rowindex, value, column) {
               //     return "<a href='javascript:;' class='ligerBtnDetail' onclick=\"ligerWin(950, 150, '${ctx}/Plot/PlotEditMutil.html?baseID=" + record["PLANTBASES_UID"] + "&baseName=" + record["PLANTBASES_NAME"] + "', '添加地块');\">添加地块</a>";
             //   },
           
               
                title:'基地列表',
                param: { 'flag': 1 },
                editor: {
                    width: 599
                },
              
                	
                
                leftBtns: {
                  show:false   
                 <shiro:hasPermission name="1005:plantbase.edit">     
                	,show:true, 
                    width:170,
                    showDelete: {
                        show:true,
                        url: "${ctx}/PlantBases/PlantBaseDel.ajax",
                        close: function () {
                            grid.reload();
                            setTimeout(function () { grid2.reload(); }, 600)
                        }
                    },
                    showDetail: {
                        show:false,
                        url: "${ctx}/PlantBases/PlantBaseDet.html",
                        width: 591,
                        height: 530
                    },
                    showEdit: {
                        show:true,
                        url: "${ctx}/PlantBases/GotoPlantBaseEdit.html",
                        width:700,
                        height:600,
                        close: function () {
                            grid.reload();
                        }
                    }
                     </shiro:hasPermission>
                },
                onLoaded: function () {
                    if (grid2) {
                        grid2.setParm("PARENT_ID", getNewGuid());
                        grid2.reload();
                    }
                },
               
                keyID: "PLANTBASES_UID",
                ajaxURL: "${ctx}/PlantBases/GetPlantBases.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_PlantBasesName_Serch").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/PlantBases/PlantBaseMutil.html', '新增种植基地');
            });

        });
        
         function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"
             	+rowdata["PLANTBASES_UID"]+"','"+rowdata["PLANTBASES_NAME"]+"');\">"+value+"</a>";
             return html;
        } 
        
         function showPlantBase(Id ,Name){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?type=3&id="+Id,"查看基地 " + Name + " 的详情"  ,800,600);
        }
        
        function showPlotDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlot('"
             	+rowdata["PLOT_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
         function showPlot(Id ,Name){
        	myopen("${ctx}/Plot/PlotDet.html?type=3&id="+Id,"查看地块 " + Name + " 的详情"  ,660,360);
        }
        
        function showCoFarmerDetail(rowdata, index, value) {
            var val="";
            if (value) {
				val=value
			}
			var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoshowCoFarmer('"
					+ rowdata["COFARMER_ID"]
					+ "','"
					+ val
					+ "');\">" + val + "</a>";
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
					<div class="rtxt left">基地名称：</div>
					<div class="sert left">
						<input type="text" id="txt_PlantBasesName_Serch" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					    <shiro:hasPermission name="1005:plantbase.edit">   
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 </shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
            <div id="gv_PlantBases"></div>
           
		</div>
	</div>
</body>
</html>
