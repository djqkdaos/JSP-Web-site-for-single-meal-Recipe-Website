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

    try{
    String jdbcUrl = "jdbc:mysql://localhost:3306/jsp";
    String dbId="root";
    String dbPass = "1234";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


    String select_sql = "select*from user where ID=?;";
    pstmt = conn.prepareStatement(select_sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    
    if(rs.next()){
        String login_name = rs.getString("name");
        String login_ID = rs.getString("ID");
        String login_pass = rs.getString("password");
        String login_nic = rs.getString("nic");
        String login_telNo = rs.getString("telNo");
        String login_eMail = rs.getString("eMail");
        String login_address = rs.getString("address");

        request.setAttribute("login_nic",login_nic);
        request.setAttribute("login_telNo",login_telNo);
        request.setAttribute("login_eMail",login_eMail);
        request.setAttribute("login_address",login_address);
        request.setAttribute("login_name",login_name);
        pageContext.forward("information.jsp");
    }else{
%>
    <script>alert("정보 출력 실패.");
    location.href="index.jsp";</script>
<%
    } 

    }catch(Exception e){
    out.print(e);
    }
%>

</body>
</html>