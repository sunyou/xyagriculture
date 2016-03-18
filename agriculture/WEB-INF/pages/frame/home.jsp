<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <%@ include file="/common/meta.jsp" %>
 
    <title>农产品溯源管理系统</title>
    <style>
    	body,html{background:#92b965;}
    </style>
</head>

<body>


    <!--right begin-->
    <div class="wrap100 right">

        <div class="indexes">
            <div class="wrap text-center p-b-20"><a href="#"><img src="${ctx}/images/logo2.gif" width="50%" /> </a> </div>
            <div class="indexesList">
                <dl>
                    <dt><a href="javascript:void(0)">我的档案</a> </dt>
                    <dd>
						<c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==10 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:choose>
										<c:when test="${empty child.childMenuItems}">
											<span><a text="${child.menuItem.menuName}"
												url="${ctx}${child.menuItem.menuUrl}"
												tabid="${child.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
											</span>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
						</c:forEach>
					</dd>
                </dl>
                <dl class="arrow-right"><img src="${ctx}/images/arrow2.gif"/> </dl>
                <dl>
                    <dt><a href="javascript:void(0)">采购管理</a> </dt>
                    <dd>
                        <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==11 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:choose>
										<c:when test="${empty child.childMenuItems}">
											<span><a text="${child.menuItem.menuName}"
												url="${ctx}${child.menuItem.menuUrl}"
												tabid="${child.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
											</span>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl class="arrow-right"><img src="${ctx}/images/arrow2.gif"/> </dl>
                <dl>
                    <dt><a href="javascript:void(0)">种植管理</a> </dt>
                    <dd>
                        <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==12 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:choose>
										<c:when test="${empty child.childMenuItems}">
											<span><a text="${child.menuItem.menuName}"
												url="${ctx}${child.menuItem.menuUrl}"
												tabid="${child.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
											</span>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl class="arrow-right"><img src="${ctx}/images/arrow2.gif"/> </dl>
                <dl>
                    <dt><a href="javascript:void(0)">质量检测</a> </dt>
                    <dd>
                        <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==13 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:choose>
										<c:when test="${empty child.childMenuItems}">
											<span><a text="${child.menuItem.menuName}"
												url="${ctx}${child.menuItem.menuUrl}"
												tabid="${child.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
											</span>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl class="arrow-right"><img src="${ctx}/images/arrow2.gif"/> </dl>
                <dl>
                    <dt><a href="javascript:void(0)">加工包装</a> </dt>
                    <dd>
                        <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==14 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:choose>
										<c:when test="${empty child.childMenuItems}">
											<span><a text="${child.menuItem.menuName}"
												url="${ctx}${child.menuItem.menuUrl}"
												tabid="${child.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
											</span>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl class="arrow-right"><img src="${ctx}/images/arrow2.gif"/> </dl>
                <dl>
                    <dt><a href="javascript:void(0)">销售物流</a> </dt>
                    <dd>
                        <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==15 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:choose>
										<c:when test="${empty child.childMenuItems}">
											<span><a text="${child.menuItem.menuName}"
												url="${ctx}${child.menuItem.menuUrl}"
												tabid="${child.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
											</span>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>




                <div class="clear"></div>
            </div>
        </div>

    </div>
    <!--right end-->







<%--     
    <div style="margin: 10% auto 0px auto; width: 500px;">
        <img src="${ctx}/images/kjmh.jpg" width="466" height="322" usemap="#Map" border="0" />
        <map name="Map" id="Map">
            <area shape="rect" coords="58,171,123,189" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Material/GoodVarietyList.html');" href="javascript:;" title="种苗/品种" />
             <area shape="rect" coords="50,192,130,210" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Info/CoFarmerMaterialList.html');" href="javascript:;" title="投入品采购" />
            <area shape="rect" coords="58,195,124,210" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Material/PesticidesList.html');" href="javascript:;" title="农药/化肥" />
            <area shape="rect" coords="58,214,125,231" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Material/OtherList.html');" href="javascript:;" title="其它投入品" />
            <area shape="rect" coords="204,253,267,271" onclick="parent.f_addTab(null, this.title, '${ctx}/Detection/DetectionList.html');" href="javascript:;" title="农残检测" />
            <area shape="rect" coords="204,274,269,293" onclick="parent.f_addTab(null, this.title, '${ctx}/Package/Package.html');" href="javascript:;" title="产品包装" />

            <area shape="rect" coords="197,294,271,313" onclick="parent.f_addTab(null, this.title, '${ctx}/Label/ApplyLabelPrint.html');" href="javascript:;" title="二维码打印" />
            <area shape="rect" coords="200,86,264,110" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Info/FarmerList.html');" href="javascript:;" title="农户信息" />
            <area shape="rect" coords="198,111,265,130" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Info/PlantBaseList.html');" href="javascript:;" title="基地信息" />
            <area shape="rect" coords="196,132,267,148" onclick="parent.f_addTab(null, this.title, '${ctx}/Base/Info/TechnicianList.html');" href="javascript:;" title="技术员信息" />
            <area shape="rect" coords="346,167,404,191" onclick="parent.f_addTab(null, this.title, '${ctx}/Plant/Archives/Criteria.html');" href="javascript:;" title="种植标准" />
            <area shape="rect" coords="346,192,406,211" onclick="parent.f_addTab(null, this.title, '${ctx}/Plant/PlantOperate.html');" href="javascript:;" title="农事操作" />
            <area shape="rect" coords="347,211,406,232" onclick="parent.f_addTab(null, this.title, '${ctx}/Plant/Vegetables/PlantLot_List.html');" href="javascript:;" title="种植批次" />
        </map>
    </div> --%>
        
</body>
</html>
