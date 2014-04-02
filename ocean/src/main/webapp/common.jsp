<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String scheme = request.getScheme() + "://";  //scheme:http://
    String header = request.getHeader("host");  //header:localhost:8080
    String contextPath = request.getContextPath();  //contextPath:/dlg2012
    String path = scheme + header + contextPath;
    String requestURI = request.getRequestURI();  //requestURI:/dlg2012/crest/jsp/index.jsp
    String curUrl = scheme + header + contextPath;
    //String resourceUrl="http://127.0.0.1:8080/test201303-resource/crest";
%>

<script>
    var curUrl = "<%=curUrl%>";
    var title = "海纳百川";
    var imgalt = "ocean";
    var indexurl = "http://www.wom186.com";
</script>