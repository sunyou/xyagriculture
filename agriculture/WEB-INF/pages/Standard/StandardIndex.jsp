
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<head>

     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/icon.css" rel="stylesheet" type="text/css">
     <style>
    	  body,html{ background: url(${ctx}/images/bg2.jpg) no-repeat;}
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script language="javascript" src="${ctx}/js/jquery-1.11.3.js" ></script>
    <script language="javascript" src="${ctx}/js/bootstrap.min.js" ></script>
    <script language="javascript" src="${ctx}/js/jquery.placeholder.min.js" ></script>
    <script type="text/javascript">
        $(function () {
            // Invoke the plugin
            $('input, textarea').placeholder();
        });
         
 	function openWin(title,url){
 		window.parent.tab.addTabItem({text: title, 'url': url,closable:true});
 	}
   
    </script>
 
    <title>农产品溯源管理系统</title>

</head>

<body>

    <!--right begin-->
    <div class="wrap100 right">

        <div class="knowledge">
            <div class="indexesList">
                <dl>
                    <dt><a href="javascript:void(0)" class="k-icon1">国家相关标准</a> </dt>
                    <dd>
                         <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==16 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:if
								test="${child.menuItem.menuId==1651 && !empty child.childMenuItems}">
								<c:forEach items="${child.childMenuItems}" var="childThree">
									<c:choose>
										<c:when test="${empty childThree.childMenuItems}">
											<a text="${childThree.menuItem.menuName}"
												url="${ctx}${childThree.menuItem.menuUrl}"
												tabid="${childThree.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${childThree.menuItem.menuName}',url:'${ctx}${childThree.menuItem.menuUrl}','tabid':'${childThree.menuItem.menuId}'})">${childThree.menuItem.menuName}</a>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="javascript:void(0)"class="k-icon2">生产过程相关标准</a> </dt>
                    <dd>
                       <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==16 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:if
								test="${child.menuItem.menuId==1652 && !empty child.childMenuItems}">
								<c:forEach items="${child.childMenuItems}" var="childThree">
									<c:choose>
										<c:when test="${empty childThree.childMenuItems}">
											<a text="${childThree.menuItem.menuName}"
												url="${ctx}${childThree.menuItem.menuUrl}"
												tabid="${childThree.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${childThree.menuItem.menuName}',url:'${ctx}${childThree.menuItem.menuUrl}','tabid':'${childThree.menuItem.menuId}'})">${childThree.menuItem.menuName}</a>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="javascript:void(0)"class="k-icon3">病虫害预防诊断知识库</a> </dt>
                    <dd>
                          <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==16 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:if
								test="${child.menuItem.menuId==1653 && !empty child.childMenuItems}">
								<c:forEach items="${child.childMenuItems}" var="childThree">
									<c:choose>
										<c:when test="${empty childThree.childMenuItems}">
											<a text="${childThree.menuItem.menuName}"
												url="${ctx}${childThree.menuItem.menuUrl}"
												tabid="${childThree.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${childThree.menuItem.menuName}',url:'${ctx}${childThree.menuItem.menuUrl}','tabid':'${childThree.menuItem.menuId}'})">${childThree.menuItem.menuName}</a>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="javascript:void(0)"class="k-icon4">其它知识库</a> </dt>
                    <dd>
                          <c:forEach
							items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
							var="menu">
							<c:if
								test="${menu.menuItem.menuId==16 && !empty menu.childMenuItems}">
								<c:forEach items="${menu.childMenuItems}" var="child">
									<c:if
								test="${child.menuItem.menuId==1656 && !empty child.childMenuItems}">
								<c:forEach items="${child.childMenuItems}" var="childThree">
									<c:choose>
										<c:when test="${empty childThree.childMenuItems}">
											<a text="${childThree.menuItem.menuName}"
												url="${ctx}${childThree.menuItem.menuUrl}"
												tabid="${childThree.menuItem.menuId}"
												href="javascript:window.parent.tab.addTabItem({text:'${childThree.menuItem.menuName}',url:'${ctx}${childThree.menuItem.menuUrl}','tabid':'${childThree.menuItem.menuId}'})">${childThree.menuItem.menuName}</a>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:if>
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

    <div class="clear"></div>


</body>
</html>