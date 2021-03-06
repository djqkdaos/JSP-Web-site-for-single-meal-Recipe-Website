<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>
<html >

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시판</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
    <style type="text/css">
        #footer{width:100%;
    height:60px;
    position:absolute;
    bottom:0;
    left:0;
    }
    </style>
    <%request.setCharacterEncoding("utf-8");%>
<%
            String idx = request.getParameter("idx");

            String writer = "";
            int count = 0;
            String title = "";
            String content = "";
            String sql= "";

            PreparedStatement pstmt=null;
            ResultSet rs =null;
            Connection conn=null;
            try{
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
                        
                        sql = "SELECT * FROM `board` WHERE idx = "+ idx;
                        rs = stmt.executeQuery(sql);
                        if(rs.next()){
                            writer = rs.getString("writer");
                            
                            count = rs.getInt("count");
                            idx = rs.getString("idx");
                            title = rs.getString("title");
                            content = rs.getString("content");
                            count++;


                            sql = "UPDATE board SET count=" + count +" where idx = "+ idx;

                            stmt.executeUpdate(sql);
                            rs.close();
                            stmt.close();

        
                            conn.close();

                        }
 
        
 
                        }catch (Exception e) {
 
                            out.println("Database Connection Something Problem. <hr>");
                     
                            out.println(e.getMessage());

                     
                            e.printStackTrace();
                     
                        }            
        %>

<body>
<%
    String id = "";
    id = (String)session.getAttribute("ID");
    String pass = "";
    pass = (String)session.getAttribute("pass");

    session.setAttribute("ID", id);
    session.setAttribute("pass",pass);


%>

    <!-- Navigation -->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><font size="5" color="#FFFFFF">혼밥레시피</font></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                   <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">소개<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="is.jsp">혼밥is</a>
                            </li>
                             <li>
                                <a href="introduce.jsp">팀원 소개</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="list_board.jsp">일반게시판</a>
                            </li>
                          
                         
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">주문<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="menulist.jsp">주문</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">레시피 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="5000wonRecipe.jsp">5000원대</a>
                            </li>
                            <li>
                                <a href="10000won.jsp">10000원대</a>
                            </li>
                            <li>
                                <a href="15000won.jsp">15000원대</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">영상레시피 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="video.jsp">만드는 동영상</a>
                            </li>
                            <li>
                                <a href="eat.jsp">맛있게 먹는법</a>
                            </li>                      
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        고객센터<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        <li>
                                <a href="qa.jsp">Q&A</a>
                        </li>
                        <li>
                              고객상담
                        </li>
                        </ul>
                    </li>
                  
                    <%if(id==null){ %> 
                         <li> <a href="login.jsp"><font color="white">Login</font></a></li>>
                        <% }  else  { 
                                if(!id.equals("jsp")){
                        %>
                         <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mypage<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        <li>
                            <a href="orderlist.jsp">주문 목록</a>
                        </li>
                        <li>
                              <a href="informationsearch.jsp">회원정보 수정</a>
                        </li>
                        <li>
                              <a href="userdelete.jsp">회원탈퇴</a>
                        </li>
                        </ul>
                    </li>             
                    <%}else{%>
                     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Management<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        <li>
                            <a href="newmenu.jsp">주문상품 등록</a>
                        </li>
                        <li>
                              <a href="mmenulist.jsp">상품 수정</a>
                        </li>
                        <li>
                              <a href="recipeadd.jsp">레시피 추가</a>
                        </li>
                        </ul>
                    </li>
                    <% 
                }%>
                    <li><a href="logoutjsp.jsp"><font color="white">Logout</font></a> </li>
                    <% 
                    }%>

                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

       <!--View-->
            <div class="container">
            <div class="table-responsive">
                <table summary="전체 테이블 구성" class="table table-borderd">
            <tr>
                <td ><div align="center"><h3><b>글 읽기</b></h3></div></td>
            </tr>
            <tr>
                <td colspan=2>
                <table  summary="목록 테이블 구성" class="table table-striped"> 
            <tr> 
                
                
            </tr>
            <tr>
              
            </tr>
            <tr> 
                <td > 번호:</td>
                <td > <%=idx%></td>
                <td align=center> 제 목:</td>
                <td > <%=title%></td>
                <td align=center> 작성자:</td>
                <td ><%=writer%></td>
           </tr>
           <tr> 
                <td colspan=4><%=content%></td>
           </tr>
           <tr>
                <td colspan=6 align=right> 조회수 : <%=count%></td>
           </tr>
            </table>
            </td>
            </tr>
            <tr>
                <td align=center colspan=2> 
                <hr size=1>
                <div align="center">
                [ <input type="submit" class="btn btn-default" value="목록" onclick="window.location='list_board.jsp'"> | 
                <input type="button" class="btn btn-default" value="수정" onclick="window.location='modifly_board.jsp?idx=<%=idx%>'"> |
                <input type="button" class="btn btn-default" value="답변" onclick="window.location='reply_board.jsp?idx=<%=idx%>'"> |
                <input type="button" class="btn btn-default" value="삭제" onclick="window.location='delete_board.jsp?idx=<%=idx%>'">]<br>
                </div>
                </td>
            </tr>
            </table>
            </div>
            </div>
       <!---->

        <!-- Footer -->
        <footer id="footer">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; </p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->


</body>

</html>
