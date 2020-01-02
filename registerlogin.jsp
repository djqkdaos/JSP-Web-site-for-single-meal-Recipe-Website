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
	
	String jid = request.getParameter("ID");
	String jpass = request.getParameter("pass");


	try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/jsp";
	String dbId="root";
	String dbPass = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

	if(!jid.equals("jsp")){
		String select_sql = "select*from user where ID=?;";
		pstmt = conn.prepareStatement(select_sql);
	 	pstmt.setString(1, jid);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String login_ID = rs.getString("ID");
			String login_pass = rs.getString("password");
			if(jpass.equals(login_pass)){
			session.setAttribute("ID",jid);
			session.setAttribute("pass",jpass);
			pageContext.forward("index.jsp");

			}else{
	%>
			<script>alert("비밀번호가 틀렸습니다.");location.href="login.jsp";</script>
	<%
			}
		}else{
	%>
		<script>alert("등록 된 아이디가 없습니다.");
		location.href="login.jsp";</script>
	<%
		} 
	}else{
	String select_sql = "select*from admin where ID=?;";
		pstmt = conn.prepareStatement(select_sql);
	 	pstmt.setString(1, jid);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String admin_ID = rs.getString("ID");
			String admin_pass = rs.getString("pass");
			if(jpass.equals(admin_pass)){
			session.setAttribute("ID",jid);
			session.setAttribute("pass",jpass);
			pageContext.forward("index.jsp");
			}else{
	%>
			<script>alert("비밀번호가 틀렸습니다.");location.href="login.jsp";</script>
	<%
			}
		}
			}
	}catch(Exception e){
	out.print(e);
	}
%>

</body>
</html>