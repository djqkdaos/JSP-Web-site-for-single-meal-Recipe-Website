<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*"%>

<html>
<head>
<title>정보입력 폼</title>

</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<%
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	    String id = "";
    id = (String)session.getAttribute("ID");
    String pass = "";
    pass = (String)session.getAttribute("pass");
    session.setAttribute("ID",id);
    session.setAttribute("pass",pass);

	String rprice = request.getParameter("rprice");
	String rtitle = request.getParameter("rtitle");
	String ringredients = request.getParameter("ringredients");
	String rimage = request.getParameter("rimage");
	String rmethod = request.getParameter("rmethod");
	try{
	 String jdbcUrl ="jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
	String dbId="root";
	String dbPass = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


	String insert_sql = "insert into recipe(recipe, price, title, ingredients, method, image) values(null,?,?,?,?,?);";
	pstmt = conn.prepareStatement(insert_sql);
 	pstmt.setString(1, rprice);
 	pstmt.setString(2, rtitle);
 	pstmt.setString(3, ringredients);
	pstmt.setString(4, rmethod);
 	pstmt.setString(5, rimage);
	pstmt.executeUpdate();
%>
	<script>alert("레시피 등록이 완료되었습니다.");
	location.href="index.jsp";</script>
<%
	}catch(Exception e){
	out.print(e);
	}
%>

</body>
</html>