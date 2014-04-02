<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    //String path=request.getServerName()+":"+request.getServerPort()+":"+request.getContextPath();
    String scheme = request.getScheme() + "://";  //scheme:http://
    String header = request.getHeader("host");  //header:localhost:8080
    String contextPath = request.getContextPath();  //contextPath:/dlg2012
    String requestURI = request.getRequestURI();  //requestURI:/dlg2012/crest/jsp/index.jsp
    String path = scheme + header + contextPath;
%>

<html>
<head>
    <title>珠海科莱思特</title>
    <meta name="keywords" content="除湿机,比重秤,仪器,试剂,标准版,天平,移液器,机器设备,科研仪器,实验耗材,试剂,珠海,科莱思特,珠海科莱思特"/>
    <meta name="description" content="珠海科莱思特，代理各种机器设备、科研仪器、实验耗材、试剂，坚持以共赢为理念，以质量为本，以效率、价值为体现，致力于为用户提供全面的配套解决方案。"/>
</head>

<body>
<jsp:forward page="crest/jsp/index.jsp"/>
</body>
</html>
