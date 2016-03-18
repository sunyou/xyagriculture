<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑种植基地</title>
      <%@ include file="/common/include.jsp"%>
    <script type="text/javascript" src="${ctx}/content/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/area.js"></script>
    <script type="text/javascript">
    var grid2 = null;
        $(document).ready(function () {
            
          $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
          
          
          
            $("#form1").validate({
                //debug: true,
				 onfocusout : false,
				 showErrors : function(errorMap, errorList) {
				   var msg = "";  
				 $.each(errorList, function(i, v) { 
				  msg += (v.message + "\r\n");   });
				  if (msg != "")  alert(msg);   
				}, 
                errorPlacement: function (error, element) {
                    //".AreaList"
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                    txt_PlantLotName: "required",
                    txt_Areas: { required: true, number: true },
                    txt_CoFarmerName: "required",
                    uc_Areas$ddlTown: {
                        min: 1
                    },
                    txt_Tel: {
                        required: true,
                        isPhone: true
                    },
                    txt_Contacts: "required",
                    txt_Addr: "required",
                     town:{
				        required:true
			         }
                },
                messages: {
                    txt_PlantLotName: "请填写种植基地名称",
                    txt_Areas: { required: "请填写区域面积" },
                    txt_CoFarmerName: "请填写生产者名称",
                    uc_Areas$ddlTown: { min: "请选择地区" },
                    txt_Tel: {
                        required: "请填写电话",
                        isPhone: "请填写一个手机号码"
                    },
                    txt_Contacts: "请填联系人",
                    txt_Addr: "请填写联系地址",
                     town:{
					  required:"请选择所在地区"
				  }
                }
            });

             $('#fileUpload1').fileupload({
            	filePathId:'docfilepath',
            	validTypes:'jpg,jpeg,gif,bmp,png'
            });
            
            
             if (grid2 == null) {
           grid2 = $("#gv_PLot").createLigerGrid({
                            header: [
                            { display: '地块编号', name: 'Plot_No',widht:'220',render:showPlotDetail },
                            { display: '地块名称', name: 'Plot_Name', widht: '230',render:showPlotDetail },
                            { display: '地块面积(亩)', name: 'Areas', type: 'double', format: '0.00' },
                            { display: '生产责任人', name: 'Farmer_Name' },
                            { display: '土地状态', name: 'State', render: function (rowdata, index, value) { if (value == '1') { return "<font color='#FF5500'>已使用</font>" } else { return "<font color='#0063DC'>未使用</font>"; } } },
                            ],
                            param: { 'flag': 2, 'Parent_ID': $("#plantId").val()},
                            editor: {
                                width: 510,
                                height: 500
                            },
                           
                            height:400,
                            leftBtns: {
                               show:false   
                              <shiro:hasPermission name="1005:plantbase.edit">     
                             	,show:true, 
                              
                                showDelete: {
                                    show:true,
                                     url: "${ctx}/Plot/PlotDel.ajax",
                                    close: function () {
                                        grid2.reload();
                                    }
                                },
                                showDetail: {
                                    show:false,
                                    url: "${ctx}/Plot/PlotDet.html",
                                    width: 591,
                                    height: 140
                                },
                                showEdit: {
                                    show:true,
                                    url: "${ctx}/Plot/GoToPlotEdit.html",
                                    width:660,
                                    height:360,
                                    close: function () {
                                        grid2.reload();
                                    }
                                }
                                 </shiro:hasPermission>
                            },
                            
                            delayLoad: false,
                            keyID: "PLOT_ID",
                            ajaxURL: "${ctx}/Plot/getPlot.ajax"
                        });
                    } else {
                        grid2.setParm('Parent_ID', $("#plantId").val());
                        grid2.reload();
                    } 
                    
                     $("#btn_Add").click(function () {
                       var baseName=encodeURI(encodeURI($("#txt_PlantLotName").val()));
                      ligerWin(660, 360, '${ctx}/Plot/PlotEditMutil.html?baseID='+$("#plantId").val()+'&baseName='+baseName, '新增地块');
                     });
        
        });
        
        
          $(function () {
            // Invoke the plugin
            $('input, textarea').placeholder();
        });
        var GLOBAL = {
		    WEBROOT:"${ctx}"
		};
		
		  function showPlotDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlot('"
             	+rowdata["PLOT_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
         function showPlot(Id ,Name){
        	myopen("${ctx}/Plot/PlotDet.html?type=3&id="+Id,"查看地块 " + Name + " 的详情"  ,660,360);
        }
    </script>
   
</head>
<body>
    <form method="post" action="${ctx}/PlantBases/PlantBaseEdit.html?type=2&amp;id=5D1089C9-EDE9-424D-87EF-002B01D836CD" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMzE2NDg4NzgxD2QWAmYPZBYEAgEPDxYEHgRUZXh0BQ5KRDYxMDQwMzAwODEyMB4HRW5hYmxlZGhkZAIFDw8WBB8ABTDmnajlh4znqLznpr7mtqbms73njrDku6PlhpzkuJrnp5HmioDmnInpmZDlhazlj7gfAWhkZGQRWr8bPJ1ZhWXdfnPmOXkh5mR+sfSlzYX0Gecjf1d1UA==" />
</div>

        <div class="edit_panel">
		<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="70">
                        <div class="th_text">基地编号:</div>
                    </th>
                    <td>
                        <input name="txt_PlantLotNo" type="text" value="${bean.plantbasesNo}" id="txt_PlantLotNo" disabled="disabled" class="aspNetDisabled inw" />
                    </td>
                     <th width="70">
                        <div class="th_text">基地名称:</div>
                    </th>
                    <td>
                        <input name="txt_PlantLotName" type="text" value="${bean.plantbasesName}" id="txt_PlantLotName" class="inw" />
                    </td>
                </tr>
              
                <tr>
                    <th>
                        <div class="th_text">生产者:</div>
                    </th>
                    <td>
                        <input name="txt_CoFarmerName" type="text" value="${bean.cofarmerName}" id="txt_CoFarmerName" disabled="disabled" class="aspNetDisabled inw" />
                    </td>
                     <th>
                        <div class="th_text">联系人:</div>
                    </th>
                    <td>
                        <input name="txt_Contacts" type="text" value="${bean.contacts}" id="txt_Contacts" class="inw" />
                    </td>
                </tr>
             
                <tr>
                    <th>
                        <div class="th_text">电话:</div>
                    </th>
                    <td>
                        <input name="txt_Tel" type="text" value="${bean.tel}" id="txt_Tel" class="inw" />
                    </td>
                      <th>
                        <div class="th_text">种植环境:</div>
                    </th>
                    <td >
                        <input name="txt_PlotEnvironment"   type="text" value="${bean.plotenvironment}" id="txt_PlotEnvironment" class="inw" />
                    </td>
                </tr>
                <tr>
                 <th>
                        <div class="th_text">基地图片:</div>
                    </th>
                    <td colspan="3">
                          <div id="fileUpload1">
                          </div>
                    </td>
                </tr>
              
               
                </tr>
                <tr>
                    <th>
                        <div class="th_text">详细地址:</div>
                    </th>
                    <td colspan="3">
                        <input name="txt_Addr" type="text" style="width:500px;" value="${bean.detailaddr}" id="txt_Addr" class="inw" />
                    </td>
                    
                </tr>
              
                <tr>
                    <th>
                        <div class="th_text">说明:</div>
                    </th>
                    <td colspan="3">
                        <textarea name="txt_Notes" rows="5" cols="20" id="txt_Notes" style="width:500px;">${bean.notes}
</textarea>
                    </td>
                    
                </tr>
               
            </table>
              <input type="hidden" name="plantId" id="plantId" value="${bean.plantbasesUid}" /> 
              
             
             <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        </div>
         <input type="hidden" name="docfilepath" id="docfilepath" value="${bean.docfilesrc}"/>
        
        <input type="hidden" name="Areas_Help" id="Areas_Help" />
        <input type="hidden" name="hf_CoFarmer_ID" id="hf_CoFarmer_ID" value="${bean.cofarmerId}" />
        <input type="hidden" name="plantbasesUid" id="plantbasesUid" value="${bean.plantbasesUid}" />
        <input type="hidden" name="areaId" id="areaId" value="${bean.areaId}" />
         <input type="hidden" name="plantBasesNo" id="plantBasesNo" value="${bean.plantbasesNo}" />
        <input type="hidden" name="plantBasesName" id="plantBasesName" value="${bean.plantbasesName}" />
        
       
        <div id="divMsg" style="display: none;"></div>
    </form>
    
    	
		<div position="top" style="margin-top: 40px;">
			<div class="rtittab">
				<div class="rtitbg2">
			         <div class="rtxt left">地块列表</div>
					<shiro:hasPermission name="1005:plantbase.edit">   
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 </shiro:hasPermission>
					
				</div>
			</div>
		
		
		</div>
		<div position="center" >
             <div id="gv_PLot"></div>
              </div>
      
</body>
</html>
