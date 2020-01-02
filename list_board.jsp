<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>
        <%
            final int ROWSIZE = 10; // 한페이지에 보일 게시물 수 
            final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정 
            int pg = 1; //기본 페이지값 
            if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때 
            pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장 
            } 
            int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2) 
            int end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2) 
            int allPage = 0; // 전체 페이지수 
            int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 
            int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10) 
            %>
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

            PreparedStatement pstmt=null;
            ResultSet rs =null;
            Connection conn=null;
            int total = 0;
            String sql;
            try{
            String jdbUrl="jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
                        String dbID="root";
                        String dbPass="1234";
                        Class.forName("com.mysql.jdbc.Driver");
                        conn=DriverManager.getConnection(jdbUrl,dbID,dbPass);

                        Statement stmt = conn.createStatement();
                        Statement stmt1 = conn.createStatement();

                        String sqlCount = "select count(*) from board";
                        rs = stmt.executeQuery(sqlCount);

                        if(rs.next()){
                            total = rs.getInt("count(*)");
                        }
                        int sort=1;
                        String sqlSort = "select idx from board order by ref desc, step asc";
                        rs = stmt.executeQuery(sqlSort);
                        //----------------------
                        while(rs.next()){
                            int stepNum = rs.getInt("idx");
                            sql = "update board set step2= "+ sort +" where idx= "+ stepNum;

                           stmt1.executeUpdate(sql);
                           sort++;
                        }

                        allPage = (int)Math.ceil(total/(double)ROWSIZE);
                     
                        if(endPage > allPage){
                            endPage = allPage;
                        }
                        out.print("총 게시물:"+total+"개");
                        String sqlList = "select idx, writer, title, regdate, count, indent from board where step2 >= "+start+" and step2 <= "+end+" order by step2 asc";
                        rs = stmt.executeQuery(sqlList);
                


              
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
                          <li>
                                <a href="notice.jsp">공지사항</a>
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

        <div class="panel-heading" style="text-align: center;"><h2>자유게시판</h2></div>                         <!-- 헤드라인 글씨를 표현하는 태그입니다. -->
    <div class="container">
        <table class="table table-hover">                                       <!-- 표 형식의 데이터를 표현하는 태그입니다. -->
            <thead>
            <tr>                                  <!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
     
                <th class="col-md-1">번호</th>                     <!-- Table Header의 약자로 table태그 내에서 -->
     
                <th class="col-md-2">작성자</th>                     <!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
     
                <th class="col-md-6">제목</th>
     
                <th class="col-md-2">날짜</th>
     
                <th class="col-md-1">조회수</th>
     
            </tr>
            </thead>
            
                <%   
     
            while(rs.next()){
                String idx = rs.getString("idx");
                String name = rs.getString("writer");
                String title = rs.getString("title");
                String date = rs.getString("regdate");
                int count = rs.getInt("count");
                int indent = rs.getInt("indent");
                %>
                <tr>
     
                    <td><%=idx%></td>
     
                    <td><%=name%></td>

                    <td><%
                            for(int j=0; j<indent; j++){
                        %> <img src='image/공백.jpg'/><%
                            }
                            if(indent!=0){
                        %><img src='image/reply_icon.gif'/><%
                            }
                        %>
                        <a href="view_board.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title%></a></td>
     
                    <td><%=date%></td>
     
                    <td><%=count%></td>
     
                </tr>
            <%
     
            }
            rs.close();
            stmt.close();


     
            %>
                
            
        </table>
        <hr/>
        <a class="btn btn-default pull-right" href="write_board.jsp">글쓰기</a>

        <div class="text-center">
            <ul class="pagination">
                <%
                    if(pg>BLOCK) {
                %>

                <%
                }
                %>
                <%
                        for(int i=startPage; i<= endPage; i++){
                        if(i==pg){
                %>
                            <li><a href=""><%=i %></a></li>
                <%
                        }else{
                %>
                            <li><a href="list_board.jsp?pg=<%=i %>"><%=i %></a></li>
                <%
                        }
                    }
                %>
                
                <%
                    if(endPage<allPage){
                %>

                <%
                    }
                %>
            </ul>
        </div>
     </div>   

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

    <%      
 
        conn.close();
 
    }catch (Exception e) {
 
        out.println("야이 디비연동이 실패:Database Connection Something Problem. <hr>");
 
        out.println(e.getMessage());
        out.println(rs);
        e.printStackTrace();
 
    }
 
%>

</body>

</html>