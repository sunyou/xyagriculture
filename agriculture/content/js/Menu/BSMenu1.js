/// <reference path="../../../Pages/Plant/PlantOperate.aspx" />
/// <reference path="../../../Pages/Plant/PlantOperate.aspx" />
var indexdata = [
        {
            text: '基本资料', isexpand: true, children:
            [
                {
                    text: '生产者', isexpand: true, children:
                    [
                    { url: "/Pages/Base/Info/CoFarmerInfo.aspx", text: "基本资料" },
		    { url: "/Pages/Base/Info/FarmerList.aspx", text: "农户" },
                    { url: "/Pages/Base/Info/PlantBaseList.aspx", text: "种植基地" },
                    { url: "/Pages/Base/Info/PlotList.aspx", text: "种植区域" },                    
                    { url: "/Pages/Base/Info/TechnicianList.aspx", text: "技术员" },
                    { url: "/Pages/Base/Info/GoodsList.aspx", text: "农作物" }
                    ]
                },
                 {
                     text: '农资管理', isexpand: false, children:
                       [
                       { url: "/Pages/Base/Material/SupplierList.aspx", text: "农资经销商" },
                       { url: "/Pages/Base/Material/GoodVarietyList.aspx", text: "种苗" },
                       { url: "/Pages/Base/Material/PesticidesList.aspx", text: "农药" },
                       { url: "/Pages/Base/Material/FertilizerList.aspx", text: "化肥" },
                       { url: "/Pages/Base/Material/OtherList.aspx", text: "其他" },
                       ]
                 }
                ]
        },       
        {
            text: '种植档案', isexpand: false, children: [
                { url: "/Pages/Plant/Archives/Criteria.aspx", text: "种植标准" },
                { url: "/Pages/Plant/Archives/PlantArchives.aspx", text: "种植档案" }
            ]
        },
        {
            text: '种植管理', isexpand: false, children: [

                { url: "/pages/Plant/PlantOperate.aspx", text: "种植管理" }

                // {
                //     text: '蔬菜种植管理', isexpand: false, children:
                //         [
                //             { url: "/pages/Plant/Vegetables/PlantLot_List.aspx", text: "种植批次" },
                //             { url: "/pages/Plant/Vegetables/PlantOther.aspx", text: "其他操作" },
                //             { url: "/pages/Plant/Vegetables/PlantClone.aspx", text: "播种定植" },
                //             { url: "/pages/Plant/Vegetables/PlantSowing.aspx", text: "整地" },
                //             { url: "/pages/Plant/Vegetables/PlantSpraying.aspx", text: "喷药" },
                //             { url: "/pages/Plant/Vegetables/PlantFertilize.aspx", text: "施肥" },
                //             { url: "/pages/Plant/Vegetables/PlantWeeding.aspx", text: "除草" },
                //             { url: "/pages/Plant/Vegetables/PlantPollination.aspx", text: "授粉" },
                //             { url: "/pages/Plant/Vegetables/PlantWater.aspx", text: "浇水" },
                //             { url: "/pages/Plant/Vegetables/PlantHarvest.aspx", text: "采收" },
                //             { url: "/pages/Plant/Vegetables/PlantClear.aspx", text: "清茬" }
                //         ]
                // },
                //{
                //    text: '食用菌种植管理', isexpand: false, children:
                //        [
                //            { url: "/pages/Plant/Mushrooms/PlantLot_List.aspx", text: "种植批次" },
                //            { url: "/pages/Plant/Mushrooms/Preparation.aspx", text: "原料准备" },
                //            { url: "/pages/Plant/Mushrooms/MushtBagging.aspx", text: "装袋封口" },
                //            { url: "/pages/Plant/Mushrooms/MushSterilizing.aspx", text: "高压灭菌" },
                //            { url: "/pages/Plant/Mushrooms/MushVaccinate.aspx", text: "冷却接种" },
                //            { url: "/pages/Plant/Mushrooms/MushFoster.aspx", text: "菌袋培养" },
                //            { url: "/pages/Plant/Mushrooms/Mushroom.aspx", text: "出菇管理" },
                //            { url: "/pages/Plant/Mushrooms/MushHarvest.aspx", text: "采收" },
                //            { url: "/pages/Plant/Mushrooms/MushClear.aspx", text: "清茬" }
                //        ]
                //},
                //{
                //    text: '水果种植管理', isexpand: false, children:
                //        [
                //            { url: "/pages/Plant/Fruit/FruitLot.aspx", text: "种植批次" },
                //            { url: "/pages/Plant/Fruit/PLotSowing.aspx", text: "松土整地" },
                //            { url: "/pages/Plant/Fruit/PLotClone.aspx", text: "育苗定植" },
                //            { url: "/pages/Plant/Fruit/PLotFertilize.aspx", text: "施肥" },
                //            { url: "/pages/Plant/Fruit/PLotWatering.aspx", text: "浇水" },
                //            { url: "/pages/Plant/Fruit/PLotPollination.aspx", text: "授粉" },
                //            { url: "/pages/Plant/Fruit/PLotWeeding.aspx", text: "除草" },
                //            { url: "/pages/Plant/Fruit/PLotSpray.aspx", text: "喷药" },
                //            { url: "/pages/Plant/Fruit/PLotPrune.aspx", text: "修剪" },
                //            { url: "/pages/Plant/Fruit/PLotLaxiflora.aspx", text: "疏花疏果" },
                //            { url: "/pages/Plant/Fruit/PlotFruitBagging.aspx", text: "套袋" },
                //            { url: "/pages/Plant/Fruit/PLotRotationCrops.aspx", text: "轮作换茬" },
                //            { url: "/pages/Plant/Fruit/PLotHarvest.aspx", text: "采收" },
                //            { url: "/pages/Plant/Fruit/PLotClear.aspx", text: "清茬" }
                //        ]
                //}
            ]
        },
        {
            text: '病虫害诊断', isexpand: false, children: [
            { url: "/Pages/Pest/GoodsPest.aspx", text: "农作物病虫害" },
            { url: "/Pages/Pest/PestInfo.aspx", text: "病虫害信息" },
            { url: "/Pages/Pest/PestDiag.aspx", text: "病虫害诊断" }
            ]
        },
        {
            text: '质量检测', isexpand: false, children: [
            { url: "/Pages/Detection/DetectionList.aspx", text: "农产品检测" },
            { url: "/Pages/Warning/VegWarning.aspx", text: "蔬菜预警" },
            { url: "/Pages/Warning/CallBack.aspx", text: "产品召回" }
            ]
        },
        {
            text: '加工包装', isexpand: false, children: [
            { url: "/Pages/Package/Package.aspx", text: "农产品包装" }
            ]
        },
	    {
	        text: '统计分析', isexpand: false, children: [
            { url: "/pages/chart/AreasPlot.aspx?type=1", text: "生产者种植面积统计" },
            { url: "/pages/chart/AreasPlot.aspx?type=2", text: "生产者面积统计" },
            { url: "/pages/chart/CofarmerLot.aspx?type=1", text: "合作社种植面积统计" },
            { url: "/pages/chart/AreasPlot.aspx?type=3", text: "合作社土地面积统计" },
            { url: "/pages/chart/PlotHarvestPlot.aspx", text: "采收量统计报表" }]
	    }
];