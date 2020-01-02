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
    String update_nic = request.getParameter("nic");
    String update_telNo = request.getParameter("telNo");
    String update_address = request.getParameter("address");
    String update_eMail = request.getParameter("eMail");
    session.setAttribute("ID",id);
    session.setAttribute("pass",pass);
    try{
    String jdbcUrl = "jdbc:mysql://localhost:3306/jsp";
    String dbId="root";
    String dbPass = "1234";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


    String update_sql = "update user set nic=?,telNo=?,eMail=?,address=? where ID=?";
    pstmt = conn.prepareStatement(update_sql);
    pstmt.setString(1, update_nic);
    pstmt.setString(2, update_telNo);
    pstmt.setString(3, update_eMail);
    pstmt.setString(4, update_address);
    pstmt.setString(5, id);
    pstmt.executeUpdate();

    %>
    <script>alert("정보수정완료.");location.href="index.jsp"</script>
    <%
    



    }catch(Exception e){
    out.print(e);
    }
%>

</body>
</html>