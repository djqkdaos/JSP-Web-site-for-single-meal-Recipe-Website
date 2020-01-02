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
	
	String jid = request.getParameter("id");
	String jpass = request.getParameter("pass");
	String jnic = request.getParameter("nic");
	String jname = request.getParameter("name");
	String jtelNo = request.getParameter("telNo");
	String jeMail = request.getParameter("eMail");
	String jaddress = request.getParameter("address");

	try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
	String dbId="root";
	String dbPass = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


	String select_sql = "select*from user where ID=?;";
	String insert_sql = "insert into user(name, ID, password, nic, telNo, eMail, address) values(?,?,?,?,?,?,?);";
	pstmt = conn.prepareStatement(select_sql);
 	pstmt.setString(1, jid);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
%>
	<script>alert("아이디가 이미 존재합니다.");location.replace("register.jsp")</script>
	
<%
	}else{
		pstmt = conn.prepareStatement(insert_sql);
		pstmt.setString(1,jname);
		pstmt.setString(2,jid);
		pstmt.setString(3,jpass);
		pstmt.setString(4,jnic);
		pstmt.setString(5,jtelNo);
		pstmt.setString(6,jeMail);
		pstmt.setString(7,jaddress);
		pstmt.executeUpdate();
%>
	<script>alert("회원가입이 완료되었습니다.");
	location.replace("index.jsp");</script>
<%
} 

	}catch(Exception e){
	out.print(e);
	}
%>

</body>
</html>