<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <link href="${ctx}/content/css/Pages/GovHome.css" rel="stylesheet" />
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/icon.css" rel="stylesheet" type="text/css">
    <title>监管者主界面</title>
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/Marquee.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/Pages/PlantLot_Oper.js"></script>
    <script type="text/javascript">
        var dataNum = 5;
        $(document).ready(function () {
            getAjax('${ctx}/Home/GetGovHome.ajax?', null, function (data) {
       
                var value = data.data;
                
                for (var i = 0; i < value.length; i++) {
                    switch (i) {
                        case 0:
                            if (value[i].length == 0) {

                            } else {
                                BindTopChart(value[i]);
                            }
                            break;
                        case 1:
                            if (value[i].length == 0) {
                                $("#div_Apply_Data").html("暂无消息..");
                            } else {
                                AddApplyRow(value[i]);
                            }
                            break;
                        case 2:
                            if (value[i].length == 0) {

                            } else {
                                AddAuditRow(value[i]);
                            }
                            break;
                        case 3:
                            if (value[i].length == 0) {
                            } else {
                                AddOperateRow(value[i]);
                            }
                            break;
                        case 4:
                            if (value[i].length == 0) {
                            } else {
                                AddMaterialRow(value[i]);
                            }
                            break;
                        case 5:
                            if (value[i].length == 0) {
                            } else {
                                AddHarvestRow(value[i]);
                            }
                            break;
                        case 6:
                            if (value[i].length == 0) {
                            } else {
                                AddLabelRow(value[i]);
                            }
                            break;
                    }
                }
                MyLoading(false);
            });
            BuildMarquee();
        });

        function OpenMore(tabid, text, url) {
            parent.f_addTab(tabid, text,url);
        }

        function OpenOne(id,type,date)
        {
            if (type == 'Harvest') {
                url = '${ctx}/PlotHarvest/PlotHarvestDet.html?plotharvestNo=' + id
                ligerWin(660, 360, url, '采收信息');
            } else if (type == 'NY') {
                url = '${ctx}/Base/Material/CoFarmerNYDet.html?id=' + id
                ligerWin(660, 360, url, '农药信息');
            } else if (type == 'FL') {
                url = '${ctx}/Base/Material/CoFarmerFLDet.html?id=' + id
                ligerWin(660, 360, url, '肥料信息');
            }else if (type == 'Lable') {
                url = '${ctx}/Label/LabelPrintList.html?CoFarmer_ID=' + id+'&Print_Date='+date
                ligerWin(840, 460, url, '消息');
            }
        }


        function BuildMarquee() {
            $("#div_Apply_Data").marquee({
                auto: true,
                interval: 2000,
                showNum: 6,
                stepLen: 1,
                type: 'vertical'
            });
            $("#div_Audit_Data").marquee({
                auto: true,
                interval: 2000,
                showNum: 6,
                stepLen: 1,
                type: 'vertical'
            });
            $("#div_Operate_Data").marquee({
                auto: true,
                interval: 2000,
                showNum: 6,
                stepLen: 1,
                type: 'vertical'
            });
            $("#div_Material_Data").marquee({
                auto: true,
                interval: 2000,
                showNum: 6,
                stepLen: 1,
                type: 'vertical'
            });
            $("#div_Label_Data").marquee({
                auto: true,
                interval: 2000,
                showNum: 6,
                stepLen: 1,
                type: 'vertical'
            });
            $("#div_Harvest_Data").marquee({
                auto: true,
                interval: 2000,
                showNum: 6,
                stepLen: 1,
                type: 'vertical'
            });
        }

        function BindTopChart(data) { 
           // var value = '您的账号隶属于:<span class="F01">' + data[0].area_FullName + '</span><br/>'
           // value += '本地区共有<br/>';
           // value += '<span class="F04">' + data[0].coFarmerNum + '</span>家生产者，';
           /// value += '<span class="F04">' + data[0].farmerNum + '</span>户农民，';
           // value += '<span class="F04">' + data[0].plotAreas + '</span>亩土地<br/>';
           // value += '<span class="F04">' + data[0].supplierNum + '</span>家农资经销商，共销售';
           // value += '<span class="F04">' + data[0].feiLiaoNum + '</span>种肥料，';
           // value += '<span class="F04">' + data[0].nongYaoNum + '</span>种农药，';
           // value += '<span class="F04">' + data[0].goodVarietyNum + '</span>种种苗';
            $("#coFarmerNum").html(data[0].coFarmerNum);
            $("#farmerNum").html(data[0].farmerNum);
            $("#plotAreas").html(data[0].plotAreas);
            $("#supplierNum").html(data[0].supplierNum);
            $("#feiLiaoNum").html(data[0].feiLiaoNum);
            $("#nongYaoNum").html(data[0].nongYaoNum);
            $("#goodVarietyNum").html(data[0].goodVarietyNum);
            $("#coFarmerAppNum").html(data[0].coFarmerAppNum);
            $("#labelAppNum").html(data[0].labelAppNum);
            $("#inquryNum").html(data[0].inquryNum);
         
        }

        function AddHarvestRow(data)
        {
            
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                value += "<a href='javascript:;' onclick=\"OpenOne('" + data[i].plotoperId + "','Harvest')\">";
                value += Convert2Date(data[i].operateDate, 'yyyy-MM-dd') + '&nbsp;&nbsp;&nbsp;&nbsp;' + data[i].cofarmerName + '采收了<span class="F03">' + data[i].notes+ data[i].goodsName + '</span>';
                value += '</a></li>';
                $("#ul_Harvest_Data").append(value);
            }
        }

        function AddLabelCountRow(data) {
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                value += '<a href="#">';
                value += data[i].cofarmerName + '共打印了<span class="F03">' + data[i].labelCount + '</span>张溯源标签';
                value += '</a></li>';
                $("#ul_LabelCount_Data").append(value);
            }
        }

        function AddLabelRow(data) {
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                value += '<a href="#">';
                value += Convert2Date(data[i].printDate, 'yyyy-MM-dd') + '&nbsp;&nbsp;&nbsp;&nbsp;' + data[i].cofarmerName + '打印了<span class="F03">' + data[i].labelcount + '</span>张溯源标签';
                value += '</a></li>';
                $("#ul_Label_Data").append(value);
            }
        }

        function AddMaterialRow(data) {
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                value += "<a href='javascript:;' onclick=\"DetailOne(" + data[i].operatetypeCode + ",'" + data[i].plotoperId + "')\">";
                value += Convert2Date(data[i].operateDate, 'yyyy-MM-dd') + '&nbsp;&nbsp;&nbsp;&nbsp;';
                value += data[i].cofarmerName + '对<span class="F03">' + data[i].goodsName + '</span>施用了<span class="F03">' + data[i].materialName + '</span>';
                value += '&nbsp;&nbsp;<b>(' + data[i].operatetypename + ')</b>';
                value += '</a></li>';
                $("#ul_Material_Data").append(value);
            }
        }

        function AddOperateRow(data) {
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                value += "<a href='javascript:;' onclick=\"DetailOne(" + data[i].operatetypeCode + ",'" + data[i].plotoperId + "')\">";
                value += Convert2Date(data[i].operateDate, 'yyyy-MM-dd  hh:mm:ss') + '&nbsp;&nbsp;&nbsp;&nbsp;' + data[i].cofarmerName + '提交一笔<span class="F03">' + data[i].operatetypename + '</span>信息';
                value += '</a></li>';
                $("#ul_Operate_Data").append(value);
            }
        }

        function AddApplyRow(data) {
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                if (data[i].deptType == "1") {
                    value += "<a href='javascript:;' onclick=\"OpenOne('" + data[i].applyId + "','CoFarmerAudit')\">";
                } else if (data[i].deptType == "2") {
                    value += "<a href='javascript:;' onclick=\"OpenOne('" + data[i].applyId + "','SupplierAudit')\">";
                } else {
                    value += "<a href='javascript:;' onclick=''>";
                }
                value += Convert2Date(data[i].applyDate, 'yyyy-MM-dd') + '&nbsp;&nbsp;&nbsp;&nbsp;';
                value += '<span class="F03">' + data[i].deptName + '&nbsp;&nbsp;(' +data[i].deptTypeShow + data[i].applyTypeShow + ')</span>';
                value += '</a></li>';
                $("#ul_Apply_Data").append(value);
            }
        }

        function AddAuditRow(data) {
            for (var i = 0; i < data.length; i++) {
                var value = '<li>';
                if (data[i].deptType == "1") {
                    value += "<a href='javascript:;' onclick=\"OpenOne('" + data[i].applyId + "','CoFarmerAudit')\">";
                } else if (data[i].deptType == "2") {
                    value += "<a href='javascript:;' onclick=\"OpenOne('" + data[i].applyId + "','SupplierAudit')\">";
                } else {
                    value += "<a href='javascript:;' onclick=''>";
                }
                value += Convert2Date(data[i].applyDate, 'yyyy-MM-dd') + '&nbsp;&nbsp;&nbsp;&nbsp;审核';
                value += '<span class="F03">' + data[i].deptName + '</span>的申请&nbsp;&nbsp;<span class="F03">(' + data[i].auditResultShow + ')</span>';
                value += '</a></li>';
                $("#ul_Audit_Data").append(value);
            }
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 667px;
        }
        .auto-style2 {
            background-color: #FFFFFF;
            width: 667px;
        }
    </style>
</head>

<body>



    <!--right begin-->
    <div class="wrap100 right">

        <div class="supervision">

            <div class="title">
                <h4 class="w-b-10">本地区共有</h4>
            </div>
            
   
            <div class="supervision-date">
                <ul>
                    <li class="cricle-bg1"><a href="#"> 生产者<br/><span id="coFarmerNum"></span>家</a></li>
                    <li class="cricle-bg2"><a href="#"> 农民<br/><span id="farmerNum"></span>户</a></li>
                    <li class="cricle-bg3"><a href="#"> 土地<br/><span id="plotAreas"></span>亩</a></li>
<!--                <li class="cricle-bg4"><a href="#"> 农资经销商<br/><span id="supplierNum"></span>家</a></li> -->                    
					<li class="cricle-bg5"><a href="#"> 销售肥料<br/><span id="feiLiaoNum"></span>种</a></li>
                    <li class="cricle-bg6"><a href="#"> 销售农药<br/><span id="nongYaoNum"></span>种</a></li>
                    <li class="cricle-bg7"><a href="#"> 销售种苗<br/><span id="goodVarietyNum"></span>种</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            
            <div class="examine">
            <c:if test="${empty type}"><!-- 是否市级监管者 -->
                <dl class="green-bg1" >
                    <dt class="fl"><img src="${ctx}/images/jg-icon1.png" width="60"/> </dt>
                    <dd class="fl">生产者准入申请<br />待审核<a href="#" onclick="OpenMore('div_Apply','生产者待审核','${ctx}/CoFarmerAudit/CoFarmerAudit.html?type=UnAudit')"><span id="coFarmerAppNum"></span></a>条</dd>
                    <div class="clear"></div>
                </dl>
                <dl class="green-bg2">
                    <dt class="fl"><img src="${ctx}/images/jg-icon2.png" width="60"/> </dt>
                    <dd class="fl">标签打印申请<br />待审核<a href="#" onclick="OpenMore('div_Apply','标签待审核','${ctx}/Label/ApplyLabelList.html')"><span id="labelAppNum"></span></a>条</dd>
                    <div class="clear"></div>
                </dl>
               </c:if>
                  <dl class="green-bg3">
                    <dt class="fl"><img src="${ctx}/images/jg-icon3.png" width="60"/> </dt>
                    <dd class="fl">质询<br />质询数量<a href="#" onclick="OpenMore('div_Apply','标签待审核','${ctx}/Base/Material/InquiryList.html')"><span id="inquryNum"></span></a>条</dd>
                    <div class="clear"></div>
                </dl>
              

            </div>

  
    <div class="supervision-content" >

                <div class="fl supervision-list" style="height:200px;">
                    <h5><span class="fl arrow-r">农药使用预警</span> <span class="fr"><a href="#" onclick="OpenMore('div_Apply','农药使用预警','${ctx}/Base/Material/CoFarmerNYUseList.html')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                   		  <ol>
							<c:if test="${not empty nyBeans}">
								<c:forEach items="${nyBeans}" var="nyBean">
									<li><a href="#" onclick="OpenOne('${nyBean.plotoperId}','NY','');">${nyBean.cofarmerName}对${nyBean.plotName}地块的${nyBean.goodsfullname}使用了${nyBean.materialName}农药</a><span class="time"><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${nyBean.operateDate}" /></span></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty nyBeans}">
							             暂无消息...
							</c:if>
						</ol>
                    </div>
                </div>

                <div class="fl supervision-list" style="height:200px;">
                    <h5><span class="fl arrow-r">肥料使用预警</span> <span class="fr"><a href="#" onclick="OpenMore('div_Audit','肥料使用预警','${ctx}/Base/Material/CoFarmerFLUseList.html')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                           <ol>
                          <c:if test="${not empty flBeans}">
								<c:forEach items="${flBeans}" var="flBean">
									<li><a href="#" onclick="OpenOne('${flBean.plotoperId}','FL','');">${flBean.cofarmerName}对${flBean.plotName}地块的${flBean.goodsfullname}使用了${flBean.materialName}肥料</a><span class="time"> <fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${flBean.operateDate}" /></span></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty flBeans}">
							             暂无消息...
							</c:if>
                        </ol>

                    </div>
                </div>
                
                
                 <div class="supervision-content" >
                   <div class="fl supervision-list" style="height:200px;">
                    <h5><span class="fl arrow-r">采收记录</span> <span class="fr"><a href="#" onclick="OpenMore('div_Apply','采收记录','${ctx}/PlotHarvest/PlotOper/PlotHarvestList.html')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                     <ol>
                             <c:if test="${not empty harvestList}">
								<c:forEach items="${harvestList}" var="harvestBean">
									<li><a href="#" onclick="OpenOne('${harvestBean.plotharvestNo}','Harvest','');">${harvestBean.cofarmerName}采收了${harvestBean.goodsName}${harvestBean.qty}${harvestBean.imagesrc}</a><span class="time"><fmt:formatDate type="date" value="${harvestBean.operateDate}" pattern="yyyy-MM-dd" /></span></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty flBeans}">
							             暂无消息...
							</c:if>
                    </ol>
                    </div>
                </div>

                <div class="fl supervision-list" style="height:200px;">
                    <h5><span class="fl arrow-r">标签打印消息</span> <span class="fr"><a href="#" onclick="OpenMore('div_LabelPrint','标签打印列表','${ctx}/Label/LabelPrintCount.html')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                    <ol>
                          <c:if test="${not empty labeBeans}">
								<c:forEach items="${labeBeans}" var="labeBean">
									<li><a href="#" onclick="OpenOne('${labeBean.cofarmerId}','Lable','${labeBean.printDate}');">${labeBean.cofarmerName}打印了${labeBean.labelcount}张溯源标签</a><span class="time">${labeBean.printDate}</span></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty flBeans}">
							             暂无消息...
							</c:if>
                     </ol>
                    </div>
                </div>
            </div>
                <!--  
             <div class="supervision-content">
                       <div class="fl supervision-list" style="height:200px;">
                    <h5><span class="fl arrow-r">投入品使用</span> <span class="fr"><a href="#" onclick="OpenMore('div_Apply','投入品使用','${ctx}/CoFarmerAudit/CoFarmerAudit.html?type=UnAudit')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                               <ol>
                          <c:if test="${not empty inputList}">
								<c:forEach items="${inputList}" var="inputBean">
									<li><a href="#">${inputBean.cofarmerName}对${inputBean.goodsName}施用了${inputBean.materialName}&nbsp;&nbsp;(${inputBean.operatetypename})</a><span class="time">${inputBean.operateDate}</span></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty flBeans}">
							             暂无消息...
							</c:if>
                     </ol>

                    </div>
                </div>

                <div class="fl supervision-list" style="height:200px;">
                    <h5><span class="fl arrow-r">农事操作</span> <span class="fr"><a href="#" onclick="OpenMore('div_Audit','农事操作','${ctx}/CoFarmerAudit/CoFarmerAudit.html?type=Audit')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                          <ol>
                          <c:if test="${not empty farmingList}">
								<c:forEach items="${farmingList}" var="farmingBean">
									<li><a href="#">${farmingBean.cofarmerName}提交一笔${farmingBean.operatetypename}信息</a><span class="time">${farmingBean.operateDate}</span></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty flBeans}">
							             暂无消息...
							</c:if>
                     </ol>

                    </div>
                </div>
-->
            </div>
            </div>
  
            
          <div class="supervision-content" style="display: none;">
                   <div class="fl supervision-list">
                    <h5><span class="fl arrow-r">采收记录</span> <span class="fr"><a href="#" onclick="OpenMore('div_Apply','采收记录','${ctx}/CoFarmerAudit/CoFarmerAudit.html?type=UnAudit')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                            <div id="div_Harvest_Data" class="marquee6">
                                            <ul id="ul_Harvest_Data"></ul>
                                        </div>

                    </div>
                </div>

                <div class="fl supervision-list">
                    <h5><span class="fl arrow-r">标签打印消息</span> <span class="fr"><a href="#" onclick="OpenMore('div_LabelPrint','标签打印列表','${ctx}/Label/LabelPrintCount.html')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                          <div id="div_Label_Data" class="marquee6">
                                            <ul id="ul_Label_Data"></ul>
                                        </div>

                    </div>
                </div>
            </div>
             <div class="supervision-content">

                       <div class="fl supervision-list" style="display: none;">
                    <h5><span class="fl arrow-r">投入品使用</span> <span class="fr"><a href="#" onclick="OpenMore('div_Apply','待办事宜','${ctx}/CoFarmerAudit/CoFarmerAudit.html?type=UnAudit')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                             <div id="div_Material_Data" class="marquee6">
                                            <ul id="ul_Material_Data"></ul>
                                        </div>

                    </div>
                </div>

                <div class="fl supervision-list" style="display: none;" >
                    <h5><span class="fl arrow-r">农事操作</span> <span class="fr"><a href="#" onclick="OpenMore('div_Audit','农事操作','${ctx}/CoFarmerAudit/CoFarmerAudit.html?type=Audit')">more</a></span><div class="clear"></div> </h5>
                    <div class="list">
                         <div id="div_Operate_Data" class="marquee6">
                                            <ul id="ul_Operate_Data"></ul>
                                        </div>

                    </div>
                </div>

            </div>

    </div>
    <!--right end-->



</body>
</html>
