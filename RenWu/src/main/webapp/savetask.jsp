<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<jsp:useBean id="db" class="mydb.ConnDB" />
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8"); 


String id=request.getParameter("taskid");
String name=request.getParameter("taskname");
String owner=request.getParameter("taskowner");
String intro=request.getParameter("taskintro");

String query="update task set taskname='"+name+"', taskowner='"+owner+"', taskintro='"+intro+"' where taskid="+id;
System.out.println(query);	//debug
int num=db.doUpdate(query);
System.out.println(num);	//debug
if(num>0){
	
	out.println("修改成功");
	response.setHeader("refresh", "1;url=index.jsp");
}else{
	out.println("修改失败");
	out.println("<a href='index.jsp'>返回</a>");
}
%>
</body>
</html>