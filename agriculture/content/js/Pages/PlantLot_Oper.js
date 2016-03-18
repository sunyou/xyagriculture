/// <reference path="../../../Pages/Trade/ProcessEdit.aspx" />
/// <reference path="../../../Pages/Trade/ProcessEdit.aspx" />
function updateOne(type, ID) {
    var url = "";
    switch (type) {
        case 1: //整地
            url = "/Pages/Plant/Vegetables/PlantSowingEdit.aspx?Type=2&ID=" + ID;
            break;
        case 2: //播种定植
            url = "/Pages/Plant/Vegetables/PlantCloneEdit.aspx?Type=2&ID=" + ID;
            break;
        case 3: //喷药
            url = "/Pages/Plant/Vegetables/AddPlantSprayEdit.aspx?Type=2&ID=" + ID;
            break;
        case 4: //施肥
            url = "/Pages/Plant/Vegetables/AddPlantFertilizeEdit.aspx?Type=2&ID=" + ID;
            break;
        case 5: //除草
            url = "/Pages/Plant/Vegetables/PlantWeedingEdit.aspx?Type=2&ID=" + ID;
            break;
        case 6: //浇水
            url = "/Pages/Plant/Vegetables/PlantWaterEdit.aspx?Type=2&ID=" + ID;
            break;
        case 7: //其它
            url = "/Pages/Plant/Vegetables/PlantOtherEdit.aspx?Type=2&ID=" + ID;
            break;
        case 8: //采收
            url = "/Pages/Plant/Vegetables/PlantHarvestEdit.aspx?Type=2&ID=" + ID;
            break;
        case 9: //清茬
            url = "/Pages/Plant/Vegetables/PlantClearEdit.aspx?Type=2&ID=" + ID;
            break;
        case 10: //加工-------------------
            url = "/Pages/Trade/ProcessEdit.aspx?Type=2&ID=" + ID;
            break;
        case 11: //包装
            url = "/Pages/Package/PackageEdit.aspx?Type=2&ID=" + ID;
            break;
        case 12: //销售----------------
            url = "/Pages/Plant/Vegetables/PlantSowingEdit.aspx?Type=2&ID=" + ID;
            break;
        case 13: //授粉
            url = "/Pages/Plant/Fruit/FruitPlantPolEdit.aspx?Type=2&ID=" + ID;
            break;
        case 14: //配制
            url = "/Pages/Plant/Mushrooms/MushPreEdit.aspx?Type=2&ID=" + ID;
            break;
        case 15: //装袋
            url = "/Pages/Plant/Mushrooms/MushBaggingEdit.aspx?Type=2&ID=" + ID;
            break;
        case 16: //灭菌
            url = "/Pages/Plant/Mushrooms/MushSterilizingEdit.aspx?Type=2&ID=" + ID;
            break;
        case 17: //接种
            url = "/Pages/Plant/Mushrooms/MushVaccEdit.aspx?Type=2&ID=" + ID;
            break;
        case 18: //培养
            url = "/Pages/Plant/Mushrooms/MushFosterEdit.aspx?Type=2&ID=" + ID;
            break;
        case 19: //出菇
            url = "/Pages/Plant/Mushrooms/MushroomEdit.aspx?Type=2&ID=" + ID;
            break;
        case 20: //修剪
            url = "/Pages/Plant/Fruit/FruitPlantPruneEdit.aspx?Type=2&ID=" + ID;
            break;
        case 21: //疏花蔬果
            url = "/Pages/Plant/Fruit/FruitPlantLaxifloraEdit.aspx?Type=2&ID=" + ID;
            break;
        case 22: //套袋
            url = "/Pages/Plant/Fruit/FruitPlantFruitBaggingEdit.aspx?Type=2&ID=" + ID;
            break;
        case 23: //换茬
            url = "/Pages/Plant/Fruit/FruitPlantRotationCropsEdit.aspx?Type=2&ID=" + ID;
            break;
    }
    ligerWin(450, 350, url, '修改');
}
function DetailOne(type, ID) {
    var url = "";
    switch (type) {
        case 1: //整地
            url = "/Pages/Plant/Vegetables/PlantSowingDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 2: //播种定植
            url = "/Pages/Plant/Vegetables/PlantCloneDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 3: //喷药
            url = "/Pages/Plant/Vegetables/PlantSprayDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 430, url, '查看');
            break;
        case 4: //施肥
            url = "/Pages/Plant/Vegetables/PlantFertilizeDet.aspx?Type=2&ID=" + ID;
            ligerWin(500, 420, url, '查看');
            break;
        case 5: //除草
            url = "/Pages/Plant/Vegetables/PlantWeedingDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 6: //浇水
            url = "/Pages/Plant/Vegetables/PlantWaterDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 250, url, '查看');
            break;
        case 7: //其它
            url = "/Pages/Plant/Vegetables/PlantOtherDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 220, url, '查看');
            break;
        case 8: //采收
            url = "/Pages/Plant/Vegetables/PlantHarvestDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 300, url, '查看');
            break;
        case 9: //清茬
            url = "/Pages/Plant/Vegetables/PlantClearDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 200, url, '查看');
            break;
        case 10: //加工-------------------
            url = "/Pages/Trade/ProcessDet.aspx?ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 11: //包装
            url = "/Pages/Package/PackageDet.aspx?ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 12: //销售----------------
            url = "/Pages/Plant/Vegetables/PlantSowingDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 13: //授粉
            url = "/Pages/Plant/Fruit/FruitPlantPolDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 14: //配制
            url = "/Pages/Plant/Mushrooms/MushPreDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 15: //装袋
            url = "/Pages/Plant/Mushrooms/MushBaggingDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 250, url, '查看');
            break;
        case 16: //灭菌
            url = "/Pages/Plant/Mushrooms/MushSterilizingDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 280, url, '查看');
            break;
        case 17: //接种
            url = "/Pages/Plant/Mushrooms/MushVaccDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 220, url, '查看');
            break;
        case 18: //培养
            url = "/Pages/Plant/Mushrooms/MushFosterDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 19: //出菇
            url = "/Pages/Plant/Mushrooms/MushroomDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 20: //修剪
            url = "/Pages/Plant/Fruit/FruitPlantPruneDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 21: //疏花蔬果
            url = "/Pages/Plant/Fruit/FruitPlantLaxifloraDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 22: //套袋
            url = "/Pages/Plant/Fruit/FruitPlantFruitBaggingDet.aspx?Type=2&ID=" + ID;
            ligerWin(450, 350, url, '查看');
            break;
        case 23: //换茬
            url = "/Pages/Plant/Fruit/FruitPlantRotationCropsDet.aspx?Type=2&ID=" + ID;
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