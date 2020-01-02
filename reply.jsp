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
 
		    
		    String pass="";
		    String dbpass=null;
		    String idx="";
		    String name="";
		    String title="";
		    String content="";
		    int count = 0;
			int ref = 0; 
			int indent = 0; 
			int step = 0;
			int step2 = 0; 
		    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 			String today = formatter.format(new java.util.Date());
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			Connection conn=null;
			try {
			 			idx = request.getParameter("idx");
			 			pass = request.getParameter("pass");
			 			name = request.getParameter("name");
			 			title = request.getParameter("title");
			 			content = request.getParameter("content");


			    		
			    		String jdbUrl="jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
						String dbID="root";
						String dbPass="1234";
						Class.forName("com.mysql.jdbc.Driver");
						conn=DriverManager.getConnection(jdbUrl,dbID,dbPass);
						Statement stmt = conn.createStatement();    
						String sql = "SELECT  ref, indent, step FROM board WHERE idx = " + idx;

						rs = stmt.executeQuery(sql);

						if(rs.next()){
							ref = rs.getInt("ref");
							indent = rs.getInt("indent");
							step = rs.getInt("step");
						}

						sql = "UPDATE board SET step=step+1 WHERE ref = "+ref+" and step >"+step;
						stmt.executeUpdate(sql);

						sql = "INSERT INTO board(title,writer,regdate,count,content,pass,ref,indent,step,step2) "+ "values(?,?,?,?,?,?,?,?,?,?)";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, title);
							pstmt.setString(2, name);
							pstmt.setString(3, today);
							pstmt.setInt(4, count);
							pstmt.setString(5, content);
							pstmt.setString(6, pass);
							pstmt.setInt(7, ref);
							pstmt.setInt(8, indent+1);
							pstmt.setInt(9, step+1);
							pstmt.setInt(10, step2);

		
							pstmt.execute();
							rs.close();
			 				stmt.close();
			   			 	conn.close();
			 
				} catch (Exception e) {
				 
				     out.println("이터베이스 db 접속에 문제가 있습니다. <hr>");
				 
				     out.println(e.getMessage());
				 
				     e.printStackTrace();
				 
				}
		%>
			<script language=javascript>
   				 self.window.alert("입력한 글을 저장하였습니다.");
   				 location.href="list_board.jsp";
  			</script>

	
</body>
</html>
