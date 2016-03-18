<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农产品存储</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
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
                    { display: '存储日期', name: 'OperDate', width: '100', type: 'date', format: 'yyyy-MM-dd'},
                     { display: '存储编号', name: 'PLOTOPER_ID' ,render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"+value+"');\">"+value+"</a>";
                       
                        return html ;
                    	}
                    },
                    
                   { display: '生产的合作社名称/生产基地名称/地块名称/采收批次号', name: 'CoFarmer_Name',width:'450',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCoFarmerDetail('"+rowdata["COFARMER_ID"]+"');\">"+rowdata["COFARMER_NAME"]+"</a>" 
                        + "/<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
                        html = html +"/<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+rowdata["PLOT_NAME"]+"</a>"
                        html = html + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showHarvest('"+rowdata["PLOTHARVEST_NO"]+"');\">"+rowdata["PLOTHARVEST_NO"]+"</a>";
                        
                        return html ;
                    }},
                    { display: '农作物名称', name: 'Goods_Name' ,width: '120' },
                     { display: '仓库 /存储类型/存储天数', name: 'SH_Name',width:'250',render:function(rowdata, index, value) {
                       var days=rowdata["DAYS"];
                       var name="<a href='javascript:;' class='ligerBtnDetail' onclick=\"storeDetail('"+rowdata["SH_ID"]+"');\">"+value+"</a>";
                       if(days==undefined){
                       	   days=0;
                       }
                       if(value==undefined){
                       		name="";
                       }
                        var html = name + " / "+rowdata["STYPE"]+ " / "+days+"(天)";
                       
                        return html ;
                    }},
                   
                   
                    { display: '温度(℃)', name: 'Tem', width: '50' },
                    { display: '湿度(%)', name: 'Hum', width: '50' },
                    { display: '压强(kPa)', name: 'Pres', width: '50' },
                    { display: '光照(Lux)', name: 'Beam', width: '50' },
                    { display: '存储人', name: 'Operater' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 500,
                    height: 470
                },
                leftBtns: {
                    show:true,
                    showDetail: {
                      show:false
                    },                    
                    show:true,
                    showDelete: {
                        show:true,
                        url:"${ctx}/GoodsStorage/delGoodsStorage.ajax",
                        close: function () {
                            grid.reload();
                        }
                    },                    
                    show:true,
                    showEdit: {
                    	width: 700,
                        height: 400,
                        url: "${ctx}/Trade/GoodsStorageEdit.html",
                        close: function () {
                            grid.reload();
                        }
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "PLOTOPER_ID",
                ajaxURL: "${ctx}/GoodsStorage/GetGoodsStorage.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("goodsName", $("#txt_Goods_Name").val());
                grid.setParm("shName", $("#txt_Sh_Name").val());
                 grid.setParm("harvestoperateId", $("#txt_harvestoperateId").val());
                grid.setParm("operdate", $("#txt_OperDate").val());
                grid.reload()
            });

            $("#btn_Add").click(function () {
                ligerWin(700, 400, '${ctx}/Trade/GoodsStorageEdit.html?type=1', '新增农产品存储信息', function () {
                    grid.reload();
                });
            });
        });
        
      //   function showDetail(rowdata,index,value){
      //       var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
      //       	+rowdata["PLOTOPER_ID"]+"','"+value+"');\">"+value+"</a>";
     //        return html;
     //   } 
        
        function detail(id){
        	myopen("${ctx}/Trade/GoodsStorageEdit.html?type=3&id="+id,"查看农产品存储详情"  ,660,360);
        }
        
        function storeDetail(id){
			myopen("${ctx}/Trade/StoreHouseEdit.html?type=3&id="+id,"查看仓库详情"  ,660,360);
        }
          function showCoFarmerDetail(comFarmerId){
        	parent.f_addTab(comFarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+comFarmerId);		
					
        }
        
         function showPlantBase(plantBaseId){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?id="+plantBaseId,"查看基地详情",1000,600);
        }
        
        function showPlotDet(plotId){
        	myopen("${ctx}/Plot/PlotDet.html?id="+plotId,"显示地块详细信息",660,360);
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
					<div class="rtxt left">采收批次：</div>
					<div class="sert left">
						<input type="text" name="txt_harvestoperateId" id="txt_harvestoperateId" class="serchInput" />
					</div>
					<div class="rtxt left">农作物：</div>
					<div class="sert left">
						<input type="text" name="txt_Goods_Name" id="txt_Goods_Name" class="serchInput" />
					</div>
					<div class="rtxt left">仓库：</div>
					<div class="sert left">
						<input type="text" name="txt_Sh_Name" id="txt_Sh_Name" class="serchInput" />
					</div>
					
					<div class="rtxt left">存储日期：</div>
					<div class="sert left">
						<input name="txt_OperDate" type="text" id="txt_OperDate"  class="Wdate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" class="serchInput" />
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

