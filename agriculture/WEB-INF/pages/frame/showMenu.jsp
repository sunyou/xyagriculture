<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


var indexdata = [
        {text: '我的档案', isexpand: false, children:[
                    { url: "${ctx}/Base/Info/CoFarmerBaseInfo.html", text: "我的资料" },
                    { url: "${ctx}/Base/Info/CoFarmerDet.html", text: "生产商" },
					{ url: "${ctx}/Base/Info/FarmerList.html", text: "农户" },
                    { url: "${ctx}/Base/Info/TechnicianList.html", text: "技术员" },
                    { url: "${ctx}/Base/Info/PlantBaseList.html", text: "种植基地" },
                    { url: "${ctx}/Base/Info/GoodsList.html", text: "农作物" },
                    { url: "${ctx}/Base/Material/InquiryList.html", text: "我的质询" },<!-- 监管平台为：质询反馈 -->
               		{ url: "${ctx}/Base/Info/FoodGradeList.html", text: "农产品等级" },
                    { url: "${ctx}/Base/Info/OneIdenList.html", text: "地理标志" },
                    { url: "${ctx}/Base/Material/SupplierDet.html", text: "基本资料" },
	                { url: "${ctx}/Base/Material/VeterinaryList.html", text: "兽药列表" },
	                { url: "${ctx}/Base/Material/FeedList.html", text: "饲料列表" },
	                { url: "${ctx}/Audit/SupplierMaterialApply.html", text: "农资申请" },
               		{ url: "${ctx}/Audit/SupGoodsVarietyApply.html", text: "种苗申请" },
               		{ url: "${ctx}/Audit/VeterinaryAudit.html", text: "兽药申请" },
               		{ url: "${ctx}/Audit/FeedAudit.html", text: "饲料申请" }
                    ]
        },
        {text: '采购管理', isexpand: false, children:[
                  { url: "${ctx}/Base/Material/GoodVarietyList.html", text: "种苗" },
                  { url: "${ctx}/Base/Info/CoFarmerMaterialList.html", text: "农资采购" },
                  { url: "${ctx}/Base/Material/OtherList.html", text: "其它农资" }
            ]
        }, 
        {text: '种植管理', isexpand: false, children:[
                  	{ url: "${ctx}/Plant/FarmingOperate.html", text: "农事操作" },
				  	{ url: "${ctx}/Plant/Vegetables/PlantLot_List.html", text: "种植批次" },
                  	{ url: "aa", text: "智能诊断" },
                  	{ url: "${ctx}/Plant/Archives/PlantFiles.html", text: "种植档案" }
            ]
        },
        {text: '质量检测', isexpand: false, children:[
                  	{ url: "${ctx}/Detection/detection_list.html", text: "农产品检测" },
            		{ url: "${ctx}/Warning/salert_list.html", text: "农产品预警" },
            		{ url: "${ctx}/Warning/recall_list.html", text: "农产品召回" }
            ]
        },
        {text: '加工包装', isexpand: false, children:[
                  	{ url: "${ctx}/Trade/StoreHouse.html", text: "仓库管理" },
            		{ url: "${ctx}/Label/ApplyLabelList.html", text: "标签申请" },<!-- 监管平台为：标签审核 -->
            		{ url: "${ctx}/Label/ApplyLabelPrint.html", text: "标签打印" },
            		{ url: "${ctx}/Label/LabelNote.html", text: "标签管理" },
            		{ url: "${ctx}/Trade/GoodsStorage.html", text: "农产品存储" },
            		{ url: "${ctx}/Trade/Process.html", text: "农产品加工" },
            		{ url: "${ctx}/Package/Package.html", text: "农产品包装" },
            		{ url: "${ctx}/Trade/TranSport.html", text: "农产品运输" }
            ]
        },
        {text: '销售物流', isexpand: false, children: [
                { url: "${ctx}/Trade/CSale.html", text: "销售记录" },
            	{ url: "${ctx}/PostMap/IG_DeliverList.html", text: "发货单管理" },
            	{ url: "${ctx}/PostMap/IG_RecList.html", text: "收货单管理" },
                { url: "${ctx}/PostMap/CarList.html", text: "车辆信息" },
            	{ url: "${ctx}/PostMap/DriverList.html", text: "司机信息" },
            ]
        },
		{text: '规范标准', isexpand: false, children: [
                { url: "${ctx}/Base/Material/PesticidesList.html", text: "国家农药标准库" },<!-- 经销商平台为： 农药列表-->
                { url: "${ctx}/Base/Material/FertilizerList.html", text: "国家化肥标准库" },
                { url: "${ctx}/Plant/Archives/Criteria.html", text: "种植标准" },
                { url: "${ctx}/Standard/Standard.html", text: "食品标准" },
                { url: "${ctx}/Pest/GoodsPest.html", text: "农作物病虫害" },
                { url: "${ctx}/Pest/PestInfo.html", text: "病虫害知识库" }
            ]
        },
	    {text: '统计分析', isexpand: false, children: [
            { url: "${ctx}/chart/AreasPlot.html?type=1", text: "生产者种植面积统计" },
            { url: "${ctx}/chart/PlotHarvestPlot.html", text: "采收量统计报表" },
            { url: "${ctx}/chart/CoFarmerChart.html", text: "合作社统计" },
            { url: "${ctx}/chart/SingleGoodsPlantChart.html", text: "单一农作物种植面积统计" },   
            { url: "${ctx}/chart/SupplierChart.html", text: "农资经销商统计" },  
            { url: "${ctx}/chart/CofarmerLot.html?type=1", text: "生产者种植面积统计" },
            {
                text: '标签打印统计', isexpand: true, children: [
                    { url: "${ctx}/Chart/LabelByDateChart.html", text: "按时间统计" },
                    { url: "${ctx}/Chart/LabelByCoFarmerChart.html", text: "按生产者统计" }
                ]
            }
            ]
	    }
	    <%--监管者暂时屏蔽,
        {text: '农资监管', isexpand: false, children:[
                  { url: "${ctx}/Base/Material/SupplierList.html", text: "农资经销商" },                  
                  { url: "${ctx}/Base/Material/CoFarmerFLList.html", text: "肥料使用" },
                  { url: "${ctx}/Base/Material/CoFarmerNYList.html", text: "农药使用" },
                  { url: "${ctx}/Base/Info/CoFarmerFLList.html", text: "肥料采购" },
                  { url: "${ctx}/Base/Info/CoFarmerNYList.html", text: "农药采购" }
                  ]
        },
        {text: '审核信息', isexpand: false, children:[
                  { url: "${ctx}/Audit/CoFarmerAudit.html", text: "生产者审核" },
            { url: "${ctx}/Audit/SupplierAudit.html", text: "农资准入审核" },		    
            { url: "${ctx}/Audit/SupplierMaterialAudit.html", text: "农资准入审核" },
            { url: "${ctx}/Audit/SupGoodsVarietyAudit.html", text: "种苗准入审核" }
            ]
        },
        { text: '生产监管', isexpand: false, children:
                [
				{ url: "${ctx}/Base/Info/CoFarmerList.html", text: "生产者列表" },
				{ url: "${ctx}/Label/LabelPrintCount.html", text: "溯源码管理" }
				 ]
        },
        {
            text: '购销台账', isexpand: true, children:
            [                 
               { url: "${ctx}/TaiZhang/JinHuoList.html", text: "进货台账" },
               { url: "${ctx}/TaiZhang/SSaleList.html", text: "销售台账" }
            ]
        },
    	{
            text: '系统设置', isexpand: false, children:
            [
                { url: "${ctx}/Base/Gov/ZJJList.html", text: "监管部门用户" },
		        { url: "${ctx}/Base/Gov/CoFarmerList.html", text: "生产者用户" },
		        { url: "${ctx}/Base/Gov/SupplierList.html", text: "农资经销商" },
                {url: "${ctx}/ZZ_Role/UserRole.html", text: "用户权限" } 
		    ]
    	},
        {text: '后台设置', isexpand: false, children: [
            { url: "${ctx}/User/MyUser.html", text: "我的账号" },
            { url: "${ctx}/User/UserList.html", text: "其他用户" },
            { url: "#",active:false, text: "报表字段定制" },
            { url: "#",active:false, text: "数据接口管理" }
            ]
        }--%>
];