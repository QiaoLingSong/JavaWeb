<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<html>
<head>

</head>

<body>
	<%
		String driverName = "com.mysql.cj.jdbc.Driver";//驱动程序名
		String userName = "root";//数据库用户名
		String userPwd = "829927";//密码
		String dbName = "students";//具体的数据库名

		Connection conn = null;
		try {
			// 1. 加载驱动程序
			Class.forName(driverName);
			// 2. 链接数据库
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/students?useSSL=true&serverTimezone=UTC", userName, userPwd);

			// 3. 执行数据库语句等等
			String sql = "Insert into stu_info(id,name,sex,age,weight,hight) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			request.setCharacterEncoding("UTF-8");
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			int age = Integer.parseInt(request.getParameter("age"));
			float weight = Float.parseFloat(request.getParameter("weight"));
			float hight = Float.parseFloat(request.getParameter("hight"));
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, sex);
			pstmt.setInt(4, age);
			pstmt.setFloat(5, weight);
			pstmt.setFloat(6, hight);
			int n = pstmt.executeUpdate();
			if (n == 1) {
	%>数据插入操作成功！
	<br>
	<%
		} else {
	%>数据插入失败
	<br>
	<%
		}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>



















