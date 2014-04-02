<%--@page language="java" import="com.sys.utils.GetPropertiesVal" contentType="text/html; charset=utf-8" pageEncoding="utf-8"--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%
	//String resourceUrl = new GetPropertiesVal().propertyVal("MyProjectInfo.properties","pro.resource.url");

	String scheme=request.getScheme()+"://";  //scheme:http://
	String header  =request.getHeader("host");  //header:localhost:8080
	String contextPath = request.getContextPath();  //contextPath:/dlg2012
	
	String requestURI=request.getRequestURI();  //requestURI:/dlg2012/crest/jsp/index.jsp
	String curUrl = scheme+header+contextPath;
	String title="广东联通终端B2B运营支撑平台";
	String imgalt="广东联通终端B2B运营支撑平台";
	String indexurl="http://www.wom186.com";
	//String resourceUrl="http://127.0.0.1:8080/test201303-resource/crest";
%>

<script>
	/*var resourceUrl="<s%s=resourceUrl===%s>";*/
	var curUrl="<%=curUrl%>";
	var title="<%=title%>";
	var imgalt="<%=imgalt%>";
	var indexurl="<%=indexurl%>";
</script>
