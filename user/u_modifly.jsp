<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>
<%@page import="java.util.regex.Pattern"%>


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
						/*String sql = "INSERT INTO board (title,writer,regdate,count,content)";
						sql = sql + "values(?,?,?,?,?);";
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setString(1,title);
						
						pstmt.setString(2,writer);
						
						pstmt.setString(3,regdate);

						pstmt.setString(4,count);

						pstmt.setString(5,content);
				
						pstmt.executeUpdate();
						out.println("레코드가 추가 되었습니다.");*/
						Statement stmt = conn.createStatement();    
						String sql = "select pass from board where idx = " + idx ;
						rs = stmt.executeQuery(sql);
						if(rs.next()){
							dbpass = rs.getString("pass");
						}
						if(dbpass.equals(pass)){
							sql = "UPDATE board set title = '"+title+"', content='"+content+"' where idx="+idx;
							stmt.executeUpdate(sql);
		%>
						<script language=javascript>
							self.window.alert("글이 수정되었습니다.");
							location.href="view_board.jsp?idx=<%=idx%>";
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
