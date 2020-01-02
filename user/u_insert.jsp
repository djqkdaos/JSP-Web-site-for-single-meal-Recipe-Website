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
 
		    
		    int idx = 1;
		 
		    String name = request.getParameter("name");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String pass = request.getParameter("pass");
		 
		    int count = 0;
		    int indent = 0;
		    int step = 0;
		    int step2 =0;

		    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 			String today = formatter.format(new java.util.Date());
 			
		 
		    
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			Connection conn=null;
			String sql;
			int max = 0;
			try {
			 
			    		
			    		String jdbUrl="jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
						String dbID="root";
						String dbPass="1234";
						Class.forName("com.mysql.jdbc.Driver");
						conn=DriverManager.getConnection(jdbUrl,dbID,dbPass);

						Statement stmt = conn.createStatement();
						sql = "select max(idx) from board";
						rs = stmt.executeQuery(sql);

						if(rs.next()){
							max = rs.getInt("max(idx)");
						}    
						 sql = "INSERT INTO board(title,writer,regdate,count,content,pass,ref,indent,step,step2)VALUES (?,?,?,?,?,?,?,?,?,?)";
						 pstmt = conn.prepareStatement(sql);
						 
						 pstmt.setString(1,title);
						 pstmt.setString(2,name);
						 pstmt.setString(3,today);
						 pstmt.setInt(4,count);
						 pstmt.setString(5,content);
						 pstmt.setString(6,pass);
						 pstmt.setInt(7,max+1);
						 pstmt.setInt(8,indent);
						 pstmt.setInt(9,step);
						 pstmt.setInt(10,step2);

						 pstmt.execute();
						 pstmt.close();
						 stmt.close(); 


			 
			 
			     conn.close();
			 
				} catch (Exception e) {
				 
				     out.println("이터베이스 db 접속에 문제가 있습니다. <hr>");
				 
				     out.println(e.getMessage());
				 
				     e.printStackTrace();
				 
				}
		%>
		<script type="text/javascript">
			self.alert("게시글 등록이 완료되었습니다.");
			window.location = "list_board.jsp"
		</script>

	
</body>
</html>
