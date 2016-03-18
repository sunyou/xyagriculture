<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>经销商详细信息</title>
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
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript">
        var grid2 = null;
        var grid1 = null;
        var grid3 = null;
        var grid4 = null;
        var supplierID = '${supplierId}';
        $(document).ready(function () {
            $('#layout').ligerLayout({ topHeight: 160, allowTopResize: false });
           
            grid1 = $("#fertilizer").createLigerGrid({
                header: [
                    { display: '肥料名称', render: function (rowdata, index, value) { 
							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showFLDetail(\""+ rowdata['MATERIAL_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['MATERIAL_NAME'] +"</a>"
						}, width: '200'
					},
                    { display: '通用名', name: 'CommonName' },
                    { display: '主要成分', name: 'MainComponent', width: '300' },
                    { display: '适用对象', name: 'UsableRange', width: '300' }
                ],
                param: { 'flag': 1, MaterialType_Code: 1, "Supplier_ID": supplierID },
                height: '300',
                editor: {
                    width: 430,
                    height: 200
                },
                leftBtns: {
                show:false   
                <shiro:hasPermission name="2601:supplier.edit">     
                	,show:true, 
                    showDelete: {
                        close: function () {
                            grid.reload();
                        }
                    },
                    showDetail: {
                    	show: false,
                    	url: "${ctx}/Base/Material/MaterialFLDet.html",
                    	width:660,
                        height: 360
                    },
                    showEdit: {
                        show: false,
                        width:660,
                        height: 360
                    }
                    </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "MATERIAL_ID",
                ajaxURL: "${ctx}/Base/Material/GetMaterialFL.ajax"
            });
            
            grid2 = $("#Pesticides").createLigerGrid({
                header: [
                    { display: '农药名称', render: function (rowdata, index, value) { 
							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showMaterialDetail(\""+ rowdata['MATERIAL_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['MATERIAL_NAME'] +"</a>"
						}, width: '200'
					},
                    { display: '常用名', name: 'CommonName' },
                    { display: '毒性', name: 'ToXicity' },
                    { display: '主要成分', name: 'MainComponent', width: '300' },
                    { display: '适用对象', name: 'UsableRange', width: '300' }
                ],
                param: { 'flag': 1, MaterialType_Code: 2, "Supplier_ID": supplierID },
                height: '300',
                editor: {
                    width: 460,
                    height: 200
                },
                leftBtns: {
                  show:false   
                <shiro:hasPermission name="2601:supplier.edit">     
                	,show:true, 
                    showDelete: {
                    	url: "${ctx}/Base/Material/delMaterialNYById.ajax",
                        close: function () {grid.reload(); }

                    },
                    showDetail: {
                    	show: false,
                    	url: "${ctx}/Base/Material/MaterialNYDet.html",
                        width:660,
                        height: 360

                    },
                    showEdit: {
                    	show:false,
                        url: "${ctx}/Base/Material/PesticidesEdit.html",
                        width:660,
                        height: 360
                    }
                     </shiro:hasPermission>
                },
                
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "MATERIAL_ID",
                ajaxURL: "${ctx}/Base/Material/GetMaterialNY.ajax"
            });
            grid3 = $("#GoodVariety").createLigerGrid({
                header: [
                    { display: '作物名称', name: 'Goods_Name', render: function (rowdata, index, value) { 
						return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showGoodsDetail(\""+ rowdata['GOODVARIETY_ID'] +"\", \""+  rowdata['GOODS_NAME']  +"\")'>"+ rowdata['GOODS_NAME'] +"</a>"; 
						} 
					},
                    { display: '品种名称', name: 'GoodVariant_Name', width: '200' },
                    { display: '产地', name: 'Origin' },
                    { display: '检疫证', name: 'Pratique', width: '200' }
                ],
                param: { 'flag': 1, "Supplier_ID": supplierID },
                height: '300',
                editor: {
                    width: 420,
                    height: 200
                },
                leftBtns: {
                 show:false   
                <shiro:hasPermission name="2601:supplier.edit">     
                	,show:true, 
                    showDelete: {
                        close: function () {
                            grid.reload();
                        }
                    },
                    showDetail: {
                    	show: false,
                        url: "${ctx}/Base/Material/GoodVarietyDet.html",
                        width:660,
                        height: 360
                    },
                    showEdit: {
                        show: false,
                        width:660,
                        height: 360
                    }
                     </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "GOODVARIETY_ID",
                ajaxURL: "${ctx}/Base/Material/GetGoodVariety.ajax"
            });
            grid4 = $("#Other").createLigerGrid({
                header: [
                    { display: '物资名称', name: 'MATERIAL_NO' ,width:200, render: function (rowdata, index, value) { 
								return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showOtherDetail(\""+ rowdata['MATERIAL_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['MATERIAL_NAME'] +"</a>"; 
							} 
		             },
                    { display: '通用名', name: 'CommonName' }
                ],
                param: { 'flag': 1, MaterialType_Code: 9, "Supplier_ID": supplierID },
                editor: {
                    width: 490,
                    height: 200
                },
                height: '300',
                leftBtns: {
                show:false
                  <shiro:hasPermission name="2601:supplier.edit">     
                	,show:true, 
                    showDelete: {
                        close: function () {
                            grid.reload();
                        }
                    },
                    showDetail: {
                    	show: false,
                        url: "${ctx}/Base/Material/OtherDet.html",
                        width:660,
                        height: 360
                    },
                    showEdit: {
                    	show:false,
                        url: "${ctx}/Base/Material/OtherEdit.html",
                        width:660,
                        height: 360,
						close: function () {
                            grid.reload();
						}
                    }
                     </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "MATERIAL_ID",
                ajaxURL: "${ctx}/Base/Material/GetOtherList.ajax"
            });
            
            var ligTab = $('#materials').ligerTab();
            //ligTab.addTabItem({title:'',});
        });
        
        //种苗详情
        function showGoodsDetail(id, name){
        	ligerWin(660, 360,"${ctx}/Base/Material/GoodVarietyDet.html?id="+id,"查看种苗 " + name + " 的详情");
        }
        //农药详情
        function showMaterialDetail(id, name){
        	ligerWin(660, 360,"${ctx}/Base/Material/MaterialNYDet.html?type=3&id="+id,"查看 " + name + " 的详情");
        }
        //化肥详情
        function showFLDetail(id, name){
           	ligerWin(660, 360,"/agriculture/Base/Material/MaterialFLDet.html?type=3&id="+id,"查看 " + name + " 的详情");
        }
        function gotoShow(Id ,Name){
        	myopen("${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html?type=3&id="+Id,"查看采购 " + Name + " 的详情"  ,660,360);
        }
        
        
        //其它农资详情
        function showOtherDetail(id, name){
			ligerWin(660, 360,"${ctx}/Base/Material/OtherDet.html?id="+id,"查看农资 " + name + " 的详情");
		}

    </script>
</head>
<body>
    <div id="layout">
        <div position="top">
            <div id="MaterialsBody">
                <table class="data_grid" width="100%">
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <font color="#0090D7">${bean.supplierName }的详细信息</font>
                            </td>
                        </tr>
                        <tr>
                            <td width="80">编号
                            </td>
                            <td>
                                ${bean.supplierNo }
                            </td>
                            <td width="80">经销商
                            </td>
                            <td>
                                ${bean.supplierName }
                            </td>
                        </tr>
                        <tr>
                            <td>注册日期
                            </td>
                            <td>
                            	<fmt:formatDate value="${bean.recordDate }" pattern="yyyy年MM月dd日" />
                                
                            </td>
                            <td>法定代表人
                            </td>
                            <td>
                                ${bean.legalRepresent }
                            </td>
                        </tr>
                        <tr>
                            <td>地址
                            </td>
                            <td>
                                ${bean.supplierAddress }
                            </td>
                            <td>注册资金
                            </td>
                            <td>
                                ${bean.regCapital }（万元）
                            </td>
                        </tr>
                        <tr>
                            <td>登记证号
                            </td>
                            <td>
                                ${bean.licenseNumber }
                            </td>

                            <td>联系人
                            </td>
                            <td>
                                ${bean.contact }
                            </td>
                        </tr>
                        <tr>
                            <td>电话
                            </td>
                            <td>
                                 ${bean.tel }
                            </td>
                            <td>邮箱
                            </td>
                            <td>
                                 ${bean.email }
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div position="center">
            <div id="materials">
                <div title="肥料" lselected="true">
                    <div id="fertilizer"></div>
                </div>
                <div title="农药" showclose="true">
                    <div id="Pesticides"></div>
                </div>
                <div title="种苗" showclose="true">
                    <div id="GoodVariety"></div>
                </div>
                <div title="其它" showclose="true">
                    <div id="Other"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

