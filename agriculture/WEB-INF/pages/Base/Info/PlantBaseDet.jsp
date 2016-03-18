<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>种植基地--详细信息</title>
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
    <script type="text/javascript">
    var grid2 = null;
     $(document).ready(function () {
           $.each($(".pic"), function () {
          
               if ($(this).attr("src") =="" || $(this).attr("src") =="/agriculture/") {
               
                    $(this).attr("src", "${ctx}/images/zhengshuLose.jpg");
                    $(this).parent().attr("href", "${ctx}/images/zhengshuLose.jpg");
               }
            });
     
   //  $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            if (grid2 == null) {
                        grid2 = $("#gv_PLot").createLigerGrid({
                            header: [
                            { display: '地块编号', name: 'Plot_No',widht:'220',render:showPlotDetail, width:'150' },
                            { display: '地块名称', name: 'Plot_Name', widht: '230',render:showPlotDetail, width:'250' },
                            { display: '地块面积(亩)', name: 'Areas', type: 'double', format: '0.00', width:'100' },
                            { display: '生产责任人', name: 'Farmer_Name' },
                            { display: '土地状态', name: 'State', render: function (rowdata, index, value) { if (value == '1') { return "<font color='#FF5500'>已使用</font>" } else { return "<font color='#0063DC'>未使用</font>"; } } },
                            ],
                            param: { 'flag': 2, 'Parent_ID': $("#plantId").val()},
                            editor: {
                                width: 510,
                                height: 500
                            },
                            title:'地块列表',
                            height:400,
                            leftBtns: {
                                show:false,
                                showDelete: {
                                    show:false,
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
                                    show:false,
                                    url: "${ctx}/Plot/GoToPlotEdit.html",
                                    width:660,
                                    height:360,
                                    close: function () {
                                        grid2.reload();
                                    }
                                }
                                
                            },
                            
                            delayLoad: false,
                            keyID: "PLOT_ID",
                            ajaxURL: "${ctx}/Plot/getPlot.ajax"
                        });
                    } else {
                        grid2.setParm('Parent_ID', $("#plantId").val());
                        grid2.reload();
                    } 
                    
                });
                
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
<body style="overflow-x: hidden;">
<br/>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
               
                <tr>
                    <th >
                        生产者
                    </th>
                    <td colspan="3">
                        <font color="#0090D7">${bean.cofarmerName}</font>
                    </td>
                </tr>
                <tr>
                    <th nowrap>基地名称
                    </th>
                    <td>
                       ${bean.plantbasesName}
                    </td>
                    <th nowrap>基地编号
                    </th>
                    <td>
                        ${bean.plantbasesNo}
                    </td>
                </tr>
                <tr>
                    <th nowrap>地区
                    </th>
                    <td>
                     ${bean.areaFullname}
                    </td>
                    <th nowrap>土地面积
                    </th>
                    <td>
                        ${bean.areas}亩
                    </td>

                </tr>
                <tr>
                    <th nowrap>联系人
                    </th>
                    <td>
                        ${bean.contacts}
                    </td>
                    <th nowrap>联系电话
                    </th>
                    <td>
                      ${bean.tel}
                    </td>

                </tr>

                <tr>
                    <th nowrap>地址
                    </th>
                    <td>
                    ${bean.detailaddr}
                    </td>
                    <th nowrap>说明
                    </th>
                    <td>
                     ${bean.notes}
                    </td>


                </tr>
                <tr>
                    <th nowrap>基地图片
                    </th>
                    <td colspan="3">
                        
                        <img class="pic" src="${ctx}/${bean.docfilesrc}" width="400" height="400" alt="资料" />

                         
                    </td>                   
                </tr>
            </tbody>
            <input type="hidden" name="plantId" id="plantId" value="${bean.plantbasesUid}" /> 
           
        </table>
        	 <div position="center"  style="margin-top: 40px;">
             <div id="gv_PLot"></div>
              </div>
           <div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
    </div>
  
       
</body>
</html>
