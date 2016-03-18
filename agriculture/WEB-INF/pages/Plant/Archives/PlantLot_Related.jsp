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
	<link rel="stylesheet" type="text/css" href="${ctx}/content/js/jquery-smartwizard/smart_wizard.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx }/content/js/jquery-smartwizard/jquery.smartWizard-2.0.js"></script>

	<style type="text/css">
		.data_grid td span{color:black;    padding-left: 2%;}
		.StepTitle {
		  display:block;
		  position: relative;
		  margin:0;   
		  border:1px solid #E0E0E0;
		  padding:5px;   
		  font: bold 16px Verdana, Arial, Helvetica, sans-serif; 
		  color:#5A5655;   
		  background-color:#f4fceb;
		  clear:both;
		  text-align:left; 
		  z-index:88;
		  -webkit-border-radius: 5px;
		  -moz-border-radius  : 5px;    
		}
	</style>
</head>
<body style="overflow: hidden;">
	<div id="layout">
	<div id="step-4">
		<h2 class="StepTitle">种植批次信息</h2>
         <div style="margin-top:10px;margin-bottom:10px;">
         	<table class="data_grid">
         		<tr>
         			<th>种植日期</th>
         			<td><span id="PLANT_DATE">${bean.plantDate }</span></td>
         			<th>批次号</th>
         			<td><span id="LOT_NO">${bean.lotNo }</span></td>
         		</tr>
         		<tr>
         			<th>生产者</th>
         			<td><span id="COFARMER_NAME">${bean.cofarmerName }</span></td>
         			<th>农户姓名</th>
         			<td><span id="FARMER_NAME">${bean.farmerName }</span></td>
         		</tr>
         		<tr>
         			<th>作物名称</th>
         			<td><span id="GOODS_NAME">${bean.goodsName }</span></td>
         			<th>种子种苗</th>
         			<td><span id="GOODVARIETY_NAME">${bean.goodvarietyName }</span></td>
         		</tr>
         		<tr>
         			<th>种植区域</th>
         			<td><span id="PLOT_NAME">${bean.plotName }</span></td>
         			<th>种植面积(亩)</th>
         			<td><span id="AREAS">${bean.areas }</span></td>
         		</tr>
         	</table>
         </div>
   		<h2 class="StepTitle" style="margin-top:5px;margin-bottom:5px;">农事操作明细</h2>
         <div id="grid_operate"></div>
         <input type="hidden" name="hf_PlantLotID" id="hf_PlantLotID" value="${bean.plantlotId }"/>
     </div>
	</div>
	<script type="text/javascript">
    $(function(){
    	grid5 = $("#grid_operate").createLigerGrid({
            header: [
                { display: '操作日期', name: 'Operate_Date',type: 'date', options: { format: "yyyy-MM-dd" } ,width:170 },
                { display: '操作类型', name: 'OperateTypeName' },
                { display: '作物', name: 'Goods_Name' },
                { display: '农资名称', name: 'Material_Name' },
                { display: '操作人', name: 'Operators' },
                { display: '操作说明', name: 'Notes' },
                {
                    display: '操作', name: 'PLotOper_ID', width: '100', aligh: 'center', render: function (rowdata, index, value) {
                        var str = "";
                        str += "<a class='ligerBtnDetail' href='javascript:;' onclick=\"DetailOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">查看</a>&nbsp;&nbsp;";
                        str += "<a class='ligerBtnDelete' href='javascript:;' onclick=\"deleteOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">删除</a>";
                        return str;
                    }
                }
            ],
            param: { 'plantLotId': $("#hf_PlantLotID").val() },
            leftBtns: {
                show: false
            },
            onSelectRow: function (rowdata, rowid, rowobj) {
            },
            keyID: "PLOT_ID",
            ajaxURL: "${ctx}/Plant/getPlantOper.ajax"
        });
    });
    
	  function DetailOne(type, ID) {
	      var url = "";
	      switch (type) {
	          case 1: //整地
	              url = "${ctx}/PlantOper/Vegetables/PlantSowingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660,360, url, '查看');
	              break;
	          case 2: //播种定植
	              url = "${ctx}/PlantOper/Vegetables/PlantCloneDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660,360, url, '查看');
	              break;
	          case 3: //喷药
	              url = "${ctx}/PlantOper/Vegetables/PlantSprayDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 4: //施肥
	              url = "${ctx}/PlantOper/Vegetables/PlantFertilizeDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 5: //除草
	              url = "${ctx}/PlantOper/Vegetables/PlantWeedingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660,360, url, '查看');
	              break;
	          case 6: //浇水
	              url = "${ctx}/PlantOper/Vegetables/PlantWaterDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 7: //其它
	              url = "${ctx}/PlantOper/Vegetables/PlantOtherDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 8: //采收
	              url = "${ctx}/PlantOper/Vegetables/PlantHarvestDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 300, url, '查看');
	              break;
	          case 9: //清茬
	              url = "${ctx}/PlantOper/Vegetables/PlantClearDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 10: //加工-------------------
	              url = "/Pages/Trade/ProcessDet.html?plantlotId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 11: //包装
	              url = "/Pages/Package/PackageDet.html?plantlotId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 12: //销售----------------
	              url = "${ctx}/PlantOper/Vegetables/PlantSowingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 13: //授粉
	              url = "${ctx}/PlantOper/Fruit/FruitPlantPolDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 14: //配制
	              url = "${ctx}/PlantOper/Mushrooms/MushPreDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 15: //装袋
	              url = "${ctx}/PlantOper/Mushrooms/MushBaggingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 16: //灭菌
	              url = "${ctx}/PlantOper/Mushrooms/MushSterilizingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 17: //接种
	              url = "${ctx}/PlantOper/Mushrooms/MushVaccDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 18: //培养
	              url = "${ctx}/PlantOper/Mushrooms/MushFosterDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 19: //出菇
	              url = "${ctx}/PlantOper/Mushrooms/MushroomDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 20: //修剪
	              url = "${ctx}/PlantOper/Fruit/FruitPlantPruneDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 21: //疏花蔬果
	              url = "${ctx}/PlantOper/Fruit/FruitPlantLaxifloraDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 22: //套袋
	              url = "${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	          case 23: //换茬
	              url = "${ctx}/PlantOper/Fruit/FruitPlantRotationCropsDet.html?type=2&plotOperId=" + ID;
	              ligerWin(660, 360, url, '查看');
	              break;
	      }
	  }
	  
	  function deleteOne(type, ID) {
  	      var url = "";
  	      switch (type) {
  	          case 1: //整地
  	              url = "${ctx}/PlantOper/delPlantSowing.ajax";
  	              break;
  	          case 2: //播种定植
  	              url = "${ctx}/PlantOper/delPlantClone.ajax";
  	              break;
  	          case 3: //喷药
  	              url = "${ctx}/PlantOper/delPlantSpraying.ajax";
  	              break;
  	          case 4: //施肥
  	              url = "${ctx}/PlantOper/delPlantFertilize.ajax";
  	              break;
  	          case 5: //除草
  	              url = "${ctx}/PlantOper/delPlantWeeding.ajax";
  	              break;
  	          case 6: //浇水
  	              url = "${ctx}/PlantOper/delPlantWater.ajax";
  	              break;
  	          case 7: //其它
  	              url = "${ctx}/PlantOper/delPlantOther.ajax";
  	              break;
  	          case 8: //采收
  	              url = "${ctx}/PlantOper/delPlantHarvest.ajax";
  	              break;
  	          case 9: //清茬
  	              url = "${ctx}/PlantOper/delPlotClear.ajax";
  	              break;
  	          case 10: //加工-------------------
  	              url = "${ctx}/PlantOper/delProcess.ajax";
  	              break;
  	          case 11: //包装
  	              url = "${ctx}/PlantOper/delPackage.ajax";
  	              break;
  	          case 12: //销售----------------
  	              url = "";
  	              break;
  	          case 13: //授粉
  	              url = "${ctx}/PlantOper/delPlantPol.ajax";
  	              break;
  	          case 14: //配制
  	              url = "${ctx}/PlantOper/delMushPre.ajax";
  	              break;
  	          case 15: //装袋
  	              url = "${ctx}/PlantOper/delMushBagging.ajax";
  	              break;
  	          case 16: //灭菌
  	              url = "${ctx}/PlantOper/delMushSterilizing.ajax";
  	              break;
  	          case 17: //接种
  	              url = "${ctx}/PlantOper/delMushVacc.ajax";
  	              break;
  	          case 18: //培养
  	              url = "${ctx}/PlantOper/delMushFoster.ajax";
  	              break;
  	          case 19: //出菇
  	              url = "${ctx}/PlantOper/delMushRoom.ajax";
  	              break;
  	          case 20: //修剪
  	              url = "${ctx}/PlantOper/delPlotPrune.ajax";
  	              break;
  	          case 21: //疏花蔬果
  	              url = "${ctx}/PlantOper/delPlotLaxiflora.ajax";
  	              break;
  	          case 22: //套袋
  	              url = "${ctx}/PlantOper/delPlotFruitBagging.ajax";
  	              break;
  	          case 23: //换茬
  	              url = "${ctx}/PlantOper/delFruitRot.ajax";
  	              break;
  	      }
  	      art.dialog.confirm(
  				"确定删除？", 
  				function (yes) { 
  					$.ajax({
  						type: "post",
  						url: url,
  						data: { "plotOperId": ID, "type": "delete" },
  						dataType: "json",
  						returnType:"json",
  						error : function(XMLResponse) {
  							openDialogInDiv(XMLResponse.responseText);
  						},
  						success : function(jsonData) {
  							//后台操作成功
  							if(jsonData.success && jsonData.success == true){
  								art.dialog.tips('操作成功！',1);
  								setTimeout(function () {
  									grid5.reload();
  								},500);
  							}
  							//后台操作失败
  							else{
  								setButtonDisabled(false);
  								openDialogInDiv('操作失败：'+jsonData.message,function(){});
  							}
  						}
  					});
  				}
  		);
  	  }
	
	</script>
</body>
</html>
