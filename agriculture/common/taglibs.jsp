
<%@page import="com.ai.common.util.ApplicationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="asia" uri="/WEB-INF/ai-tags.tld" %>
<c:set var="ctx" value="<%=com.ai.common.util.WebUtils.getBasePath(request)%>"/>
<c:set var="selfurl" value="${pageContext.request.requestURL}"/>
<c:set var="JS_VERSION" value="1.1"/>

