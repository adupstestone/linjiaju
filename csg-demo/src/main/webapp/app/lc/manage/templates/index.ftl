<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <title>demo.ftl</title>
  </head>
  <body>
  	<table>
		<#list list as list1>  
			<tr>  
				<td>${list1.moduleName}</td>  
				<td>${list1.moduleDesc}</td>  
			</tr>     
		</#list>
	</table>
  </body>
</html>