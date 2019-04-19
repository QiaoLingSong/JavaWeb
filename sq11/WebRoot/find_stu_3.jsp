<%@ page contentType="text/html" language="java" import="java.sql.*"
	pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>由提交页面获取查询条件并实现查询的页面</title>

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
	<center>

		<%
			String driverName = "com.mysql.cj.jdbc.Driver";//驱动程序名
			String userName = "root";//数据库用户名
			String userPwd = "829927";//密码
			String dbName = "students";//具体的数据库名	
			request.setCharacterEncoding("UTF-8");
			// 1. 加载驱动程序
			Class.forName(driverName);
			// 2. 链接数据库
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/students?useSSL=true&serverTimezone=UTC", userName, userPwd);
			String sex = request.getParameter("sex");
			Float weight1 = Float.parseFloat(request.getParameter("w1"));
			Float weight2 = Float.parseFloat(request.getParameter("w2"));
			String sql = "select *from stu_info where sex=? and weight>=? and weight<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sex);
			pstmt.setFloat(2, weight1);
			pstmt.setFloat(3, weight2);
			ResultSet rs = pstmt.executeQuery();
			rs.last();
		%>
		<font size="5" color="red"> <%=rs.getRow()%></font>人
		<table border="2" bgcolor="ccceee" width="650">
			<tr bgcolor="CCCCCC" align="center">
				<td>记录条数</td>
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>体重</td>
				<td>身高</td>
			</tr>
			<%
				rs.beforeFirst();
				while (rs.next()) {
			%>
			<tr align="center">
				<td><%=rs.getRow()%></td>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("sex")%></td>
				<td><%=rs.getString("age")%></td>
				<td><%=rs.getString("weight")%></td>
				<td><%=rs.getString("hight")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
	<%
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
	%>

</body>
</html>

