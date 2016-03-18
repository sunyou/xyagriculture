<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>标签审核管理</title>
    <c:set var="u" value="<%=com.ai.common.util.WebUtils.getFullPath(request)%>"/>
    
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
    <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
	<script language="javascript" src="${ctx}/js/jquery.jqprint-0.3.js"></script>
	<script language="javascript" src="${ctx}/js/qrcode.js"></script>
	  <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript">
        var printtype = "1";
        var currentVersion = "1.11.27";
        function download() {
            $('#frame_download').attr('src', '/ActiveX/Setup.rar');
            //location.href = "/ActiveX/Setup.rar";
        }

        function printLabel(id) {
            //var netVersion = MyActiveX.Version;
            //if (netVersion!=undefined&&currentVersion != netVersion) {
            //    artDialog.alert("请下载更新最新的打印控件");
            //    return;
            //}
            var values = id.split(',');
            $.ajax({
                url: "${ctx}/Label/getReportFiles.ajax",
                dataType: "json",
                type: "GET",
                complete: function (state) {
                    var ob = eval("(" + state.responseText + ")");
                    if (ob.data.length < 1) {                        
                        MyActiveX.Print(values[0], values[1], 2, values[2]);
                    } else {
                        var html = '<div style="width: 400px; overflow-x: scroll; margin:0 auto;">';
                        html += '<table width="100%">';
                        var tr1 = '<tr>', tr2 = '<tr>';
                        for (var i = 0; i < ob.data.length; i++) {
                            tr1 += '<td align="center" width="160">';
                            tr1 += ' <label for="rdo_LabelSelect' + i + '">';
                            tr1 += "<img src='${ctx}" + ob.data[i].IMAGESRC + "' alt='" + ob.data[i].REPORTNAME + "' onload='DrawImage(this,150,150)'>";
                            tr1 += '</label>';
                            tr1 += '</td>';
                            tr2 += '<td  align="center"><input id="rdo_LabelSelect' + i + '"';
                            if (ob.data[i].ISDEFAULT == '1') {
                                tr2 += 'checked="checked"';
                            }
                            tr2 += ' name="rdo_LabelSelect" type="radio" value="' + ob.data[i].ID + '">';
                            tr2 += "</td>";
                        }
                        tr1 += '</tr>';
                        tr2 += '</tr>';
                        html += tr1;
                        html += tr2;
                        html += "</table></div><div>请输入打印数量：<input type='text' id='Qty' value='"+values[2]+"' enable='false'/></div>";
                        html +=""
                        art.dialog(html, function () {
                            var ReportStr = $('input[@name="rdo_LabelSelect"][checked]').val();
                            var data = $("#Qty").val();
                            if (isNaN(data)) {
                                art.dialog.alert("请输入数字！");
                            } else if (parseInt(data) < 1 || parseInt(data) > 500) {
                                art.dialog.alert("每次打印0-500张标签");
                            } else {
                             prePrint(values[0]);
                               // MyActiveX.Print2(values[0], values[1], 2, ReportStr, data);
                            }
                        }, function () { });
                    }
                }
            });
        }
        var grid = null;
        $(document).ready(function () {
            $('#layout').ligerLayout({ topHeight: 30, allowTopResize: false });
            grid = $("#grid").createLigerGrid({
                header: [
                    {
                        display: '打印标签', name: 'Package_UID', width:'80',render: function (rowdata, index, value) {
                            if (rowdata["AUDIT_RESULT"] == "0")
                            {
                                return '正在审核';
                            } else if (rowdata["AUDIT_RESULT"] == "1") {
                                return '<input type="button"  class="rowSelectButton" value="打印标签" onclick=printLabel("' + rowdata["OBJECT_UID"] + ',' + rowdata["COFARMER_ID"] + ',' + rowdata["AMOUNT"] + '")></input>';
                            }
                            else
                            {
                                return "<input type=\"button\"  class='rowSelectButton' value=\"查看原因\" onclick=myopen('${ctx}/Label/ApplyLabelDet.html?type=3&id=" + rowdata["APPLY_ID"] + "','查看原因',400,300);></input>";
                            }
                        }
                    },
                    { display: '申请编号', name: 'Apply_No',width:'100' ,render:showDetail},
                
                    { display: '申请日期', name: 'Apply_Date',width:'80' , type: 'date', format: 'yyyy-MM-dd' },
                    { display: '申请数量', name: 'qty',width:'80' },
                    { display: '合作社名称/基地/地块/面积', name: 'CoFarmer_Name',width:'400',render:function(rowdata, index, value) {
                    	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCoFarmerDetail('"+rowdata["COFARMER_ID"]+"');\">"+value+"</a>" + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
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
                
                    {
                        display: '审核状态', name: 'Audit_Result', width: '100', render:
                          function (record, rowindex, value, column) {
                              var r = record["AUDIT_RESULT"];
                              if (r == "0") {
                                  return "<font color='black'>未审核</font>";
                              } else if (r == "1") {
                                  return "<font color='blue'>审核通过</font>";
                              } else
                                  return "<font color='red'>审核失败</font>";
                          }
                    }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 400,
                    height: 200
                },
                leftBtns: {
                    show:false,                   
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "Apply_ID",
                ajaxURL: "${ctx}/ApplyLabel/GetApplyLabel.ajax"
            });

            $("#btnSearch").click(function () {
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
        	myopen("${ctx}/Label/ApplyLabelDet.html?type=3&id="+id,"查看申请标签详情"  ,660,500);
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
         function showCoFarmerDetail(comFarmerId){
        	 parent.f_addTab(comFarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+comFarmerId);	
        	//myopen("${ctx}/CoFarmerAudit/CoFarmerAuditDet.html?id="+comFarmerId,"申请生产者详细信息",800,500);
        }
    </script>
</head>
<body>
	
    <!--
    <div>
        <object id="MyActiveX" classid='clsid:601CFF24-ECAC-4644-9BF6-5E5A6AA45141' width="0" height="0"></object>
    </div>
	<iframe id="frame_download" src="about:blank" style="display:none"></iframe>
    </div>
      -->
 
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
                    <input type="button" id="btnSearch" value="查询" class="btn_tool_search" />
                </div>
               
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div position="center">
        <div id="grid"></div>
    </div>
        <div id='prePrintWin' style='display:none'><div  id='prePrint'></div></div>
    
    </div>
  
</body>

<script language="javascript">
	function  prePrint(id){
		$.ajax({
                url: "${ctx}/Label/getLabelNos.ajax",
                dataType: "json",
                data:{"num":$("#Qty").val(),"id":id},
                type: "POST",
                complete: function (state) { 
                	var html="";
                    var ob = eval("(" + state.responseText + ")");
                    if (ob.data.length > 0) { 
	                    for (var i = 0; i < ob.data.length; i++) {
	                    	html='<div id="prePrint'+i+'"></div><br />';
	                        $("#prePrint").append(html);
							var qrcode = new QRCode(document.getElementById("prePrint"+i), {
								width : 150,//设置宽高
								height : 150
							});
							var url="${u}/" +"Label/Traceback.html?id="+ob.data[i].labelNo;
							qrcode.makeCode(url);
						}	
			
						$("#prePrint").show();
				        $("#prePrint").jqprint();
				    }
				}
		});
    }
</script>
</html>

