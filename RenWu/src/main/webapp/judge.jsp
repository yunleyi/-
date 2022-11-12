<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>处理登录数据</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="my.webBean.User" />
<jsp:useBean id="db" class="mydb.ConnDB" />
<jsp:setProperty property="*" name="user"/>
<%
	String name=user.getUsername();
	String pwd=user.getPwd();
	String sql="select * from users where name='"+name+"' and pwd='"+pwd+"'";
	ResultSet rs=db.doQuery(sql);
	if(rs.next()){
		session.setAttribute("username", name);
		response.sendRedirect("index.jsp");
	}else{
		out.print("用户名或密码错误!马上跳转登录页面");
		response.setHeader("refresh", "2;url=login.html");
	}
%>
</body>
</html>