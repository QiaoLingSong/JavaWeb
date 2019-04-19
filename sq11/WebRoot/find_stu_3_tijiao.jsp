<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询条件提交页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
		请选择查询条件<hr width = "100%"  size = "3">
		<form action = "find_stu_3.jsp"  method = "post">
				性别： 男<input type = "radio"  value = "男"  name = "sex"  checked = "checked">
				 女         <input type = "radio"  value = "女"  name = "sex"> <br> <br>
				 体重范围  <p> &nbsp; &nbsp; &nbsp; &nbsp;
				 最小<input type = "text" name = "w1" value="60"> <br> <br>
				&nbsp; &nbsp; &nbsp; &nbsp;  
				最大<input type = "text" name = "w2" value="90"> <br> <br>
				<input type = "submit" value = "提交" >
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				<input type = "reset" value= "取消" >      
    </form>
  </body>
</html>
