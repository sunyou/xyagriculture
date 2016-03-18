<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<dl>
	<c:if
		test="${empty sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}">
		<dt>
				<a class="left-arrow-right" href="javascript:void(0)">暂无菜单
				</a>
		</dt>
	</c:if>
	<c:forEach
		items="${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}"
		var="menu">
		<c:if test="${menu.menuItem.menuId==currentMenuPid && empty menu.childMenuItems}">
             	<dt>
							<span><a class="left-arrow-right" href="javascript:void(0)">暂无菜单
				</a>
							</span>
				</dt>
        </c:if>
		<c:if
			test="${menu.menuItem.menuId==currentMenuPid && !empty menu.childMenuItems}">
			<c:forEach items="${menu.childMenuItems}" var="child">
				<c:choose>
					<c:when test="${empty child.childMenuItems}">
						<dt id="${child.menuItem.menuId}" iconCls="icon-column">
							<span><a class="left-arrow-right" text="${child.menuItem.menuName}" url="${ctx}${child.menuItem.menuUrl}" tabid="${child.menuItem.menuId}"
								href="javascript:tab.addTabItem({text:'${child.menuItem.menuName}',url:'${ctx}${child.menuItem.menuUrl}','tabid':'${child.menuItem.menuId}'})">${child.menuItem.menuName}</a>
							</span>
						</dt>
					</c:when>
					<c:otherwise>
						<dt id="${child.menuItem.menuId}" iconCls="icon-column">
							<span><a class="left-arrow-right" text="${child.menuItem.menuName}" url="${ctx}${child.menuItem.menuUrl}" tabid="${child.menuItem.menuId}"
								href="javascript:toggleTreeLevelTree('${child.menuItem.menuId}')">${child.menuItem.menuName}</a></span>
							</dt>
								<span class="expand" id="three_${child.menuItem.menuId}">
									<c:forEach items="${child.childMenuItems}" var="menuChild">
											<dd >
												<span><a class="left-arrow-right" text="${child.menuItem.menuName}" url="${ctx}${child.menuItem.menuUrl}" tabid="${child.menuItem.menuId}"
													href="javascript:tab.addTabItem({text:'${menuChild.menuItem.menuName}',url:'${ctx}${menuChild.menuItem.menuUrl}','tabid':'${menuChild.menuId}'})">${menuChild.menuItem.menuName}</a>
												</span>
											</dd>
									</c:forEach>
								</span>
						
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</c:forEach>
</dl>
