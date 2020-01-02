<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

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
   <script language="javascript">
    function chk(){
         if (bill.rname.value == ""){
        alert("수령인을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
         if (bill.rtelNo.value == ""){
        alert("전화번호를입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (bill.raddress.value == ""){  
        alert("수령지를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (bill.rmemo.value==""){
        alert("메모를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
        //비어있지 않아야 실행
            bill.submit();
    }
   </script>
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

        session.setAttribute("ID", id);
        session.setAttribute("pass",pass);

        String mname = request.getParameter("tname");
        String mprice = (String)request.getParameter("mprice");
        String mimage = (String)request.getParameter("mimage");
        String mingredients =  request.getParameter("mingredients");
        
        session.setAttribute("mimage",mimage);
        session.setAttribute("mname",mname);
        session.setAttribute("mprice",mprice);
        session.setAttribute("mingredients",mingredients);

            try{
                   String jdbcUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
                    String dbId="root";
                    String dbPass = "1234";
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


                    String select = "select * from user where ID = ?";
                    String mselect = "select * from menu where menu = ?";
                    pstmt = conn.prepareStatement(select);
                    pstmt.setString(1, id);
                    rs = pstmt.executeQuery();
                    if(rs.next()){
                         String telNo = rs.getString("telNo");
                         request.setAttribute("telNo",telNo);
                    }       
                    String telNo = (String)request.getAttribute("telNo");
                    
                    pstmt = conn.prepareStatement(mselect);
                    pstmt.setString(1, mname);
                    rs = pstmt.executeQuery();
                    if(rs.next()){
                         String menunum = rs.getString("menunum");
                         request.setAttribute("menunum",menunum);
                         //String mimage = rs.getString("mimage");
                         //request.setAttribute("mimage",mimage);
                    }
                            String menunum = (String)request.getAttribute("menunum");
                            request.setAttribute("menunum",menunum);
                            //String mimage = (String)request.getAttribute("mimage");
                            //request.setAttribute("mimage",mimage);

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

    
  <div class="modal-dialog" >
  <div class="modal-content">
      <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="index.jsp">×</a></button>
         <h2 class="text-center"><strong>주문 신청</strong></h2>
      </div>

      <div class="modal-body">
        <h3 class = "text-center"><strong>물품 정보</strong></h3>
        
         <div class="row">
            <div class="col-md-3">
                <!--a href="portfolio-item.html"-->
                     <img class="img-responsive" src="<%=mimage%>" style="width: 150px; height: 150px; align-items: center">
                     
            </div>

            <div class="form-group">
                &nbsp;물품&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="font-size: 20px; border:none;background-color:transparent" disabled value= "<%=mname%>" size="15px">
                <br>
                &nbsp;가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="font-size: 20px; border:none;background-color:transparent" disabled value= "<%=mprice%>">

                <br>
                &nbsp;물품&nbsp;&nbsp;번호&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="font-size: 20px; border:none;background-color:transparent" disabled value="<%=menunum%>" size="15px">
            </div>
        </div>
         <h3 class = "text-center"><strong>회원 정보</strong></h3>
            <div class="form-group">
                &nbsp;성&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" disabled value= "<%=id%>" size="30px">
            </div>
            <div class="form-group">
                연&nbsp;&nbsp;락&nbsp;&nbsp;처 &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  size="30px" disabled value = "<%=telNo%>">
            </div>
                <h3 class = "text-center"><strong>배송지 정보</strong></h3>
                <br>

                        <form name="bill" method="post" action="orderinsert.jsp">
            <div class="form-group">
                 수&nbsp;&nbsp;령&nbsp;&nbsp;인 &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  size="30px" name="rname">
            </div>
            <div class="form-group">
                 연&nbsp;&nbsp;락&nbsp;&nbsp;처 &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  size="30px" placeholder="  -제외하고 입력하시오." name="rtelNo">
            </div>
            <div class="form-group">
                  &nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;<input type="text"  size=60px name="raddress">
            </div>
            <div class="form-group">
                  배송시 메모 :&nbsp;&nbsp; <input type="text" placeholder=" 부재시 경비실에 맡겨주세요." size="60px" name="rmemo">
            </div>
      </div>
      <div class="modal-footer">
          <div class="row">
                <input type="button" class="btn btn-primary btn-rg" value="주문" onclick="chk()">
          </form>
          <button class="btn btn-primary btn-rg">주문취소</button>
          </div>    
      </div>
  </div>
  </div>
</div>
            </div>
        </footer>
    </div>
    <!-- /.container -->
    <!-- jQuery -->
     <%           
    }catch(Exception e){
    out.print(e);
    }
%>
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</body>

</html>
