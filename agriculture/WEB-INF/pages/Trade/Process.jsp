<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农产品加工</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
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
                 { display: '加工编号', name: 'PLOTOPER_ID' ,render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"+value+"');\">"+value+"</a>";
                       
                        return html ;
                    	}
                    },
                    
                   { display: '合作社名称/基地/地块/面积', name: 'CoFarmer_Name',width:'400',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCoFarmerDetail('"+rowdata["COFARMER_ID"]+"');\">"+rowdata["COFARMER_NAME"]+"</a>" + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
                        html = html +" / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+rowdata["PLOT_NAME"]+"</a>"
                        html = html + " /" + rowdata["AREAS"]+"(亩)"
                        return html ;
                    }},
                    { display: '加工日期', name: 'Operate_Date',  type: 'date', format: 'yyyy-MM-dd'},
                   { display: '农作物/种植批次/采收批次', name: 'Goods_Name',width:'400',render:function(rowdata, index, value) {
                        var html = value + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantLot('"+rowdata["PLANTLOT_ID"]+"');\">"+rowdata["LOT_NO"]+"</a>"+ " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showHarvest('"+rowdata["PLOTHARVEST_NO"]+"');\">"+rowdata["PLOTHARVEST_NO"]+"</a>";
                        return html ;
                    }},
                   

                   
                    { display: '加工数量', name: 'Process_Qty' },
                    { display: '加工人', name: 'Operators' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 490,
                    height: 451
                },
                leftBtns: {
                   show:false   
               
                 <shiro:hasPermission name="1403:process.edit">  
                ,show:true,  
                    showDetail: {
                     show:false,
                    },                    
                    show:true,
                     showDelete: {
                        show:true,
                        url:"${ctx}/Process/delProcess.ajax",
                       
                        close: function () {
                            grid.reload();
                        }
                    },                     
                    show:true,
                    showEdit: {
                        width: 660,
                        height: 360,
                        url: "${ctx}/Trade/ProcessEdit.html",
                       
                        close: function () {
                            grid.reload();
                        }
                    }
                    
                      </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "PLOTOPER_ID",
                ajaxURL: "${ctx}/Process/GetProcess.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("goodsName", $("#txt_Goods_Name").val());
                  grid.setParm("plantlotId", $("#txt_plantlotId").val());
                 grid.setParm("harvestoperateId", $("#txt_harvestoperateId").val());
                grid.setParm("operdate", $("#txt_OperDate").val());
                grid.reload()
            });

            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/Trade/ProcessEdit.html?type=1', '新增农产品加工信息', function () {
                    grid.reload();
                });
            });
        });
        
       //  function showDetail(rowdata,index,value){
       ////      var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
        //     	+rowdata["PLOTOPER_ID"]+"','"+value+"');\">"+value+"</a>";
        //     return html;
        //} 
        
        function detail(id){
        	myopen("${ctx}/Trade/ProcessEdit.html?type=3&id="+id,"查看农产品加工 的详情"  ,660,360);
        }
        
         function showCoFarmerDetail(comFarmerId){
            parent.f_addTab(comFarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+comFarmerId);		
        	//myopen("${ctx}/CoFarmerAudit/CoFarmerAuditDet.html?id="+comFarmerId,"申请生产者详细信息",800,500);
        }
        
         function showPlantBase(plantBaseId){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?id="+plantBaseId,"查看基地详情",1000,600);
        }
        
        function showPlotDet(plotId){
        	myopen("${ctx}/Plot/PlotDet.html?id="+plotId,"显示地块详细信息",660,360);
        }
        
         function showPlantLot(plantId){
        	myopen("${ctx}/Plant/Vegetables/PlantLotDet.html?id="+plantId,"显示种植批次详细信息",660,360);
        }
        
        function showHarvest(no){
        	myopen("${ctx}/PlotHarvest/PlotHarvestDet.html?plotharvestNo="+no,"显示采收批次详细信息",660,360);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">农作物：</div>
					<div class="sert left">
						<input type="text" name="txt_Goods_Name" id="txt_Goods_Name" class="serchInput" />
					</div>
					<div class="rtxt left">种植批次：</div>
					<div class="sert left">
						<input type="text" name="txt_plantlotId" id="txt_plantlotId" class="serchInput" />
					</div>
					<div class="rtxt left">采收批次：</div>
					<div class="sert left">
						<input type="text" name="txt_harvestoperateId" id="txt_harvestoperateId" class="serchInput" />
					</div>
					<div class="rtxt left">加工日期：</div>
					<div class="sert left">
						<input name="txt_OperDate" type="text" id="txt_OperDate"  class="Wdate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					  <shiro:hasPermission name="1403:process.edit">  
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

