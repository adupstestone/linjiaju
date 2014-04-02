<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<%
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=title %></title>
<meta name="keywords" content="广东联通 社采直供  小额直供 数码手机 3G手机  智能手机 手机分销 手机采购 手机批发" />
<meta name="description" content="广东联通 社采直供  小额直供 数码手机 3G手机  智能手机 手机分销 手机采购 手机批发" />
<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/index.css" type="text/css" />

	<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=curUrl%>/lc/display/resources/js/index/scripts/swfobject/swfobject.js"></script>
        
    <script type="text/javascript">
      var flashvars = {};
      flashvars.cssSource = "<%=curUrl%>/lc/display/resources/js/index/piecemaker.css";
      flashvars.xmlSource = "index-cfg.jsp";
		
      var params = {};
      params.play = "true";
      params.menu = "false";
      params.scale = "showall";
      params.wmode = "transparent";
      params.allowfullscreen = "true";
      params.allowscriptaccess = "always";
      params.allownetworking = "all";
	  
      swfobject.embedSWF('<%=curUrl%>/lc/display/resources/js/index/piecemaker.swf', 'piecemaker', '1000', '450', '10', null, flashvars,    
      params, null);
    
    </script>
  </head>
  
<body>
  <center>
    <div id="piecemaker">
      <p>Put your alternative Non Flash content here.</p>
    </div>
    </center>
  </body>
</html>
</html>