<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>
<%@ page import="java.util.*, java.text.*"  %>

<!DOCTYPE html>
<html>
<head>
	<title>test</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%
 
		    
		    String idx = request.getParameter("idx");
			String pass = request.getParameter("pass");
			
		 	String password = "";
		 	String dbpassword = null;
		 	String sql="";

		    int count = 0;

		    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 			String today = formatter.format(new java.util.Date());
		 
		    
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			Connection conn=null;
			try {
			 
			    		
			    		String jdbUrl="jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
						String dbID="root";
						String dbPass="1234";
						Class.forName("com.mysql.jdbc.Driver");
						conn=DriverManager.getConnection(jdbUrl,dbID,dbPass);
						Statement stmt = conn.createStatement();    
						sql = "select pass from board where idx = "+ idx ;
						rs = stmt.executeQuery(sql); 

						if(rs.next()){
							dbpassword = rs.getString("pass");
						}
						if(dbpassword.equals(pass)){
							sql = "DELETE FROM board WHERE idx = " + idx;	
							stmt.executeUpdate(sql);
	%>
				<script type="text/javascript">
					
					self.window.alert("해당글을 삭제 하였습니다.");
					location.href="list_board.jsp";
				</script>

	<%


			 	rs.close();
			 	stmt.close();
			 
			     conn.close();
			 }else{
		%>
		<script type="text/javascript">
			self.window.alert("비밀번호가 들렸습니다.");
			location.href="javascript:history.back()";
		</script>

		<%
			}
			 
				} catch (Exception e) {
				 
				     out.println("이터베이스 db 접속에 문제가 있습니다. <hr>");
				 
				     out.println(e.getMessage());
				 
				     e.printStackTrace();
				 
				}
		%>

	
</body>
</html>
