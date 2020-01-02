
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
    String mname1 = "";
    mname1 = (String)session.getAttribute("mname");
    String mprice = "";
    mprice = (String)session.getAttribute("mprice");
    String mingredients = "";
    mingredients = (String)session.getAttribute("mingredients");
    String mimage = "";
    mimage = (String)session.getAttribute("mimage");

    session.setAttribute("ID",id);
    session.setAttribute("pass",pass);

    String rname = request.getParameter("rname");
    String rtelNo = request.getParameter("rtelNo");
    String raddress = request.getParameter("raddress");
    String rmemo = request.getParameter("rmemo");
 
	try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
	String dbId="root";
	String dbPass = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

	String insert_sql1 = "insert into bill(bill, ID, name, tel, address,memo,menu, price ,ingredients, image) values(null,?,?,?,?,?,?,?,?,?);";
	pstmt = conn.prepareStatement(insert_sql1);
		pstmt.setString(1,id);
		pstmt.setString(2,rname);
		pstmt.setString(3,rtelNo);
		pstmt.setString(4,raddress);
		pstmt.setString(5,rmemo);
		pstmt.setString(6,mname1);
		pstmt.setString(7,mprice);
		pstmt.setString(8,mingredients);
		pstmt.setString(9,mimage);
		pstmt.executeUpdate();


		session.removeAttribute("mname1");
		session.removeAttribute("mprice");
		session.removeAttribute("mimage");
		session.removeAttribute("mingredients");
%>
	<script >alert("주문완료");location.href="index.jsp"</script>

<%

	}catch(Exception e){
	out.print(e);
	}
%>

</body>
</html>