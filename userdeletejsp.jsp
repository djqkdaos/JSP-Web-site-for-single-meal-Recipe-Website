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

    try{
    String jdbcUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
    String dbId="root";
    String dbPass = "1234";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


    String delete_sql = "delete from user where ID = ?";
    pstmt = conn.prepareStatement(delete_sql);
    pstmt.setString(1, id);
    pstmt.executeUpdate();

    %>
    <script>alert("<%=id%>님 정상적으로 탈퇴되셨습니다.");location.href="index.jsp"</script>
    <%
        session.invalidate();



    }catch(Exception e){
    out.print(e);
    }
%>

</body>
</html>