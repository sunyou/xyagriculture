var indexdata = [
    {
        text: '待审核信息', isexpand: true, children:
        [
            { url: "/Pages/Audit/CoFarmerAudit.aspx", text: "合作社审核" },
            { url: "/Pages/Audit/SupplierAudit.aspx", text: "经销商审核" },		    
            { url: "/Pages/Audit/SupplierMaterialAudit.aspx", text: "农资准入审核" },
            { url: "/Pages/Audit/SupGoodsVarietyAudit.aspx", text: "种苗准入审核" }
	    ]
    },
    {
        text: '基本资料', isexpand: false, children:
        [
            { text: '生产者', isexpand: false, children:
                [
                { url: "/Pages/Base/Info/CoFarmerList.aspx", text: "生产者列表" },
                { url: "/Pages/Base/Info/PlotList.aspx", text: "种植区域" },
                { url: "/Pages/Base/Info/FarmerList.aspx", text: "农户" },
                { url: "/Pages/Base/Info/TechnicianList.aspx", text: "技术员" },
                { url: "/Pages/Base/Info/GoodsList.aspx", text: "农作物" },
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
            },      
           { text: '监管部门', isexpand: false, children: 
                [
                    { url: "/Pages/Base/Gov/GovDept.aspx", text: "监管部门" },
                    { url: "/Pages/Base/Gov/GovUser.aspx", text: "溯源管理用户" },
                ]
           }
       ]
    },
    {
            text: '病虫害诊断', isexpand: false, children:
              [
		        { url: "/Pages/Pest/GoodsPest.aspx", text: "农作物病虫害" },
		        { url: "/Pages/Pest/PestInfo.aspx", text: "病虫害信息" },
		        { url: "/Pages/Pest/PestDiag.aspx", text: "病虫害诊断" }
		      ]
    },
    {
          text: '溯源档案', isexpand: false, children:
            [
                { url: "/Pages/Plant/Archives/PlantArchives.aspx", text: "种植档案" },
                { url: "/Pages/Plant/Archives/Criteria.aspx", text: "种植标准" },
                { url: "/Pages/Package/Package.aspx", text: "农产品包装" },
                { url: "/Pages/Detection/DetectionList.aspx", text: "农产品检测" },
                { url: "/Pages/Plant/Archives/LabelPrintList", text: "溯源码管理" },
            ]
    },
    {
            text: '预警召回', isexpand: false, children:
            [
		        { url: "/Pages/Warning/VegWarning.aspx", text: "蔬菜预警" },
		        { url: "/Pages/Warning/CallBack.aspx", text: "产品召回" }
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