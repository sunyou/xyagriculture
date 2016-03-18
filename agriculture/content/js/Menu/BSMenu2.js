/// <reference path="../../../Pages/Plant/PlantOperate.aspx" />
/// <reference path="../../../Pages/Plant/PlantOperate.aspx" />
var indexdata = [
        {
            text: '基本资料', isexpand: true, children:
            [
                 {
                     text: '农资管理', isexpand: false, children:
                       [
                       { url: "/Pages/Base/Material/SupplierList.aspx", text: "农资经销商" },
                       { url: "/Pages/Audit/SupplierMaterialApply.aspx", text: "农资申请" },
                       { url: "/Pages/Audit/SupGoodsVarietyApply.aspx", text: "种苗申请" },
                       { url: "/Pages/Base/Material/GoodVarietyList.aspx", text: "种苗" },
                       { url: "/Pages/Base/Material/PesticidesList.aspx", text: "农药" },
                       { url: "/Pages/Base/Material/FertilizerList.aspx", text: "化肥" },
                       { url: "/Pages/Base/Material/OtherList.aspx", text: "其他" },
                       ]
                 }
            ]
        }
];