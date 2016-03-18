<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>标签管理</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css" />
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
        var flag=false;
         <shiro:hasPermission name="2506:label.edit"> 
            flag=true;
         </shiro:hasPermission>
        function Audit(apply_id){

            art.dialog.confirm('准予通过吗？',function(){
                $.ajax({
                    url: "${ctx}/ApplyLabel/Audit.ajax",
                    dataType: "json",
                    type: "POST",
                    data:{"id":apply_id},
                    complete: function (state) {
                        var ob = eval("(" + state.responseText + ")");   
                        if (ob.success) {
                            art.dialog.MyTips('操作成功',function(){grid.reload();});
                        }
                    }
                });
            });
        }
        var grid = null;
        $(document).ready(function () {
            $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            
            $("#btn_Add").hide();
            

            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '申请编号', name: 'Apply_No',width:'100' ,render:showDetail},
                
                    { display: '申请日期', name: 'Apply_Date',width:'80' , type: 'date', format: 'yyyy-MM-dd' },
                    { display: '申请数量', name: 'amount',width:'80' },
                    { display: '合作社名称/基地/地块/面积', name: 'CoFarmer_Name',width:'400',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCoFarmerDetail('"+rowdata["COFARMER_ID"]+"');\">"+rowdata["COFARMER_NAME"]+"</a>" + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
                        html = html +" / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+rowdata["PLOT_NAME"]+"</a>"
                        html = html + " /" + rowdata["AREAS"]+"(亩)"
                        return html ;
                    }},
                    
                    { display: '农产品名称/种植批次', name: 'good_value',width:'300',render:function(rowdata, index, value) {
                        var html = value + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantLot('"+rowdata["PLANTLOT_ID"]+"');\">"+rowdata["LOT_NO"]+"</a>";
                       
                        return html ;
                    }},
                    
                     { display: '采摘数量 /检测结果', name: 'harvest_qty',width:'150',render:function(rowdata, index, value) {
                        var html = value + " / "+rowdata["RESULTS"];
                       
                        return html ;
                    }},
                
              
                    { display: '审核状态', name: 'Audit_Result',width:'80',render:
                        function(record, rowindex, value, column){
                            var r= record["AUDIT_RESULT"];
                            if(r=="0"){
                                return "<font color='black'>未审核</font>";
                            }else if(r=="1"){
                                return "<font color='blue'>审核通过</font>";
                            }else 
                                return "<font color='red'>未通过</font>";
                        }
                    }
                ],  
                addTools: function (record, rowindex, value, column) {
                    if (record["AUDIT_RESULT"]=="0") {
                        var isCofarmer=$("#isCofarmer").val();
                        if(flag){
                        	//return "<a href='javascript:;' onclick=\"Audit('" + record["APPLY_ID"] + "')\">批准</a>&nbsp&nbsp"+"<a href='javascript:void(0);' onclick=\"ligerWin(660,360, '${ctx}/Label/ApplyLabelReason.html?type=2&id=" + record["APPLY_ID"] + "', '填写驳回原因');\">驳回</a>";
                        return " <input type='button' class='rowSelectButton' value='批准' onclick=\"Audit('" + record["APPLY_ID"] + "')\"/>&nbsp&nbsp"+"<input type='button' class='rowSelectButton' value='驳回' onclick=\"ligerWin(660,360, '${ctx}/Label/ApplyLabelReason.html?type=2&id=" + record["APPLY_ID"] + "', '填写驳回原因');\"/>";
              
                        }else{
                        	return "";
                        }
                        
                    }else{
                        return "已审核";

                    }
                },
                param: { 'flag': 1 },
                editor: {
                    width: 600,
                    height: 470
                },
                leftBtns: {
              		show:flag, 
               
                 
                   
                    showDetail: {
                        show:false,
                            
                          },
                          showDelete: {
                              show:false,
                        close: function () {
                            grid.reload();
                        }
                    },
                       showEdit: {
                        show:false,
                        width: 660,
                        height:360,
                        url: "${ctx}/Label/ApplyLabelDet.html"
                    }
                    
                      },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "APPLY_ID",
                ajaxURL: "${ctx}/ApplyLabel/GetApplyLabel.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("applyNo", $("#txt_Apply_No").val());
                grid.setParm("packageNo", $("#txt_PackageNo").val());
                grid.setParm("applyDate", $("#txt_OperDate").val());
                grid.reload()
            });

        });
        
          
        function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
             	+rowdata["APPLY_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function detail(id ,name){
             ligerWin(660, 500, "${ctx}/Label/ApplyLabelDet.html?type=3&id="+id,"查看申请标签详情" , function () {
                    grid.reload();
                });
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
         function showPlantLot(plantId){
        	myopen("${ctx}/Plant/Vegetables/PlantLotDet.html?id="+plantId,"显示种植批次详细信息",660,360);
        }
        
       
    </script>
</head>
<body>
	<div id="layout">
    <div position="top">
        <div class="rtittab">
            <div class="rtitbg2">
                <div class="rtxt left">申请编号：</div>
                <div class="sert left">
                	<input type="hidden" id="isCofarmer" value="${isCofarmer}"/>
                    <input type="text" name="txt_Apply_No" id="txt_Apply_No" class="serchInput" />
                </div>
                 <div class="rtxt left">包装编号：</div>
                 <div class="sert left">
                     <input type="text" name="txt_PackageNo" id="txt_PackageNo" class="serchInput" />
                 </div>
                 <div class="rtxt left">申请日期：</div>
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
        <div id="grid"></div>
    </div>
    </div>
</body>
</html>

