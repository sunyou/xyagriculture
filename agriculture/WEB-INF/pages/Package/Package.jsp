<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>包装列表</title>
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
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript">
        var grid2 = null, grid = null;
        $(document).ready(function () {
 
            
            $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid_package").createLigerGrid({
                header: [
                    
                    { display: '包装编号', name: 'Package_No', width: '200' ,render:showDetail},
                     { display: '合作社名称/基地/地块/面积', name: 'CoFarmer_Name',width:'400',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCoFarmerDetail('"+rowdata["COFARMER_ID"]+"');\">"+rowdata["COFARMER_NAME"]+"</a>" + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
                        html = html +" / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+rowdata["PLOT_NAME"]+"</a>"
                        html = html + " /" + rowdata["AREAS"]+"(亩)"
                        return html ;
                    }},
                    { display: '包装日期', name: 'Package_Date', type: 'date', format: 'yyyy-MM-dd' },
                    {
                        display: '已打印数量/申请数量', name: 'PrintNum',width: '150', render: function (rowdata, index, value) {
                             var pnum=value;
                             var anum=rowdata["APPLYNUM"];
                             if(pnum==undefined){
                             pnum=0;
                             }
                             if(anum==undefined){
                             anum=0;
                             }
                           
                                return "<a title=\"点击查看\" onclick=\"parent.f_addTab(null,'标签列表','${ctx}/Label/LabelPrintList.html?Object_UID=" + rowdata["PACKAGE_UID"] + "');\" href=\"javascript:;\"><font color=\"#FF5500\">" + pnum + "</font></a> / "+anum;
                           
                        }
                    },
                  
                   { display: '包装产品 /包装数量/包装单位', name: 'Good_Value',width:'250',render:function(rowdata, index, value) {
                         var name=value;
                         if(value==undefined){
                       		name="";
                       }
                        var html = name + " / "+rowdata["AMOUT"]+ " / "+rowdata["UNITNAME"];
                       
                        return html ;
                    }},
                   
                    { display: '操作人', name: 'OperateUser' }
                    
                ],
				addTools: function (record, rowindex, value, column) {
                    return "<input type='button' class='rowSelectButton' value='申请打标' onclick=\"ligerWin(660,220, '${ctx}/Label/ApplyLabel.html?type=1&packageUid=" + record["PACKAGE_UID"] + "', '申请打标',function () {grid.reload();})\"/>";
                 //   return "<a href='javascript:;' onclick=\"ligerWin(660, 220, '${ctx}/Label/ApplyLabel.html?type=1&packageUid=" + record["PACKAGE_UID"] + "', '申请打标');\">申请打标</a>";
                },
            
                param: { 'flag': 1 },
               
                editor: {
                    width: 600,
                    height: 470
                },
                leftBtns: {
                    width: 160,
                   showDelete: {
                        show:true,
                        url:"${ctx}/Package/delPackage.ajax",
                        close: function () {
                            grid.reload();
                        }
                    }, 
                    showDetail: {
                        show:false,
                      
                    },
                    showEdit: {
                        show:true,
                        width: 660,
                        height: 360,
                        url: "${ctx}/Package/toPackageEdit.html",
                        close: function () {
                            grid.reload();
                        }
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                //    if (grid2 == null) {
                //        grid2 = $("#grid_pacakgeDetail").createLigerGrid({
                //            header: [
                //                { display: '采收编号', name: 'PLotHarvest_No', width: '200' },
                //                { display: '农作物', name: 'Goods_Name' },
                //                { display: '包装数量', name: 'Qty', type: 'double', format: '0.00' },
                //                { display: '单位', name: 'UnitName' },
                //                { display: '检测', name: 'result__show' }
               //             ],
               //             param: { 'flag': 2, 'packageUid': rowdata["PACKAGE_UID"] },
               //             height: '100%',
               //             leftBtns: {
               //                 show:false
               //             },
               //             delayLoad: false,
               //             keyID: "DETAIL_UID",
              //              ajaxURL: "${ctx}/Package/GetPackageDetail.ajax"
               //         });
               //     } else {
                //        grid2.setParm('packageUid', rowdata["PACKAGE_UID"]);
                //        grid2.reload();
              //      }
                },
                keyID: "PACKAGE_UID",
                ajaxURL: "${ctx}/Package/GetPackage.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("packageNo", $("#txt_PackageNo").val());
                grid.setParm("packageDate", $("#txt_OperDate").val());
                grid.reload();
            });


            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/Package/toPackageEdit.html?type=1', '新增包装信息', function () {
                    close();
                    grid.reload();
                });
            });
        });
        
        function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
             	+rowdata["PACKAGE_UID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function detail(id ,name){
        	myopen("${ctx}/Package/toPackageEdit.html?type=3&id="+id,"查看农产品包装 " + name + " 的详情"  ,660,360);
        }
         function showCoFarmerDetail(comFarmerId){
        	 parent.f_addTab(comFarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+comFarmerId);	
        	//myopen("${ctx}/CoFarmerAudit/CoFarmerAuditDet.html?id="+comFarmerId,"申请生产者详细信息",800,500);
        }
        
         function showPlantBase(plantBaseId){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?id="+plantBaseId,"查看基地详情",1000,600);
        }
        
        function showPlotDet(plotId){
        	myopen("${ctx}/Plot/PlotDet.html?id="+plotId,"显示地块详细信息",660,360);
        }
    </script>
</head>
<body>
    <div id="layout">
        <div position="top">
            <div class="rtittab">
                <div class="rtitbg2">
                    <div class="rtxt left">包装编号：</div>
                    <div class="sert left">
                        <input type="text" name="txt_PackageNo" id="txt_PackageNo" class="serchInput" />
                    </div>
                    <div class="rtxt left">包装日期：</div>
					<div class="sert left">
						<input name="txt_OperDate" type="text" id="txt_OperDate"  class="Wdate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" class="serchInput" />
					</div>
                    <div class="serb left">
                        <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
                    </div>
                    <div class="serb left">
                        <input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div position="center">
            <div id="grid_package"></div>
            <div id="grid_pacakgeDetail"></div>
        </div>
    </div>
</body>
<script type="text/javascript">
 function aa(){
 alert(1);
 }
</script>
</html>

