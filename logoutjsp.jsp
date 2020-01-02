<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<html>
<head>

</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<%
session.invalidate();
%>
<script>alert("로그아웃됐습니다.");location.replace("index.jsp");</script>


</body>
</html>