<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.time.*,java.time.format.*,java.util.Date,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>处理添加</title>
</head>
<body>
<jsp:useBean id="task" class="my.webBean.Task" />
<jsp:useBean id="db" class="mydb.ConnDB" />
<jsp:setProperty property="*" name="task"/>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String name=(String)session.getAttribute("username");
try{
if(name==null||name.equals("")){
	out.println("<script>alert('请先登录')</script>");
	out.println("<h2><span style='color:red'>1秒后返回登录页面，如果没有返回，请点击<a href='login.html'>这里</a></span></h2>");
	response.setHeader("refresh", "1;url=login.html");
}
else{
	String gname=task.getTaskname();
	String tName = new String(gname.getBytes("ISO-8859-1"),"UTF-8");	//解决html传数据乱码问题
	String gowner=task.getTaskowner();
	String tOwner = new String(gowner.getBytes("ISO-8859-1"),"UTF-8");
	String gintro=task.getTaskintro();
	String tIntro = new String(gintro.getBytes("ISO-8859-1"),"UTF-8");

	Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	//时间显示类型
	String tasktime = df.format(d);
	System.out.println(tasktime);	//debug
	
	String insertsql="insert into task(taskname,taskowner,tasktime,taskintro) values('"+tName+"','"+tOwner+"','"+tasktime+"','"+tIntro+"')";
	System.out.println("insert sql="+insertsql);	//debug
	int num=db.doUpdate(insertsql);
	if(num>0){
		out.println("<h2 align='center'>添加成功</h2>");
		response.setHeader("refresh", "2;url=index.jsp");
	}else{
		out.println("<h2 align='center'>添加失败</h2>");
		out.println("<h2 align='center'><a href='addtask.html'>返回</a></h2>");
	}
}
}catch(Exception e){
	out.println("异常信息:"+e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>