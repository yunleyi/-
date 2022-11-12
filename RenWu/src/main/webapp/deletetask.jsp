<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除</title>
</head>
<body>
<jsp:useBean id="db" class="mydb.ConnDB" />
<%
String id=request.getParameter("taskid");
String delStr="delete from task where taskid="+id;
int num=db.doUpdate(delStr);
if(num>0){
	out.println("删除成功");
	response.setHeader("refresh", "1;url=index.jsp");
}else{
	out.println("删除失败");
	out.println("<a href='index.jsp'>返回</a>");
}
%>
</body>
</html>