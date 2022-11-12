<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>

 <style>
 .an {
 -webkit-transition-duration: 0.4s;
 transition-duration: 0.4s;
 padding: 2px 5px;
 text-align: center;
 background-color: white;
 color: black;
 border: 2px solid #4CAF50;
 border-radius:5px;
 }
 .an:hover {
 background-color: #4CAF50;
 color: white;
 }
 </style>

<script>
	function del(id){
		if(confirm("确定要删除此任务吗？")){
			location.href="deletetask.jsp?taskid="+id;
		}
	}
</script>
</head>
<body>
<jsp:useBean id="db" class="mydb.ConnDB" />
<%
if(session.getAttribute("username")!=null){
%>
<p style="font-size:25px;color:red; margin-left:20px;">用户<%=session.getAttribute("username") %>您好，欢迎您登录系统</p>
<p align="right" style="margin-right:5%;"><a href="logout.jsp">退出</a></p>
<hr style="border: 2px solid purple;" />
<h1 align="center">当前任务列表</h1>
<p align="right" style="margin-right:5%;"><a href="addtask.html">添加新任务</a></p>

<%

int maxPage=0;//总页数
int pageSize=3;//每页显示数据数量
int currentPage=0;//当前页数
int recordCount=0;//记录总数
ResultSet rsCount=null;
ResultSet rs=null;

String query="select count(*) as count from task";//查记录总数，取别名
rsCount=db.doQuery(query);
rsCount.next();//第一条记录
recordCount=rsCount.getInt("count");//记录数

try{
	if(recordCount>0){
		System.out.println("count="+recordCount);
		
		if(recordCount%pageSize==0){
			maxPage=recordCount/pageSize;
		}else{
			maxPage=recordCount/pageSize+1;
		}
		
		String pageNo=(String)request.getParameter("page");
		
		if(pageNo==null||pageNo.equals("")){
			pageNo="0";
		}
		try{
			currentPage=Integer.parseInt(pageNo);
		}catch(Exception e){
			currentPage=0;
		}
		
		if(currentPage<1){
			currentPage=1;
		}else if(currentPage>maxPage){
			currentPage=maxPage;
		}
		
		query="select * from task";
		rs=db.doQuery(query);
		rs.absolute((currentPage-1)*pageSize+1);//记录指针移动到当前要显示页数的第一条记录
		out.println("<table border=1 align=center width='90%'>");
		out.println("<tr>");
		out.println("<th>任务编号</th>");
		out.println("<th>任务名称</th>");
		out.println("<th>任务发布者</th>");
		out.println("<th>任务发布时间</th>");
		out.println("<th>任务描述</th>");
		out.println("<th>任务操作</th>");
		out.println("</tr>");
		for(int i=1;i<=pageSize;i++){
			out.println("<tr align='center'>");
			int taskid=rs.getInt("taskid");
			out.println("<td>"+taskid+"</td>");
			String taskname=rs.getString("taskname");
			out.println("<td>"+taskname+"</td>");
			String taskowner=rs.getString("taskowner");
			out.println("<td>"+taskowner+"</td>");
			Date tasktime=rs.getDate("tasktime");
			out.println("<td>"+tasktime+"</td>");
			String taskintro=rs.getString("taskintro");
			out.println("<td>"+taskintro+"</td>");
			out.println("<td><a href=updatetask.jsp?taskid="+taskid+">修改</a>/<a href='javascript:del("+taskid+")'>删除</a></td>");
			out.println("</tr>");
			if(!rs.next()){
				break;
			}
		}
		out.println("</table>");
		%>
		<form name="myFrm">
			<p align="center">
				<span style="font-size:2;color:red;">
					跳转到:<input type="text" name="page" size="3">&nbsp;&nbsp;
					当前页数:[<%=currentPage %>/<%=maxPage %>]&nbsp;&nbsp;
					<%
						if(currentPage>1){
							out.println("<a href='index.jsp?page=1' class='an'>第一页</a>");
							out.println("<a href='index.jsp?page="+(currentPage-1)+"' class='an'>上一页</a>");
						}
						if(currentPage<maxPage){
							out.println("<a href='index.jsp?page="+(currentPage+1)+"' class='an'>下一页</a>");
							out.println("<a href='index.jsp?page="+maxPage+"' class='an'>最后一页</a>");
						}
					%>
				</span>
			</p>
		</form>
	<%}else{
		out.println("<h1 align='center'><span style='color:red;'>数据库记录为空!</span></h1>");
	}
}catch(Exception e){
	out.println("异常信息:"+e.getMessage());
	e.printStackTrace();
}finally{
	if(rs!=null)
		rs.close();
	if(rsCount!=null)
		rsCount.close();
	db.closeConn();
}

}else{
%>
<div style="position: absolute; top: 10%; left: 50%; transform: translate(-50%,-50%);">
<h1>请登录！</h1>
<a href="login.html">点击去登录</a>
</div>
<%} %>
</body>
</html>