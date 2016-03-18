<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>种植档案详情</title>
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
            grid = $("#grid").createLigerGrid({
                header: [
                    {
                        display: '操作', name: 'PLotOper_ID', width: '100', aligh: 'center', render: function (rowdata, index, value) {
                            var str = "";
                            
                            str += "<a class='ligerBtnDetail' href='javascript:;' onclick=\"DetailOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">查看</a>&nbsp;&nbsp;";
                            
                            //str += "<a class='ligerBtnEdit' href='javascript:;' onclick=\"updateOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">修改</a>&nbsp;&nbsp;";
                            
                            str += "<a class='ligerBtnDelete' href='javascript:;' onclick=\"deleteOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">删除</a>";
                            
                            return str;
                        }
                    },
                    { display: '操作日期', name: 'Operate_Date' },
                    { display: '操作类型', name: 'OperateTypeName' },
                    { display: '作物', name: 'Goods_Name' },
                    { display: '农资名称', name: 'Material_Name' },
                    { display: '操作人', name: 'Operators' },
                    { display: '操作说明', name: 'Notes' }
                ],
                param: { flag: 1 },
                editor: {
                    url: "/Pages/Base/Info/FarmerEdit.aspx",
                    para: ["FARMER_ID"],
                    width: 800,
                    height: 600
                },
                leftBtns: {
                    show: false
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "PLOT_ID",
                ajaxURL: "${ctx}/Plant/getPlantOper.ajax?plantLotId=" + $("#plantLotId").val()
            });

        });
    </script>
</head>
<body>
	<input type="hidden" id="plantLotId" value="${plantLotId }"/>
    <div id="grid"></div>
    <script type="text/javascript">
	  function updateOne(type, ID) {
	      var url = "";
	      switch (type) {
	          case 1: //整地
	              url = "${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=2&id=" + ID;
	              break;
	          case 2: //播种定植
	              url = "${ctx}/PlantOper/Vegetables/PlantCloneEdit.html?type=2&id=" + ID;
	              break;
	          case 3: //喷药
	              url = "${ctx}/PlantOper/Vegetables/AddPlantSprayEdit.html?type=2&id=" + ID;
	              break;
	          case 4: //施肥
	              url = "${ctx}/PlantOper/Vegetables/AddPlantFertilizeEdit.html?type=2&id=" + ID;
	              break;
	          case 5: //除草
	              url = "${ctx}/PlantOper/Vegetables/PlantWeedingEdit.html?type=2&id=" + ID;
	              break;
	          case 6: //浇水
	              url = "${ctx}/PlantOper/Vegetables/PlantWaterEdit.html?type=2&id=" + ID;
	              break;
	          case 7: //其它
	              url = "${ctx}/PlantOper/Vegetables/PlantOtherEdit.html?type=2&id=" + ID;
	              break;
	          case 8: //采收
	              url = "${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=2&id=" + ID;
	              break;
	          case 9: //清茬
	              url = "${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=2&id=" + ID;
	              break;
	          case 10: //加工-------------------
	              url = "/Pages/Trade/ProcessEdit.html?type=2&id=" + ID;
	              break;
	          case 11: //包装
	              url = "/Pages/Package/PackageEdit.html?type=2&id=" + ID;
	              break;
	          case 12: //销售----------------
	              url = "${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=2&id=" + ID;
	              break;
	          case 13: //授粉
	              url = "${ctx}/PlantOper/Fruit/FruitPlantPolEdit.html?type=2&id=" + ID;
	              break;
	          case 14: //配制
	              url = "${ctx}/PlantOper/Mushrooms/MushPreEdit.html?type=2&id=" + ID;
	              break;
	          case 15: //装袋
	              url = "${ctx}/PlantOper/Mushrooms/MushBaggingEdit.html?type=2&id=" + ID;
	              break;
	          case 16: //灭菌
	              url = "${ctx}/PlantOper/Mushrooms/MushSterilizingEdit.html?type=2&id=" + ID;
	              break;
	          case 17: //接种
	              url = "${ctx}/PlantOper/Mushrooms/MushVaccEdit.html?type=2&id=" + ID;
	              break;
	          case 18: //培养
	              url = "${ctx}/PlantOper/Mushrooms/MushFosterEdit.html?type=2&id=" + ID;
	              break;
	          case 19: //出菇
	              url = "${ctx}/PlantOper/Mushrooms/MushroomEdit.html?type=2&id=" + ID;
	              break;
	          case 20: //修剪
	              url = "${ctx}/PlantOper/Fruit/FruitPlantPruneEdit.html?type=2&id=" + ID;
	              break;
	          case 21: //疏花蔬果
	              url = "${ctx}/PlantOper/Fruit/FruitPlantLaxifloraEdit.html?type=2&id=" + ID;
	              break;
	          case 22: //套袋
	              url = "${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingEdit.html?type=2&id=" + ID;
	              break;
	          case 23: //换茬
	              url = "${ctx}/PlantOper/Fruit/FruitPlantRotationCropsEdit.html?type=2&id=" + ID;
	              break;
	      }
	      ligerWin(450, 350, url, '修改');
	  }
	  function DetailOne(type, ID) {
	      var url = "";
	      switch (type) {
	          case 1: //整地
	              url = "${ctx}/PlantOper/Vegetables/PlantSowingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 200, url, '查看');
	              break;
	          case 2: //播种定植
	              url = "${ctx}/PlantOper/Vegetables/PlantCloneDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 200, url, '查看');
	              break;
	          case 3: //喷药
	              url = "${ctx}/PlantOper/Vegetables/PlantSprayDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 430, url, '查看');
	              break;
	          case 4: //施肥
	              url = "${ctx}/PlantOper/Vegetables/PlantFertilizeDet.html?type=2&plotOperId=" + ID;
	              ligerWin(500, 420, url, '查看');
	              break;
	          case 5: //除草
	              url = "${ctx}/PlantOper/Vegetables/PlantWeedingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 200, url, '查看');
	              break;
	          case 6: //浇水
	              url = "${ctx}/PlantOper/Vegetables/PlantWaterDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 250, url, '查看');
	              break;
	          case 7: //其它
	              url = "${ctx}/PlantOper/Vegetables/PlantOtherDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 220, url, '查看');
	              break;
	          case 8: //采收
	              url = "${ctx}/PlantOper/Vegetables/PlantHarvestDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 300, url, '查看');
	              break;
	          case 9: //清茬
	              url = "${ctx}/PlantOper/Vegetables/PlantClearDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 200, url, '查看');
	              break;
	          case 10: //加工-------------------
	              url = "/Pages/Trade/ProcessDet.html?plantlotId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 11: //包装
	              url = "/Pages/Package/PackageDet.html?plantlotId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 12: //销售----------------
	              url = "${ctx}/PlantOper/Vegetables/PlantSowingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 13: //授粉
	              url = "${ctx}/PlantOper/Fruit/FruitPlantPolDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 14: //配制
	              url = "${ctx}/PlantOper/Mushrooms/MushPreDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 15: //装袋
	              url = "${ctx}/PlantOper/Mushrooms/MushBaggingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 250, url, '查看');
	              break;
	          case 16: //灭菌
	              url = "${ctx}/PlantOper/Mushrooms/MushSterilizingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 280, url, '查看');
	              break;
	          case 17: //接种
	              url = "${ctx}/PlantOper/Mushrooms/MushVaccDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 220, url, '查看');
	              break;
	          case 18: //培养
	              url = "${ctx}/PlantOper/Mushrooms/MushFosterDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 19: //出菇
	              url = "${ctx}/PlantOper/Mushrooms/MushroomDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 20: //修剪
	              url = "${ctx}/PlantOper/Fruit/FruitPlantPruneDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 21: //疏花蔬果
	              url = "${ctx}/PlantOper/Fruit/FruitPlantLaxifloraDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 22: //套袋
	              url = "${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
	              break;
	          case 23: //换茬
	              url = "${ctx}/PlantOper/Fruit/FruitPlantRotationCropsDet.html?type=2&plotOperId=" + ID;
	              ligerWin(450, 350, url, '查看');
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
	      getAjax(url, { "plotOperId": ID, "type": "delete" }, function (data) {
	          if (data.success) {
	              alert(data.message);
	              grid.reload();
	          }
	      });
	  }

    </script>
</body>
</html>


