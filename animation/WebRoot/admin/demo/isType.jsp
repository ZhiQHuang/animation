<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	Integer user = (Integer) session.getAttribute("adminuser");
	if (user == 1) {
		response.sendRedirect("check.jsp");
	}
%>

