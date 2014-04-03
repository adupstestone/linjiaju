<%@page language="java" import="com.jn.b2c.sys.utils.Constants" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%
    String resourceUrl = Constants.resourceUrl;
    String indexUrl = Constants.indexPage;
    String scheme = request.getScheme() + "://";  //scheme:http://
    String header = request.getHeader("host");  //header:localhost:8080
    String contextPath = request.getContextPath();  //contextPath:/hkmall
    String path = scheme + header + contextPath;
    String requestURI = request.getRequestURI();  //requestURI:/dlg2012/crest/jsp/index.jsp
    String curUrl = scheme + header + contextPath;
%>

<script>
    var resourceUrl = "<%=resourceUrl%>";
    var curUrl = "<%=curUrl%>";
    var indexurl = "<%=indexUrl%>";
</script>
<link rel="shortcut icon" type="image/x-icon" href="<%=resourceUrl%>/resources/img/favicon.ico"/>