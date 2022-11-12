<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
<script>
	function check(){
		var name=document.form1.taskname;
		var owner=document.form1.taskowner;
		var intro=document.form1.taskintro;
		if(name.value==""){
			alert("请输入任务名称");
			name.focus();
			return false;
		}
		if(owner.value==""){
			alert("请输入任务发布者");
			owner.focus();
			return false;
		}
		if(intro.value==""){
			alert("请输入任务简介");
			intro.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<jsp:useBean id="db" class="mydb.ConnDB" />

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String id=request.getParameter("taskid");
String taskName=null;
String taskOwner=null;
String taskIntro=null;
String selecrstr="select * from task where taskid="+id;
ResultSet rs=db.doQuery(selecrstr);
if(rs.next()){
	taskName=rs.getString("taskname");
	taskOwner=rs.getString("taskowner");
	taskIntro=rs.getString("taskintro");
	rs.close();
}
%>
<h1>任务信息修改</h1>
<form action="savetask.jsp" method="post" name="form1" id="form1" onsubmit="return check()">
	任务编号:<input type="text" value="<%=id %>" name="taskid" id="taskid" disabled>
	<input type="hidden" name="taskid" value="<%=id %>"><br>
	任务名称:<input type="text" name="taskname" value="<%=taskName %>"><br>
	任务发布者:<input type="text" name="taskowner" value="<%=taskOwner %>"><br>
	任务简介:<textarea rows="6" cols="25" name="taskintro"><%=taskIntro %></textarea>
	<input type="submit" value="确定">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="清除">
</form>
</body>
</html>