<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BsMenu.aspx.cs" Inherits="JHRZ.Sapt.Web.Pages.BsMenu" %>

<%@ Import Namespace="JHRZ.Utils" %>

<%
    if (LoginUser.LoginMenu=="1"&&(LoginUser.UserType == (int)LoginUserType.CofarmerUser || LoginUser.UserType == (int)LoginUserType.AdminUser))
    {%>

var indexdata = [
        {text: '基本资料', isexpand: true, children:[
                    { url: "/Pages/Base/Info/CoFarmerDet.aspx", text: "我的资料" },
					{ url: "/Pages/Base/Info/FarmerList.aspx", text: "农户" },
                    { url: "/Pages/Base/Info/TechnicianList.aspx", text: "技术员" },
                    { url: "/Pages/Base/Info/PlantBaseList.aspx", text: "种植基地" },
                    { url: "/Pages/Base/Info/GoodsList.aspx", text: "农作物" },
                    { url: "/Pages/Base/Material/InquiryList.aspx", text: "我的质询" }
                    ]
                },
        {text: '三品一标', isexpand: false, children:[
                       { url: "/Pages/Base/Info/FoodGradeList.aspx", text: "农产品等级" },
                       { url: "/Pages/Base/Info/OneIdenList.aspx", text: "地理标志" }
            ]
        }, 
        {text: '投入品管理', isexpand: false, children:[
                  { url: "/Pages/Base/Material/PesticidesList.aspx", text: "国家农药标准库" },
                  { url: "/Pages/Base/Material/FertilizerList.aspx", text: "国家化肥标准库" },
                  { url: "/Pages/Base/Material/GoodVarietyList.aspx", text: "种苗" },
                  { url: "/Pages/Base/Material/OtherList.aspx", text: "其它农资" },
                  { url: "/Pages/Base/Info/CoFarmerMaterialList.aspx", text: "农资采购" }
            ]
        },   
        
        {text: '种植管理', isexpand: false, children: [
                { url: "/Pages/Plant/Archives/Criteria.aspx", text: "种植标准" },
                { url: "/pages/Plant/PlantOperate.aspx", text: "农事操作" },
				{ url: "/Pages/Plant/Vegetables/PlantLot_List.aspx", text: "种植批次" },
                { url: "/Pages/Standard/Standard.aspx", text: "食品标准" }
            ]
        },
		{text: '种植档案', isexpand: false, children: [
                { url: "/Pages/Plant/Archives/PlantArchives.aspx", text: "种植档案" }
            ]
        },
        {text: '质量检测', isexpand: false, children: [
            { url: "/Pages/Detection/DetectionList.aspx", text: "农产品检测" },
            { url: "/Pages/Warning/VegWarning.aspx", text: "农产品预警" },
            { url: "/Pages/Warning/CallBack.aspx", text: "农产品召回" }]
        },{text: '加工包装', isexpand: false, children: [
            { url: "/Pages/Trade/StoreHouse.aspx", text: "仓库管理" },
            { url: "/Pages/Label/ApplyLabelList.aspx", text: "标签申请" },
            { url: "/Pages/Label/ApplyLabelPrint.aspx", text: "标签打印" },
            { url: "/Pages/Label/LabelNote.aspx", text: "标签管理" },
            { url: "/Pages/Trade/GoodsStorage.aspx", text: "农产品存储" },
            { url: "/Pages/Trade/Process.aspx", text: "农产品加工" },
            { url: "/Pages/Package/Package.aspx", text: "农产品包装" },
            { url: "/Pages/Trade/TranSport.aspx", text: "农产品运输" }]
        },
        {text: '流通销售', isexpand: false, children: [
            { url: "/Pages/Trade/CSale.aspx", text: "销售出库" }]
        },
		{text: '病虫害诊断', isexpand: false, children: [
            { url: "/Pages/Pest/GoodsPest.aspx", text: "农作物病虫害" },
            { url: "/Pages/Pest/PestInfo.aspx", text: "病虫害信息" },
            { url: "/Pages/Pest/PestDiag.aspx", text: "病虫害诊断" }
            ]
        },
	    {text: '统计分析', isexpand: false, children: [
            { url: "/pages/chart/AreasPlot.aspx?type=1", text: "生产者种植面积统计" },
            { url: "/pages/chart/PlotHarvestPlot.aspx", text: "采收量统计报表" }
            ]
	    },
        {text: '我的物流', isexpand: false, children: [
            { url: "/Pages/PostMap/CarList.aspx", text: "车辆管理" },
            { url: "/Pages/PostMap/DriverList.aspx", text: "司机管理" },
            { url: "/Pages/PostMap/IG_DeliverList.aspx", text: "发货单管理" },
            { url: "/Pages/PostMap/IG_RecList.aspx", text: "收货单管理" }
            ]
        },
        {text: '后台设置', isexpand: false, children: [
            { url: "/Pages/User/MyUser.aspx", text: "我的账号" },
            { url: "/Pages/User/UserList.aspx", text: "其他用户" },
            { url: "#",active:false, text: "报表字段定制" },
            { url: "#",active:false, text: "数据接口管理" }
            ]
        }
];       <% 
    } 
%>
<%
    else if (LoginUser.LoginMenu=="10"&&(LoginUser.UserType == (int)LoginUserType.GovUser|| LoginUser.UserType == (int)LoginUserType.AdminUser))
    {%>
var indexdata = [
    {
        text: '审核信息', isexpand: true, children:
        [
            { url: "/Pages/Audit/CoFarmerAudit.aspx", text: "生产者审核" },
            { url: "/Pages/Audit/SupplierAudit.aspx", text: "农资经销商审核" },		    
            { url: "/Pages/Audit/SupplierMaterialAudit.aspx", text: "农资准入审核" },
            { url: "/Pages/Audit/SupGoodsVarietyAudit.aspx", text: "种苗准入审核" },
            { url: "/Pages/Label/ApplyLabelList.aspx", text: "标签审核" }  
	    ]
    },{
                text: '农资监管', isexpand: false, children:
                  [
                  { url: "/Pages/Base/Material/PesticidesList.aspx", text: "国家农药标准库" },
                  { url: "/Pages/Base/Material/FertilizerList.aspx", text: "国家化肥标准库" },
                  { url: "/Pages/Base/Material/SupplierList.aspx", text: "农资经销商" },
                  { url: "/Pages/Base/Material/GoodVarietyList.aspx", text: "种苗" },
                  { url: "/Pages/Base/Material/OtherList.aspx", text: "其它农资" },
                  { url: "/Pages/Base/Info/CoFarmerFLList.aspx", text: "肥料采购" },
                  { url: "/Pages/Base/Info/CoFarmerNYList.aspx", text: "农药采购" },
                  { url: "/Pages/Base/Material/CoFarmerFLList.aspx", text: "肥料使用" },
                  { url: "/Pages/Base/Material/CoFarmerNYList.aspx", text: "农药使用" },
                  { url: "/Pages/Base/Material/InquiryList.aspx", text: "质询反馈" }
                  ]
            },    
            { text: '生产监管', isexpand: false, children:
                [
				{ url: "/Pages/Base/Info/CoFarmerList.aspx", text: "生产者列表" },
                { url: "/Pages/Base/Info/FarmerList.aspx", text: "农户列表" },
                { url: "/Pages/Base/Info/TechnicianList.aspx", text: "技术员列表" },
                { url: "/Pages/Base/Info/GoodsList.aspx", text: "农作物列表" },
                { url: "/Pages/Base/Info/PlantBaseList.aspx", text: "种植区域" },
				{ url: "/Pages/Plant/Archives/Criteria.aspx", text: "种植标准" },
				{ url: "/Pages/Plant/Archives/PlantArchives.aspx", text: "种植档案" },
				{ url: "/Pages/Package/Package.aspx", text: "农产品包装" },
				{ url: "/Pages/Detection/DetectionList.aspx", text: "农产品检测" },
				{ url: "/Pages/Label/LabelPrintCount.aspx", text: "溯源码管理" }
				 ]
            },
     {text: '三品一标管理', isexpand: false, children:[
                       { url: "/Pages/Base/Info/FoodGradeList.aspx", text: "农产品等级" },
                       { url: "/Pages/Base/Info/OneIdenList.aspx", text: "地理标志" }
            ]
        }, 
    {
            text: '预警召回', isexpand: false, children:
            [
		        { url: "/Pages/Warning/VegWarning.aspx", text: "农产品预警" },
                { url: "/Pages/Warning/CallBack.aspx", text: "产品召回申请" },
                { url: "/Pages/Warning/CallBack.aspx", text: "产品召回排查" },
                { url: "/Pages/Warning/CallBack.aspx", text: "产品召回处理" }
		    ]
    },
	{
	    text: '统计分析', isexpand: false, children: [
            { url: "/pages/chart/CoFarmerChart.aspx", text: "合作社统计" },
            { url: "/pages/chart/AreasPlot.aspx?type=1", text: "农作物种植面积统计" },  
            { url: "/pages/chart/SingleGoodsPlantChart.aspx", text: "单一农作物种植面积统计" },   
            { url: "/pages/chart/SupplierChart.aspx", text: "农资经销商统计" },  
            { url: "/pages/chart/CofarmerLot.aspx?type=1", text: "生产者种植面积统计" },
            { url: "/pages/chart/PlotHarvestPlot.aspx", text: "采收量统计报表" },
            {
                text: '标签打印统计', isexpand: true, children: [
                    { url: "/Pages/Chart/LabelByDateChart.aspx", text: "按时间统计" },
                    { url: "/Pages/Chart/LabelByCoFarmerChart.aspx", text: "按生产者统计" }
                ]
            },
            
        ]
	},{
            text: '病虫害诊断', isexpand: false, children:
              [
		        { url: "/Pages/Pest/GoodsPest.aspx", text: "农作物病虫害" },
		        { url: "/Pages/Pest/PestInfo.aspx", text: "病虫害信息" },
		        { url: "/Pages/Pest/PestDiag.aspx", text: "病虫害诊断" }
		      ]
    },
              
          <%-- { text: '监管部门', isexpand: false, children: 
                [
                    { url: "/Pages/Base/Gov/GovDept.aspx", text: "监管部门" }
                ]
           },--%>
    {
            text: '系统设置', isexpand: false, children:
            [
                { url: "/Pages/Base/Gov/ZJJList.aspx", text: "监管部门用户" },
		        { url: "/Pages/Base/Gov/CoFarmerList.aspx", text: "生产者用户" },
		        { url: "/Pages/Base/Gov/SupplierList.aspx", text: "农资经销商" },
                {url: "/Pages/ZZ_Role/UserRole.aspx", text: "用户权限" } 
		    ]
    }
];
 <% 
    } 
 %>

<% 
    else if (LoginUser.LoginMenu=="2"&&(LoginUser.UserType == (int)LoginUserType.SupplierUser || LoginUser.UserType == (int)LoginUserType.AdminUser))
    {%>
var indexdata = [
        {
            text: '基本资料', isexpand: true, children:
            [                 
               { url: "/Pages/Base/Material/SupplierDet.aspx", text: "基本资料" },
               { url: "/Pages/Audit/SupplierMaterialApply.aspx", text: "农资申请" },
               { url: "/Pages/Audit/SupGoodsVarietyApply.aspx", text: "种苗申请" },
               { url: "/Pages/Audit/VeterinaryAudit.aspx", text: "兽药申请" },
               { url: "/Pages/Audit/FeedAudit.aspx", text: "饲料申请" },
               { url: "/Pages/Base/Material/GoodVarietyList.aspx", text: "种苗列表" },
               { url: "/Pages/Base/Material/PesticidesList.aspx", text: "农药列表" },
               { url: "/Pages/Base/Material/GoodVarietyList.aspx", text: "种苗列表" },
               { url: "/Pages/Base/Material/VeterinaryList.aspx", text: "兽药列表" },
               { url: "/Pages/Base/Material/FeedList.aspx", text: "饲料列表" },
               { url: "/Pages/Base/Material/OtherList.aspx", text: "其他" }
            ]
        },
        {
            text: '购销台账', isexpand: true, children:
            [                 
               { url: "/Pages/TaiZhang/JinHuoList.aspx", text: "进货台账" },
               { url: "/Pages/TaiZhang/SSaleList.aspx", text: "销售台账" }
            ]
        }
];
       <% 
    } 
       %>
