<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	Integer user = (Integer) session.getAttribute("adminuser");
	if (user == null) {
		response.sendRedirect("adminLogin.jsp");
	}
%>

