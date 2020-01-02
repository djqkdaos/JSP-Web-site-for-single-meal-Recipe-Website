<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
     function cancel(){
       location.href="mmenulist.jsp";
    }
    function chk(){
         if (munuupdate.mprice.value == ""){
        alert("가격을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (munuupdate.mingredients.value == ""){  
        alert("재료를 작성해 주세요.");
        //비어있을 때 실행
        return false;
         }
        //비어있지 않아야 실행
        munuupdate.submit();
    }
    function dcheck(){
           if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                   location.href="menudelete.jsp";
            }else{   //취소
                return;
            }
        }
        
   </script>
</head>

<body>
<body>
<% request.setCharacterEncoding("utf-8");%>

<%
   
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
        
        session.setAttribute("mname",mname);
        session.setAttribute("mimage",mimage);
        session.setAttribute("mname",mname);
        session.setAttribute("mprice",mprice);
        session.setAttribute("mingredients",mingredients);
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
          <h1 class="text-center">상품 수정</h1>
      </div>
      <form method="post" name="munuupdate" action="menuupdatejsp.jsp">
      <div class="modal-body">
        <h3 class = "text-center">물품 정보</h3>
            <div class="form-group" align="center">
                    <img class="img-responsive" src="<%=mimage%>" style="width: 200px; height: 200px; align-items: center">
                    <input readonly="text" style = "text-align:center; border:none; color:white" value="<%=mimage%>">
            </div>
            <br><br>
            <div class="form-group">
            &nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30px" style="height:40px;" value="<%=mname%>" name="mm" disabled >
            </div>
            <br>
            <div class="form-group">
            &nbsp;가&nbsp;&nbsp;&nbsp;&nbsp;격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30px" style="height:40px;" value="<%=mprice%>" name="mprice">
            </div>
            <br>
            <div class="form-group">
            &nbsp;재&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="60px" style="height:40px;"  value="<%=mingredients%>" name="mingredients">
            </div>
            <br>
               
                
            <br><br>
                  </div>
      <div class="modal-footer">
          <div class="row">
           
          <div class="form-group" style=" margin:auto; margin-right: 40px">
          <input type="button" class="btn btn-primary btn-lg" value="수정" onclick="chk()">
                </form>
            <input type="button" class="btn btn-primary btn-lg" value="삭제" onclick="dcheck()">
            <input type="button" class="btn btn-primary btn-lg" value="취소" onclick="cancel()">
            </div>
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
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
