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
    String mname= "";
    mname = (String)session.getAttribute("mname");

    // String mname = request.getParameter("mm");
    String mprice = request.getParameter("mprice");
    String mingredients = request.getParameter("mingredients");
    session.setAttribute("ID",id);
    session.setAttribute("pass",pass);
    %>
        <script>alert("<%=mname%>,<%=mprice%>,<%=mingredients%>")</script>
    <%
    try{
    String jdbcUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
    String dbId="root";
    String dbPass = "1234";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


    String update_sql = "update menu set mprice=?,mingredients=? where menu=?";
    pstmt = conn.prepareStatement(update_sql);
    pstmt.setString(1, mprice);
    pstmt.setString(2, mingredients);
    pstmt.setString(3, mname);
    pstmt.executeUpdate();

    %>
    <script>alert("정보수정완료.");location.href="index.jsp"</script>
    <%
    


    session.removeAttribute("mname");


    }catch(Exception e){
    out.print(e);
    }
%>

</body>
</html>