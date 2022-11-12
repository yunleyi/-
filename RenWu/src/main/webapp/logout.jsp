<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	session.invalidate();
    out.println("正在注销...");
    response.setHeader("Refresh", "2;URL=login.html");
%>