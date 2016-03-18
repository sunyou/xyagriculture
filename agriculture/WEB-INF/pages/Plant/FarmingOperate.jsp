<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Cache" content="no-cache">
    <title>种植基地</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/content/js/jquery-smartwizard/smart_wizard.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx }/content/js/jquery-smartwizard/jquery.smartWizard-2.0.js"></script>

	<style type="text/css">
		/**.plantlot_table{
			width:98%;border:1px solid #000000;border-collapse:collapse;margin:0 auto;
		}**/
		.data_grid td span{color:black;    padding-left: 2%;}
		/**.plantlot_table th{border-collapse:collapse;border:solid 1px #000000;background-color: #BCBCBC;padding: 5px;}**/
	</style>
</head>
<body style="overflow: hidden;">
	<div id="layout">
		<!-- Smart Wizard -->
  		<div id="wizard" class="swMain">
  			<ul>
  				<li>
	  				<a href="#step-1">
		                <span class="stepNumber">1</span>
		                <span class="stepDesc">
		                	选择基地<br />
		                   <small>种植基地</small>
		                </span>
		            </a>
	            </li>
  				<li>
	  				<a href="#step-2">
		                <span class="stepNumber">2</span>
		                <span class="stepDesc">
		                   	选择地块<br />
		                   <small>可直接选择该步骤(种植地块)</small>
		                </span>
		            </a>
	            </li>
  				<li>
	  				<a href="#step-3">
		                <span class="stepNumber">3</span>
		                <span class="stepDesc">
		                   	选择种植批次<br />
		                   <small>可直接选择该步骤(种植批次)</small>
		                </span>                   
		             </a>
	             </li>
  				<li>
	  				<a href="#step-4">
		                <span class="stepNumber">4</span>
		                <span class="stepDesc">
		                   	选择农事操作<br />
		                   <small>农事操作</small>
		                </span>                   
		             </a>
	             </li>
  			</ul>
  			<div id="step-1">	
				<div class="rtittab">
					<div class="rtitbg2">
						<div class="rtxt left">基地名称：</div>
						<div class="sert left">
							<input type="text" id="txt_PlantBasesName_Serch" class="serchInput" />
						</div>
						<div class="serb left">
							<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
						</div>
						<div class="serb left">
							<label id="butt" class="butt" style="margin-left:20px;">
								<input type="button" name="btn_skip1" id="btn_skip1" value="跳过基地选择" class="xybtn" />
							</label>
						</div>
						<div class="clear"></div>
					</div>
				</div>
		        <div id="gv_PlantBases"></div>
	        </div>
  			<div id="step-2">
				<div class="rtittab">
					<div class="rtitbg2">
						<div class="rtxt left">当前基地：</div>
						<div class="sert left">
							<input type="text" id="PlantBasesName" class="serchInput" />
						</div>
						<div class="rtxt left">地块：</div>
						<div class="sert left">
							<input type="text" id="plotName" class="serchInput" />
						</div>
						<div class="serb left">
							<input type="button" id="btn_plot_Search" value="查询" class="btn_tool_search" />
						</div>
						<div class="serb left">
							<label id="butt" class="butt" style="margin-left:20px;">
								<input type="button" name="btn_skip2" id="btn_skip2" value="跳过地块选择" class="xybtn" />
							</label>
						</div>
						<div class="clear"></div>
					</div>
				</div>
	            <div id="gv_PLot"></div>
	        </div>                      
  			<div id="step-3">
  				<div class="rtittab">
					<div class="rtitbg2">
						<div class="rtxt left">当前基地：</div>
						<div class="sert left">
							<input type="text" id="pbName" class="serchInput" />
						</div>
						<div class="rtxt left">地块：</div>
						<div class="sert left">
							<input type="text" id="pName" class="serchInput" />
						</div>
						<div class="rtxt left">批次号：</div>
						<div class="sert left">
							<input type="text" id="plotNo" class="serchInput" />
						</div>
						<div class="serb left">
							<input type="button" id="btn_plantlot_Search" value="查询" class="btn_tool_search" />
						</div>
						<div class="serb left">
							<label class="butt" style="margin-left:20px;">
								<input id="btn_plantlot_Add" type="button" value="新增种植批次" class="xybtn" />
							</label>
						</div>
						<div class="clear"></div>
					</div>
				</div>
	            <div id="grid_plantlot"></div>
	        </div>
  			<div id="step-4" style="height:427px;overflow-y:scroll;">
  				<h2 class="StepTitle">种植批次信息</h2>
	            <div style="margin-top:10px;margin-bottom:10px;">
	            	<table class="data_grid">
	            		<tr>
	            			<th>种植日期</th>
	            			<td><span id="PLANT_DATE"></span></td>
	            			<th>批次号</th>
	            			<td><span id="LOT_NO"></span></td>
	            		</tr>
	            		<tr>
	            			<th>作物名称</th>
	            			<td><span id="GOODS_NAME"></span></td>
	            			<th>种子种苗</th>
	            			<td><span id="GOODVARIETY_NAME"></span></td>
	            		</tr>
	            		<tr>
	            			<th>生产者</th>
	            			<td><span id="COFARMER_NAME"></span></td>
	            			<th>农户姓名</th>
	            			<td><span id="FARMER_NAME"></span></td>
	            		</tr>
	            		<tr>
	            			<th>技术员</th>
	            			<td><span id="USER_NAME"></span></td>
	            			<th>种植基地</th>
	            			<td><span id="PLANTBASE_NAME"></span></td>
	            		</tr>
	            		<tr>
	            			<th>种植区域</th>
	            			<td><span id="PLOT_NAME"></span></td>
	            			<th>种植面积(亩)</th>
	            			<td><span id="AREAS"></span></td>
	            		</tr>
	            	</table>
	            </div>
	            <h2 class="StepTitle"  style="margin-top:5px;margin-bottom:5px;">农事操作</h2>
	            <!--种植操作[star] 蔬菜，水果，食用菌-->
			    <div id="div_Vagetable" style="display: none;width:auto;overflow-x:scroll;">
			        <ol class="operToolsBox" data-title="蔬菜" style='width:100%;'>
			            <li style="display: flex;">
			                <a href="javascript:void(0);" class="xx_1" id="zd">
			                    <input type="button" value="整地" onclick="OperateSelect('zd')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:void(0);" class="xx_2" id="bz">
			                    <input type="button" value="定植" onclick="OperateSelect('bz')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_3" id="py">
			                    <input type="button" value="喷药" onclick="OperateSelect('py')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_4" id="sf">
			                    <input type="button" value="施肥" onclick="OperateSelect('sf')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_5" id="cc">
			                    <input type="button" value="锄草" onclick="OperateSelect('cc')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_6" id="js">
			                    <input type="button" value="灌溉" onclick="OperateSelect('js')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_20" id="cs">
			                    <input type="button" value="采收" onclick="OperateSelect('cs')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_7" id="qt">
			                    <input type="button" value="其他" onclick="OperateSelect('qt')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_19" id="qc">
			                    <input type="button" value="清茬" onclick="OperateSelect('qc')" />
			                </a>
			            </li>
			        </ol>
			    </div>
			    <div id="div_Fruit" style="width:100%; display: none;width:auto;overflow-x:scroll;" data-title="水果">
			        <ul class="operToolsBox">
			            <li style="display: flex;">
			                <a href="javascript:;" class="xx_21" id="fzd">
			                    <input type="button" value="清园" onclick="OperateSelect('fzd')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_22" id="fym">
			                    <input type="button" value="育苗" onclick="OperateSelect('fym')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:void(0);" class="xx_2" id="bz">
			                    <input type="button" value="定植" onclick="OperateSelect('bz')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_4" id="fsf">
			                    <input type="button" value="施肥" onclick="OperateSelect('fsf')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_6" id="fjs">
			                    <input type="button" value="灌溉" onclick="OperateSelect('fjs')" />
			                </a>
						</li>
			            <li>			                
			                <a href="javascript:;" class="xx_8" id="fsfcz">
			                    <input type="button" value="授粉" onclick="OperateSelect('fsfcz')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_5" id="fcc">
			                    <input type="button" value="锄草" onclick="OperateSelect('fcc')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_3" id="fpy">
			                    <input type="button" value="喷药" onclick="OperateSelect('fpy')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_15" id="fxj">
			                    <input type="button" value="整形修剪" onclick="OperateSelect('fxj')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_16" id="fsg">
			                    <input type="button" value="疏花疏果" onclick="OperateSelect('fsg')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_17" id="ftd">
			                    <input type="button" value="套袋" onclick="OperateSelect('ftd')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_20" id="fcs">
			                    <input type="button" value="采收" onclick="OperateSelect('fcs')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_7" id="qt">
			                    <input type="button" value="其他" onclick="OperateSelect('qt')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_18" id="fhc">
			                    <input type="button" value="换茬" onclick="OperateSelect('fhc')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_19" id="fqc">
			                    <input type="button" value="清茬" onclick="OperateSelect('fqc')" />
			                </a>
			            </li>
			            <div class="clear"></div>
			        </ul>
			    </div>
			    <div id="div_Mushrooms" style="display: none;width:auto;overflow-x:scroll;" data-title="食用菌">
			        <ul class="operToolsBox">
			            <li style="display: flex;">
			                <a href="javascript:;" class="xx_9" id="mpl">
			                    <input type="button" value="配料" onclick="OperateSelect('mpl')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_11" id="mmj">
			                    <input type="button" value="灭菌" onclick="OperateSelect('mmj')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_13" id="mpy">
			                    <input type="button" value="培养" onclick="OperateSelect('mpy')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_10" id="mzd">
			                    <input type="button" value="装袋" onclick="OperateSelect('mzd')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_12" id="mjz">
			                    <input type="button" value="接种" onclick="OperateSelect('mjz')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_20" id="mcs">
			                    <input type="button" value="采收" onclick="OperateSelect('mcs')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_7" id="qt">
			                    <input type="button" value="其他" onclick="OperateSelect('qt')" />
			                </a>
			            </li>
			            <li>
			                <a href="javascript:;" class="xx_19" id="mqc">
			                    <input type="button" value="清茬" onclick="OperateSelect('mqc')" />
			                </a>
			            </li>
			            <div class="clear"></div>
			        </ul>
			    </div>
			    <!--种植操作[end]-->
			    <h2 class="StepTitle" style="margin-top:5px;margin-bottom:5px;">农事操作明细</h2>
	            <div id="grid_operate"></div>
	            <input type="hidden" name="hf_PlantLotID" id="hf_PlantLotID" />
	        </div>
  		</div>
		<!-- End SmartWizard Content -->  
		
	</div>
	<script type="text/javascript">
		var lastStep = 0;
		$(function(){
			$('#wizard').smartWizard();
			var steps = $("ul > li > a", $('#wizard'));
			steps.each(function(i){
				if(i == 0){
					$(this).removeClass("done").removeClass("disabled").addClass("selected"); 
					$(this).attr("isDone",1);
				}else if(i == 3){
					$(this).removeClass("selected").removeClass("done").addClass("disabled"); 
					$(this).attr("isDone",0);
				}else{
					$(this).removeClass("selected").removeClass("disabled").addClass("done"); 
					$(this).attr("isDone",1);
				}
				$(this).css({"width":($("body").width()-70)/4+"px"});
			});
			  
			$(steps).bind("click",function(i){
				if(steps.index($(this)) == 3){
					return;
				}
				$(steps).removeClass("selected").addClass("done");
				steps.each(function(){
					$($(this).attr("href")).hide();
				});
				$(this).removeClass("done").addClass("selected");
				$($(this).attr("href")).show();
				
				switch (steps.index($(this))) {
				case 0:
				case 1:
				case 2:
					$(steps).eq(3).removeClass("selected").removeClass("done").addClass("disabled"); 
		            $(steps).eq(3).attr("isDone",0);
					break;

				default:
					break;
				}
				if(steps.index($(this)) == 0){
					$("#PlantBasesName").val('');
				}else if(steps.index($(this)) == 1){
					choosePlantBase($("#PlantBasesName").val());
				}else if(steps.index($(this)) == 2){
					if(lastStep != 3){
						$("#pbName").val('');
						$("#pName").val('');
						$("#plotNo").val('');
						choosePlantlot();
					}else{
						choosePlantlot($("#pbName").val(),$("#pName").val());
					}
				}
				lastStep = steps.index($(this));
				$("div.swMain").css({"width":($("body").width()-5)+"px"});
				$("div.content").css({"width":($("div.swMain").width()-10)+"px"});
			});
			
			$("div.swMain").css({"width":($("body").width()-5)+"px"});
			$("div.content").css({"width":($("div.swMain").width()-10)+"px"});
		});
		$("#btn_skip1").click(function(){
			choosePlantBase();
		});
		$("#btn_skip2").click(function(){
			choosePlantlot();
		});
		
		var grid2 = null,grid=null,grid3 = null,grid4 = null,grid5 = null;
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            
            grid = $("#gv_PlantBases").createLigerGrid({
                header: [                    
                    { display: '基地编号', name: 'PlantBases_No',width:'150' ,render:plantBasesNameRender   },
                    { display: '基地名称', name: 'PlantBases_Name',width:'150',render:plantBasesNameRender   },                    
                    { display: '基地面积(亩)', name: 'Areas', type: 'double', format: '0.00' },
                    { display: '基地所属生产者', name: 'CoFarmer_Name',width:'250',render:function(rowdata, index, value) {
                        var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCofarmerInfo('"+rowdata["COFARMER_ID"]+"');\">"+value+"</a>";
                        return html ;
                    } },
                    { display: '选择基地', render:selectBasesNameRender,width:'150' }
                ],
                /* addTools: function (record, rowindex, value, column) {
                    return "<a href='javascript:;' class='ligerBtnDetail' onclick=\"choosePlantBase('"+record["PLANTBASES_NAME"]+"');\">选择</a>";
                }, */ 
                height:'390px',
                param: { 'flag': 1 },
                editor: {
                    width: 599,
                    height: 550
                },
                leftBtns: {
                	show:false
                },
                onLoaded: function () {
                    if (grid2) {
                        grid2.setParm("PARENT_ID", getNewGuid());
                        grid2.reload();
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                    
                },
                keyID: "PLANTBASES_UID",
                ajaxURL: "${ctx}/PlantBases/GetPlantBases.ajax"
            });
            
            

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_PlantBasesName_Serch").val());
                grid.reload();
            }
            );
			
            $("#btn_plot_Search").click(function(){
            	grid2.setParm('plantBaseName', $("#PlantBasesName").val());
                grid2.setParm('plotName', $("#plotName").val());
                grid2.reload();
            });
            
            $("#btn_plantlot_Search").click(function(){
            	grid3.setParm('lotNo', $("#plotNo").val());
                grid3.setParm('plantBaseName', $("#pbName").val());
                grid3.setParm('plotName', $("#pName").val());
                grid3.reload();
            });
            
            $("#btn_plantlot2_Search").click(function(){
            	grid4.setParm('plotId', '');
                grid4.setParm('plantBaseName', $("#pbName2").val());
                grid4.setParm('plotName', $("#pName2").val());
                grid4.reload();
            });
            
            $("#btn_plantlot_Add").click(function () {
            	if($("#pName").val() != ''){
	            	 myopen("${ctx}/Plant/Vegetables/PlantLotEdit.html?plotName="+$("#pName").val(),"新增种植批次",655,400);
            	}else{
	            	 myopen("${ctx}/Plant/Vegetables/PlantLotEdit.html","新增种植批次",655,400);
            	}
            });
            
        });
        
        function plantBasesNameRender(rowdata, index, value) {
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+value+"</a>";
             return html ;
        }
        
        function selectBasesNameRender(rowdata, index, value) {
        	return "<input type=button value='选择该基地' class='rowSelectButton'  onclick=\"choosePlantBase('"+rowdata["PLANTBASES_NAME"]+"')\" >"
        }
                  	
        function showPlantBase(plantBaseId){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?id="+plantBaseId,"查看基地详情",1000,600);
        }
        
        function showCofarmerInfo(cofarmerId){
        	parent.f_addTab(cofarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+cofarmerId);		
        }
        
        function choosePlantBase(plantBaseName){
         	var steps = $("ul > li > a", $('#wizard'));
        	steps.each(function(){
        		$(this).removeClass("selected").addClass("done");
        		$($(this).attr("href")).hide();
        	});
        	steps.eq(1).removeClass("done").addClass("selected");
        	$(steps.eq(1).attr("href")).show(); 
        	if(plantBaseName === undefined || plantBaseName === 'undefined'){
        		$("#PlantBasesName").val('');
        	}else{
        		$("#PlantBasesName").val(plantBaseName);
        	}
        	if (grid2 == null) {
                grid2 = $("#gv_PLot").createLigerGrid({
                    header: [
					{ display: '基地名称', name: 'PlantBases_Name',width:'150',render:function(rowdata, index, value) {
			             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASE_ID"]+"');\">"+value+"</a>";
			             return html ;
			        	}   
					},
                    { display: '地块编号', name: 'Plot_No',width:170,render:showPlotNameRender },
                    { display: '地块名称', name: 'Plot_Name',width:200,render:showPlotNameRender  },
                    { display: '地块面积(亩)', name: 'Areas', type: 'double', format: '0.00' },
                    { display: '生产责任人', name: 'Farmer_Name' },
                    { display: '土地状态', name: 'State', render: function (rowdata, index, value) { if (value == '1') { return "<font color='#FF5500'>已使用</font>"; } else { return "<font color='#0063DC'>未使用</font>"; } } },
                    { display: '选择地块', render:selectPlotNameRender,width:'150' }
                    ],
                    param: {'plantBaseName': $("#PlantBasesName").val(),'plotName':$("#plotName").val() },
                    /* addTools: function (record, rowindex, value, column) {
                        return "<a href='javascript:;' class='ligerBtnDetail' onclick=\"choosePlantlot('"+$("#PlantBasesName").val()+"','"+record["PLOT_NAME"]+"');\">选择</a>";
                    },  */
                    editor: {
                        width: 599
                    },
                    height:'390px',
                    leftBtns: {
                    	width:170,
                    	show:false
                    },
                    delayLoad: false,
                    keyID: "PLOT_ID",
                    ajaxURL: "${ctx}/Plot/v2/getPlot.ajax"
                });
            } else {
                grid2.setParm('plantBaseName', $("#PlantBasesName").val());
                grid2.setParm('plotName', $("#plotName").val());
                grid2.reload();
            }
        }
        
        function showPlotDet(plotId){
        	myopen("${ctx}/Plot/PlotDet.html?id="+plotId,"显示地块详细信息",660,260);
        }
        
        function choosePlantlot(pbName,pName){
        	var steps = $("ul > li > a", $('#wizard'));
        	steps.each(function(){
        		$(this).removeClass("selected").addClass("done");
        		$($(this).attr("href")).hide();
        	});
        	steps.eq(2).removeClass("done").addClass("selected");
        	$(steps.eq(2).attr("href")).show(); 
        	$("#pbName").val(pbName);
    		$("#pName").val(pName);
        	if(grid3 == null){
        		grid3 = $("#grid_plantlot").createLigerGrid({
                    header: [
                    	{ display: '种植日期', name: 'Plant_Date', type: 'date', options: { format: "yyyy-MM-dd" } ,width:100},
                        { display: '种植批次号', name: 'Lot_No',width:'280',render:function(rowdata,index,value){
                        	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantLotDet('"+rowdata["PLANTLOT_ID"]+"');\">"+value+"</a>";
                        	return html + "<input class='rowSelectButton' style='float:right;width:50px;' value='农事操作' onclick=\"queryFarmingOperate('"+rowdata["PLANTLOT_ID"]+"');\"/>";
                        	} 
                        },
						{ display: '生成合作社名称/基地名称/地块名称/种植面积', name: 'CoFarmer_Name',width:'450' ,render:function(rowdata,index,value){ 
							return "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCofarmerInfo('"+rowdata["COFARMER_ID"]+"');\">"+value+"</a>" + "/" 
                        	+ plantBasesNameRender(rowdata,index,rowdata['PLANTBASES_NAME'] +"/"
                        	+ showPlotNameRender (rowdata,index,rowdata['PLOT_NAME'] ) + "/"
                        	+ rowdata['AREAS'] +"(亩)"
                        	)}
                        },
                        { display: '农作物名称', name: 'GOODS_NAME' },
                        {
                            display: '种植状态', name: 'State1',align:'center', render: function (rowdata, index, value) {
                                if (value == "1") return "<font color='#0063DC'>种植中</font>";
                                else if (value == '0') return "<font color='#E22C37'>已清茬</font>";
                                else return "<font color='#0063DC'>种植中</font>";
                            }
                        },
                        
                        
                        { display: '农户姓名', name: 'Farmer_Name' }
                    ],
                    /* addTools: function (record, rowindex, value, column) {
                        return "<a href='javascript:;' class='ligerBtnDetail' onclick=\"queryFarmingOperate('"+record["PLANTLOT_ID"]+"');\">选择</a>";
                    }, */ 
                    param: { 'lotNo': $("#plotNo").val(),'plantBaseName': $("#pbName").val(),'plotName':$("#pName").val() },
                    height:'390px',
                    leftBtns: {
                    	width:170,
                    	show:false
                        },
                        onSelectRow: function (rowdata, rowid, rowobj) {
                        },
                        keyID: "PLANTLOT_ID",
                        ajaxURL: "${ctx}/Plant/getPlantLot.ajax"
                    });
        	} else {
                grid3.setParm('lotNo', $("#plotNo").val());
                grid3.setParm('plantBaseName', $("#pbName").val());
                grid3.setParm('plotName', $("#pName").val());
                grid3.reload();
            }
        }
        function showPlotNameRender(rowdata,index,value){
             return html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+value+"</a>";
        } 
        function selectPlotNameRender(rowdata,index,value){
             return  "<input type=button value='选择该地块' class='rowSelectButton' onclick=\"choosePlantlot('"+$("#PlantBasesName").val()+"','"+rowdata["PLOT_NAME"]+"');\">";
        } 
        function showPlantLotDet(plantlotId){
        	myopen("${ctx}/Plant/Vegetables/PlantLotDet.html?id="+plantlotId,"明细",660,250);
        }
        
        function queryFarmingOperate(plantlotId){
        	lastStep = 3;
        	var steps = $("ul > li > a", $('#wizard'));
        	steps.each(function(){
        		$(this).removeClass("selected").addClass("done");
        		$($(this).attr("href")).hide();
        	});
        	steps.eq(3).removeClass("disabled").removeClass("done").addClass("selected");
            $(steps).eq(3).attr("isDone",1);
        	$(steps.eq(3).attr("href")).show(); 
        	if(plantlotId === undefined || plantlotId === "undefined"){
        		return;
        	}
        	$.ajax({
	    		type:"POST",
	    		url:"${ctx}/Plant/getPlantLot.ajax",
	    		data:{
	    			"plantlotId":plantlotId,
	    			"page":1,
	    			"limit":10
	    		},
	    		success:function(result){
	    			if(result.success){
	        			if(result.total == 0)return;
	        			if(result.data[0].PLANT_DATE != undefined && result.data[0].PLANT_DATE.length > 10 ){
	        				$("#PLANT_DATE").text(result.data[0].PLANT_DATE.substr(0,10));
	        			}else{
	        				$("#PLANT_DATE").text(result.data[0].PLANT_DATE);
	        			}
                        
                        $("#LOT_NO").text(result.data[0].LOT_NO);
                        $("#COFARMER_NAME").text(result.data[0].COFARMER_NAME);
                        $("#FARMER_NAME").text(result.data[0].FARMER_NAME);
                        $("#GOODS_NAME").text(result.data[0].GOODS_NAME);
                        $("#GOODVARIETY_NAME").text(result.data[0].GOODVARIETY_NAME);
                        $("#PLOT_NAME").text(result.data[0].PLOT_NAME);
                        $("#AREAS").text(result.data[0].AREAS);
                        $("#PLANTBASE_NAME").text(result.data[0].PLANTBASES_NAME);
                        $("#USER_NAME").text(result.data[0].USER_NAME);
                        $("#hf_PlantLotID").val(result.data[0]["PLANTLOT_ID"]);
                    	if (result.data[0]["GOOD_TYPE"] == "3") {
			                $("#div_Mushrooms").show();
			                $("#div_Fruit").hide();
			                $("#div_Vagetable").hide();
			            } else if (result.data[0]["GOOD_TYPE"] == "2") {
			            	$("#div_Mushrooms").hide();
			                $("#div_Fruit").show();
			                $("#div_Vagetable").hide();
			            } else {
			            	$("#div_Mushrooms").hide();
			                $("#div_Fruit").hide();
			                $("#div_Vagetable").show();
			            }
	    				//onclick="PlantLotChecked('"+record["PLANTLOT_ID"]+"','"+record["GOOD_TYPE"]+"');\"
	    			}else if(result.message){
	    				alert(result.message);
	    			}
	    		}
	    	});
        	
        	grid5 = $("#grid_operate").createLigerGrid({
                header: [
                    { display: '操作日期', name: 'Operate_Date',type: 'date', options: { format: "yyyy-MM-dd" }, width:170 },
                    { display: '操作类型', name: 'OperateTypeName' },
                    { display: '作物', name: 'Goods_Name' },
                    { display: '农资名称', name: 'Material_Name' },
                    { display: '操作人', name: 'Operators' },
                    { display: '操作说明', name: 'Notes' },
                    {
                        display: '操作', name: 'PLotOper_ID', width: '100', aligh: 'center', render: function (rowdata, index, value) {
                            var str = "";
                            str += "<a class='ligerBtnDetail' href='javascript:;' onclick=\"DetailOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">查看</a>&nbsp;&nbsp;";
                            str += "<a class='ligerBtnDelete' href='javascript:;' onclick=\"deleteOne(" + rowdata["OPERATETYPE_CODE"] + ",'" + value + "')\">删除</a>";
                            return str;
                        }
                    }
                ],
                height:'235px',
                param: { 'plantLotId': plantlotId },
                leftBtns: {
                    show: false
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "PLOT_ID",
                ajaxURL: "${ctx}/Plant/getPlantOper.ajax"
            });
        }
        //农事操作
        function PlantLotChecked(id, type) {
            $("#hf_PlantLotID").val(id);
            /* var _tar = {};
            if (type.trim() == "3") {
                _tar = $("#div_Mushrooms");
            } else if (type.trim() == "2") {
                _tar = $("#div_Fruit");
            } else {
                _tar = $("#div_Vagetable");
            }
            art.dialog({
                title: "种植操作",
                width: 300,
                height: 300,
                content: $(_tar).html()
            }).lock(); */
        }


        /**
        *打开操作窗
        *
        */
        function OperateSelect(type) {
            var url = "about:blank", title = '', width = 660, height = 360;
            var plantLotID = $("#hf_PlantLotID").val();
            if (type == 'zd') {
                url = '${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '整地';
                width = 660;
                height = 360;
            } else if (type == 'bz') {
                url = '${ctx}/PlantOper/Vegetables/PlantCloneEdit.html?type=1&plantlotId=' + plantLotID;
                title = '定植';
                width = 660;
                height = 360;
            } else if (type == 'py') {
                url = '${ctx}/PlantOper/Vegetables/PlantSprayEdit.html?type=1&plantlotId=' + plantLotID;
                title = '喷药';
                width = 660;
                height = 360;
            } else if (type == 'sf') {
                url = '${ctx}/PlantOper/Vegetables/PlantFertilizeEdit.html?type=1&plantlotId=' + plantLotID;
                title = '施肥';
                width = 660;
                height = 360;
            } else if (type == 'cc') {
                url = '${ctx}/PlantOper/Vegetables/PlantWeedingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '锄草';
                width = 660;
                height = 360;
            } else if (type == 'js') {
                url = '${ctx}/PlantOper/Vegetables/PlantWaterEdit.html?type=1&plantlotId=' + plantLotID;
                title = '灌溉';
                width = 660;
                height = 360;
            } else if (type == 'qt') {
                url = '${ctx}/PlantOper/Vegetables/PlantOtherEdit.html?type=1&plantlotId=' + plantLotID;
                title = '其他';
                width = 660;
                height = 360;
            } else if (type == 'cs') {
                url = '${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=1&plantlotId=' + plantLotID;
                title = '采收';
                width = 660;
                height = 360;
            } else if (type == 'qc') {
                url = '${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清茬';
                width = 660;
                height = 360;
            }

            if (type == 'fzd') {
                url = '${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清园';
                width = 660;
                height = 360;
            }
            if (type == 'fym') {
                url = '${ctx}/PlantOper/Vegetables/PlantCloneEdit.html?type=1&plantlotId=' + plantLotID;
                title = '育苗';
                width = 660;
                height = 360;
            } else if (type == 'fsf') {
                url = '${ctx}/PlantOper/Vegetables/PlantFertilizeEdit.html?type=1&plantlotId=' + plantLotID;
                title = '施肥';
                width = 660;
                height = 360;
            } else if (type == 'fjs') {
                url = '${ctx}/PlantOper/Vegetables/PlantWaterEdit.html?type=1&plantlotId=' + plantLotID;
                title = '灌溉';
                width = 660;
                height = 360;
            } else if (type == 'fsfcz') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantPolEdit.html?type=1&plantlotId=' + plantLotID;
                title = '授粉';
                width = 660;
                height = 360;
            } else if (type == 'fcc') {
                url = '${ctx}/PlantOper/Vegetables/PlantWeedingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '锄草';
                width = 660;
                height = 360;
            }
            else if (type == 'fpy') {
                url = '${ctx}/PlantOper/Vegetables/PlantSprayEdit.html?type=1&plantlotId=' + plantLotID;
                title = '喷药';
                width = 660;
                height = 360;
            }
            else if (type == 'fxj') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantPruneEdit.html?type=1&plantlotId=' + plantLotID;
                title = '整形修剪';
                width = 660;
                height = 360;
            }
            else if (type == 'fsg') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantLaxifloraEdit.html?type=1&plantlotId=' + plantLotID;
                title = '疏花疏果';
                width = 660;
                height = 360;
            }
            else if (type == 'ftd') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '套袋';
                width = 660;
                height = 360;
            }
            else if (type == 'fcs') {
                url = '${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=1&plantlotId=' + plantLotID;
                title = '采收';
                width = 660;
                height = 360;
            }
            else if (type == 'fhc') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantRotationCropsEdit.html?type=1&plantlotId=' + plantLotID;
                title = '换茬';
                width = 660;
                height = 360;
            }
            else if (type == 'fqc') {
                url = '${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清茬';
                width = 660;
                height = 360;
            }

            if (type == 'mpl') {
                url = '${ctx}/PlantOper/Mushrooms/MushPreEdit.html?type=1&plantlotId=' + plantLotID;
                title = '配料';
                width = 660;
                height = 360;
            } else if (type == 'mmj') {
                url = '${ctx}/PlantOper/Mushrooms/MushSterilizingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '灭菌';
                width = 660;
                height = 360;
            } else if (type == 'mpy') {
                url = '${ctx}/PlantOper/Mushrooms/MushFosterEdit.html?type=1&plantlotId=' + plantLotID;
                title = '培养';
                width = 660;
                height = 360;
            } else if (type == 'mzd') {
                url = '${ctx}/PlantOper/Mushrooms/MushBaggingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '装袋';
                width = 660;
                height = 360;
            } else if (type == 'mjz') {
                url = '${ctx}/PlantOper/Mushrooms/MushVaccEdit.html?type=1&plantlotId=' + plantLotID;
                title = '接种';
                width = 660;
                height = 360;
            } else if (type == 'mcs') {
                url = '${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=1&plantlotId=' + plantLotID;
                title = '采收';
                width = 660;
                height = 360;
            }
            else if (type == 'mqc') {
                url = '${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清茬';
                width = 660;
                height = 360;
            }
            //myopen(url, title, width, height);
            art.dialog.open(url, { title: title, background: '#FFFFFF', opacity: 0.8, width: width, height: height, lock: true,close:function(){
            	grid5.setParm('plantLotId', plantLotID);
                grid5.reload();
            }}, false);
        }
        function updateOne(type, ID) {
  	      var url = "";
  	      switch (type) {
  	          case 1: //整地
  	              url = "${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=2&id=" + ID;
  	              break;
  	          case 2: //播种定植
  	              url = "${ctx}/PlantOper/Vegetables/PlantCloneEdit.html?type=2&id=" + ID;
  	              break;
  	          case 3: //喷药
  	              url = "${ctx}/PlantOper/Vegetables/AddPlantSprayEdit.html?type=2&id=" + ID;
  	              break;
  	          case 4: //施肥
  	              url = "${ctx}/PlantOper/Vegetables/AddPlantFertilizeEdit.html?type=2&id=" + ID;
  	              break;
  	          case 5: //除草
  	              url = "${ctx}/PlantOper/Vegetables/PlantWeedingEdit.html?type=2&id=" + ID;
  	              break;
  	          case 6: //浇水
  	              url = "${ctx}/PlantOper/Vegetables/PlantWaterEdit.html?type=2&id=" + ID;
  	              break;
  	          case 7: //其它
  	              url = "${ctx}/PlantOper/Vegetables/PlantOtherEdit.html?type=2&id=" + ID;
  	              break;
  	          case 8: //采收
  	              url = "${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=2&id=" + ID;
  	              break;
  	          case 9: //清茬
  	              url = "${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=2&id=" + ID;
  	              break;
  	          case 10: //加工-------------------
  	              url = "/Pages/Trade/ProcessEdit.html?type=2&id=" + ID;
  	              break;
  	          case 11: //包装
  	              url = "/Pages/Package/PackageEdit.html?type=2&id=" + ID;
  	              break;
  	          case 12: //销售----------------
  	              url = "${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=2&id=" + ID;
  	              break;
  	          case 13: //授粉
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantPolEdit.html?type=2&id=" + ID;
  	              break;
  	          case 14: //配制
  	              url = "${ctx}/PlantOper/Mushrooms/MushPreEdit.html?type=2&id=" + ID;
  	              break;
  	          case 15: //装袋
  	              url = "${ctx}/PlantOper/Mushrooms/MushBaggingEdit.html?type=2&id=" + ID;
  	              break;
  	          case 16: //灭菌
  	              url = "${ctx}/PlantOper/Mushrooms/MushSterilizingEdit.html?type=2&id=" + ID;
  	              break;
  	          case 17: //接种
  	              url = "${ctx}/PlantOper/Mushrooms/MushVaccEdit.html?type=2&id=" + ID;
  	              break;
  	          case 18: //培养
  	              url = "${ctx}/PlantOper/Mushrooms/MushFosterEdit.html?type=2&id=" + ID;
  	              break;
  	          case 19: //出菇
  	              url = "${ctx}/PlantOper/Mushrooms/MushroomEdit.html?type=2&id=" + ID;
  	              break;
  	          case 20: //修剪
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantPruneEdit.html?type=2&id=" + ID;
  	              break;
  	          case 21: //疏花蔬果
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantLaxifloraEdit.html?type=2&id=" + ID;
  	              break;
  	          case 22: //套袋
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingEdit.html?type=2&id=" + ID;
  	              break;
  	          case 23: //换茬
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantRotationCropsEdit.html?type=2&id=" + ID;
  	              break;
  	      }
  	      ligerWin(660, 360, url, '修改');
  	  }
  	  function DetailOne(type, ID) {
  	      var url = "";
  	      switch (type) {
  	          case 1: //整地
  	              url = "${ctx}/PlantOper/Vegetables/PlantSowingDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 2: //播种定植
  	              url = "${ctx}/PlantOper/Vegetables/PlantCloneDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 3: //喷药
  	              url = "${ctx}/PlantOper/Vegetables/PlantSprayDet.html?type=2&plotOperId=" + ID;
  	              
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 4: //施肥
  	              url = "${ctx}/PlantOper/Vegetables/PlantFertilizeDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 5: //除草
  	              url = "${ctx}/PlantOper/Vegetables/PlantWeedingDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 6: //浇水
  	              url = "${ctx}/PlantOper/Vegetables/PlantWaterDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 7: //其它
  	              url = "${ctx}/PlantOper/Vegetables/PlantOtherDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 8: //采收
  	              url = "${ctx}/PlantOper/Vegetables/PlantHarvestDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 9: //清茬
  	              url = "${ctx}/PlantOper/Vegetables/PlantClearDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 10: //加工-------------------
  	              url = "/Pages/Trade/ProcessDet.html?plantlotId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 11: //包装
  	              url = "/Pages/Package/PackageDet.html?plantlotId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 12: //销售----------------
  	              url = "${ctx}/PlantOper/Vegetables/PlantSowingDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 13: //授粉
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantPolDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 14: //配制
  	              url = "${ctx}/PlantOper/Mushrooms/MushPreDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 15: //装袋
  	              url = "${ctx}/PlantOper/Mushrooms/MushBaggingDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 16: //灭菌
  	              url = "${ctx}/PlantOper/Mushrooms/MushSterilizingDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 17: //接种
  	              url = "${ctx}/PlantOper/Mushrooms/MushVaccDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 18: //培养
  	              url = "${ctx}/PlantOper/Mushrooms/MushFosterDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 19: //出菇
  	              url = "${ctx}/PlantOper/Mushrooms/MushroomDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 20: //修剪
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantPruneDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 21: //疏花蔬果
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantLaxifloraDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 22: //套袋
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	          case 23: //换茬
  	              url = "${ctx}/PlantOper/Fruit/FruitPlantRotationCropsDet.html?type=2&plotOperId=" + ID;
  	              ligerWin(660, 360, url, '查看');
  	              break;
  	      }
  	  }
  	
  	  function deleteOne(type, ID) {
  	      var url = "";
  	      switch (type) {
  	          case 1: //整地
  	              url = "${ctx}/PlantOper/delPlantSowing.ajax";
  	              break;
  	          case 2: //播种定植
  	              url = "${ctx}/PlantOper/delPlantClone.ajax";
  	              break;
  	          case 3: //喷药
  	              url = "${ctx}/PlantOper/delPlantSpraying.ajax";
  	              break;
  	          case 4: //施肥
  	              url = "${ctx}/PlantOper/delPlantFertilize.ajax";
  	              break;
  	          case 5: //除草
  	              url = "${ctx}/PlantOper/delPlantWeeding.ajax";
  	              break;
  	          case 6: //浇水
  	              url = "${ctx}/PlantOper/delPlantWater.ajax";
  	              break;
  	          case 7: //其它
  	              url = "${ctx}/PlantOper/delPlantOther.ajax";
  	              break;
  	          case 8: //采收
  	              url = "${ctx}/PlantOper/delPlantHarvest.ajax";
  	              break;
  	          case 9: //清茬
  	              url = "${ctx}/PlantOper/delPlotClear.ajax";
  	              break;
  	          case 10: //加工-------------------
  	              url = "${ctx}/PlantOper/delProcess.ajax";
  	              break;
  	          case 11: //包装
  	              url = "${ctx}/PlantOper/delPackage.ajax";
  	              break;
  	          case 12: //销售----------------
  	              url = "";
  	              break;
  	          case 13: //授粉
  	              url = "${ctx}/PlantOper/delPlantPol.ajax";
  	              break;
  	          case 14: //配制
  	              url = "${ctx}/PlantOper/delMushPre.ajax";
  	              break;
  	          case 15: //装袋
  	              url = "${ctx}/PlantOper/delMushBagging.ajax";
  	              break;
  	          case 16: //灭菌
  	              url = "${ctx}/PlantOper/delMushSterilizing.ajax";
  	              break;
  	          case 17: //接种
  	              url = "${ctx}/PlantOper/delMushVacc.ajax";
  	              break;
  	          case 18: //培养
  	              url = "${ctx}/PlantOper/delMushFoster.ajax";
  	              break;
  	          case 19: //出菇
  	              url = "${ctx}/PlantOper/delMushRoom.ajax";
  	              break;
  	          case 20: //修剪
  	              url = "${ctx}/PlantOper/delPlotPrune.ajax";
  	              break;
  	          case 21: //疏花蔬果
  	              url = "${ctx}/PlantOper/delPlotLaxiflora.ajax";
  	              break;
  	          case 22: //套袋
  	              url = "${ctx}/PlantOper/delPlotFruitBagging.ajax";
  	              break;
  	          case 23: //换茬
  	              url = "${ctx}/PlantOper/delFruitRot.ajax";
  	              break;
  	      }
  	      art.dialog.confirm(
  				"确定删除？", 
  				function (yes) { 
  					$.ajax({
  						type: "post",
  						url: url,
  						data: { "plotOperId": ID, "type": "delete" },
  						dataType: "json",
  						returnType:"json",
  						error : function(XMLResponse) {
  							openDialogInDiv(XMLResponse.responseText);
  						},
  						success : function(jsonData) {
  							//后台操作成功
  							if(jsonData.success && jsonData.success == true){
  								art.dialog.tips('操作成功！',1);
  								setTimeout(function () {
  									grid5.reload();
  								},500);
  							}
  							//后台操作失败
  							else{
  								setButtonDisabled(false);
  								openDialogInDiv('操作失败：'+jsonData.message,function(){});
  							}
  						}
  					});
  				}
  		);
  	  }
	</script>
</body>
</html>
