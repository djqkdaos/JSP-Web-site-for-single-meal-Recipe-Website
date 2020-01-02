<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<html >

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>주문작성</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
        <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        function replyCheck()
          {
           var form = document.modiflyform;
           if( form.name.value==""||null )
           {
            alert( "이름을 적어주세요" );
            form.name.focus();
            return false;
           }
            if( form.pass.value==""||null )
           {
            alert( "비밀번호을 적어주세요" );
            form.pass.focus();
            return false;
           }
           
          if( form.title.value==""||null )
           {
            alert( "제목을 적어주세요" );
            form.title.focus();
            return false;
           }
         
          if( form.content.value==""||null )
           {
            alert( "내용을 적어주세요" );
            form.content.focus();
            return false;
           }  
           form.submit();
          } 

    </script>
    <%
        String idx =request.getParameter("idx");
        String name = "";
        String pass = "";
        String title = "";
        PreparedStatement pstmt=null;
            ResultSet rs =null;
            Connection conn=null;
            try{
            String jdbUrl="jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
                        String dbID="root";
                        String dbPass="1234";
                        Class.forName("com.mysql.jdbc.Driver");
                        conn=DriverManager.getConnection(jdbUrl,dbID,dbPass);
                        Statement stmt = conn.createStatement();    
                        String sql = "select title from board where idx = "+idx;
                        rs = stmt.executeQuery(sql);

                        if(rs.next()){
                            title=rs.getString("title");

                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    }catch(Exception e){

                }

    %>


</head>

<body>

 <%
    String id = "";
    id = (String)session.getAttribute("ID");
    String pass1 = "";
    pass1 = (String)session.getAttribute("pass");

    session.setAttribute("ID", id);
    session.setAttribute("pass",pass1);


%>
 <%if(id==null){%>
        <script>alert("로그인을 먼저 해주세요.");location.href="login.jsp";</script>
        <%}%>

    <!-- Navigation -->
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
    <!-- Page Content -->
        <!--write form-->
        <div class="panel panel-default"> 
        <!-- Default panel contents --> 
        <div class="panel-heading" style="text-align: center;"><h2>답변 등록</h2></div> 
        <div class="panel-body">
            <div class="container">
                <form action="reply.jsp?idx=<%=idx%>" method="post" name=modiflyform>
                    <form role="form">
                    <!-- 이름 입력 폼 -->
                        <div class="row"> 
                        <div class="form-inline">                       <!-- // container 안에서 grid system 사용 -->
                        <div class="form-group"> 
                            <table>
                                        <th>    
                                            <th><label for="name">이름:</label> </th>
                                            <th ><input type="text" class="form-control" name="name" value="<%=id%>" id="name" placeholder="Enter name" readonly></th> 
                                            <th class = "col-md-2"><label for="pass" >비밀번호:</label></th> 
                                            <th class = "col-md-1"><input type="password" class="form-control" name="pass" id="pass" placeholder="Enter name"></th>
                                        </th> 
                                    </table>
                        </div> 
                        </div>
                        

                        <!-- //글제목 입력 폼 -->
                        <div class="form-group"> 
                        <label for="subject">제목:</label> 
                        <input type="text" class="form-control" name ="title" id="title" placeholder="Enter title" value="<%=title%>"> 
                        </div> 

                        <!-- //글내용 입력 폼  -->
                        <div class="form-group"> 
                        <label for="content">내용:</label> 
                        <textarea class="form-control" rows="10" name="content" id="content"></textarea> 
                        <!-- //글 내용이 많으므로 <textarea>태그를 쓴다 rows는 textarea의 높이 조절  -->
                        </div>
                        <!-- //파일 첨부 폼 (나중에 쓸거 생각해서 만들어 봄 )  -->
                        <div class="form-group" > 
                        <label for="File" >File input</label> 
                        <input type="file" id="File"> 
                        </div> 

                        <!-- //버튼 저장하기, 다시쓰기, 되돌아가기 -->
                        <div class="center-block" style='width:200px'> 
                        <input type="button" class="btn btn-primary" value="저장하기" onclick="replyCheck();"> <input type="reset" class="btn btn-primary" value="취소"onclick="javascript:history.back(-1)"> 
                        <!-- //되돌아가기에서 onclick이벤트로 history.back(1) 왔던곳에서 1만큼 back (-1을 써도 된다)    -->

                    </div>  
                </form>
            </div>
        </div>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    </div>
    <!-- /.container -->

    <!-- jQuery -->


</body>

</html>
