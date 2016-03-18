/// <reference path="../../../Pages/Trade/ProcessEdit.html" />
/// <reference path="../../../Pages/Trade/ProcessEdit.html" />
function updateOne(type, ID) {
    var url = "";
    switch (type) {
        case 1: //整地
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantSowingEdit.html?type=2&id=" + ID;
            break;
        case 2: //播种定植
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantCloneEdit.html?type=2&id=" + ID;
            break;
        case 3: //喷药
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/AddPlantSprayEdit.html?type=2&id=" + ID;
            break;
        case 4: //施肥
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/AddPlantFertilizeEdit.html?type=2&id=" + ID;
            break;
        case 5: //除草
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantWeedingEdit.html?type=2&id=" + ID;
            break;
        case 6: //浇水
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantWaterEdit.html?type=2&id=" + ID;
            break;
        case 7: //其它
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantOtherEdit.html?type=2&id=" + ID;
            break;
        case 8: //采收
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantHarvestEdit.html?type=2&id=" + ID;
            break;
        case 9: //清茬
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantClearEdit.html?type=2&id=" + ID;
            break;
        case 10: //加工-------------------
            url = "/Pages/Trade/ProcessEdit.html?type=2&id=" + ID;
            break;
        case 11: //包装
            url = "/Pages/Package/PackageEdit.html?type=2&id=" + ID;
            break;
        case 12: //销售----------------
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantSowingEdit.html?type=2&id=" + ID;
            break;
        case 13: //授粉
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantPolEdit.html?type=2&id=" + ID;
            break;
        case 14: //配制
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushPreEdit.html?type=2&id=" + ID;
            break;
        case 15: //装袋
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushBaggingEdit.html?type=2&id=" + ID;
            break;
        case 16: //灭菌
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushSterilizingEdit.html?type=2&id=" + ID;
            break;
        case 17: //接种
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushVaccEdit.html?type=2&id=" + ID;
            break;
        case 18: //培养
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushFosterEdit.html?type=2&id=" + ID;
            break;
        case 19: //出菇
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushroomEdit.html?type=2&id=" + ID;
            break;
        case 20: //修剪
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantPruneEdit.html?type=2&id=" + ID;
            break;
        case 21: //疏花蔬果
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantLaxifloraEdit.html?type=2&id=" + ID;
            break;
        case 22: //套袋
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantFruitBaggingEdit.html?type=2&id=" + ID;
            break;
        case 23: //换茬
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantRotationCropsEdit.html?type=2&id=" + ID;
            break;
    }
    ligerWin(450, 350, url, '修改');
}
function DetailOne(type, ID) {
    var url = "";
    switch (type) {
        case 1: //整地
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantSowingDet.html?type=2&id=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 2: //播种定植
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantCloneDet.html?type=2&id=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 3: //喷药
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantSprayDet.html?type=2&id=" + ID;
            ligerWin(450, 430, url, '查看');
            break;
        case 4: //施肥
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantFertilizeDet.html?type=2&id=" + ID;
            ligerWin(500, 420, url, '查看');
            break;
        case 5: //除草
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantWeedingDet.html?type=2&id=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 6: //浇水
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantWaterDet.html?type=2&id=" + ID;
            ligerWin(450, 250, url, '查看');
            break;
        case 7: //其它
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantOtherDet.html?type=2&id=" + ID;
            ligerWin(450, 220, url, '查看');
            break;
        case 8: //采收
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantHarvestDet.html?type=2&id=" + ID;
            ligerWin(450, 300, url, '查看');
            break;
        case 9: //清茬
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantClearDet.html?type=2&id=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 10: //加工-------------------
            url = "/Pages/Trade/ProcessDet.html?ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 11: //包装
            url = "/Pages/Package/PackageDet.html?ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 12: //销售----------------
            url = GLOBAL.WEBROOT+"/PlantOper/Vegetables/PlantSowingDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 13: //授粉
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantPolDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 14: //配制
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushPreDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 15: //装袋
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushBaggingDet.html?type=2&id=" + ID;
            ligerWin(450, 250, url, '查看');
            break;
        case 16: //灭菌
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushSterilizingDet.html?type=2&id=" + ID;
            ligerWin(450, 280, url, '查看');
            break;
        case 17: //接种
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushVaccDet.html?type=2&id=" + ID;
            ligerWin(450, 220, url, '查看');
            break;
        case 18: //培养
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushFosterDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 19: //出菇
            url = GLOBAL.WEBROOT+"/PlantOper/Mushrooms/MushroomDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 20: //修剪
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantPruneDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 21: //疏花蔬果
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantLaxifloraDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 22: //套袋
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantFruitBaggingDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 23: //换茬
            url = GLOBAL.WEBROOT+"/PlantOper/Fruit/FruitPlantRotationCropsDet.html?type=2&id=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
    }
}

function deleteOne(type, ID) {
    var url = "";
    switch (type) {
        case 1: //整地
            url = "/PlantSowing/getPlantSowing";
            break;
        case 2: //播种定植
            url = "/PlantClone/getPlantClone";
            break;
        case 3: //喷药
            url = "/PlantSpraying/getPlantSpraying";
            break;
        case 4: //施肥
            url = "/PlantFertilize/getPlantFertilize";
            break;
        case 5: //除草
            url = "/PlantWeeding/getPlantWeeding";
            break;
        case 6: //浇水
            url = "/PlantWater/getPlantWater";
            break;
        case 7: //其它
            url = "/PlantOther/getPlantOther";
            break;
        case 8: //采收
            url = "/PlantHarvest/getPlantHarvest";
            break;
        case 9: //清茬
            url = "/PlotClear/getPlotClear";
            break;
        case 10: //加工-------------------
            url = "/Process/GetProcess";
            break;
        case 11: //包装
            url = "/Package/getPackage";
            break;
        case 12: //销售----------------
            url = "";
            break;
        case 13: //授粉
            url = "/PlantPol/getPlantPol";
            break;
        case 14: //配制
            url = "/MushPre/getMushPre";
            break;
        case 15: //装袋
            url = "/MushBagging/getMushBagging";
            break;
        case 16: //灭菌
            url = "/MushSterilizing/getMushSterilizing";
            break;
        case 17: //接种
            url = "/MushVacc/getMushVacc";
            break;
        case 18: //培养
            url = "/MushFoster/getMushFoster";
            break;
        case 19: //出菇
            url = "/getMushRoom/MushRoom";
            break;
        case 20: //修剪
            url = "/PlotPrune/getPlotPrune";
            break;
        case 21: //疏花蔬果
            url = "/PlotLaxiflora/getPlotLaxiflora";
            break;
        case 22: //套袋
            url = "/PlotFruitBagging/getPlotFruitBagging";
            break;
        case 23: //换茬
            url = "/FruitRot/getFruitRot";
            break;
    }
    getAjax(url, { "ID": ID, "Type": "delete" }, function (data) {
        if (data.success) {
            alert(data.message);
            grid.reload();
        }
    })
}
