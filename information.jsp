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
     var check_pass = "<%=(String)session.getAttribute("pass")%>"
    function chk(){
         if (infosearch.name.value == ""){
        alert("이름을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
         if (infosearch.id.value == ""){
        alert("아이디를입력해주세요.");
        //비어있을 때 실행
        return false;
         }
        if(infosearch.pass.value==""){
            alert("비밀번호를 입력해주세요.");
            return false;
         }
         if (check_pass!=infosearch.pass.value){  
            alert("비밀번호가 다릅니다.");
        //비어있을 때 실행
        return false;
         }
        if (infosearch.nic.value == ""){
        alert("닉네임을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (infosearch.telNo.value == ""){
        alert("연락처를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }  
          if (infosearch.eMail.value == ""){
        alert("eMail을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (infosearch.address.value == ""){
        alert("주소를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
        //비어있지 않아야 실행
        infosearch.submit();
    }
   </script>

</head>
<body>
<%
    String id = "";
    id = (String)session.getAttribute("ID");
    String pass = "";
    pass = (String)session.getAttribute("pass");

    session.setAttribute("ID", id);
    session.setAttribute("pass",pass);

    String login_nic = (String)request.getAttribute("login_nic");
    String login_telNo = (String)request.getAttribute("login_telNo");
    String login_eMail = (String)request.getAttribute("login_eMail");
    String login_address = (String)request.getAttribute("login_address");
    String login_name = (String)request.getAttribute("login_name");

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

    
  <div class="modal-dialog" >
  <div class="modal-content">
      <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="index.jsp">×</a></button>
          <h1 class="text-center">회원 정보</h1>
      </div>
      <div class="modal-body">
         <div class="row">
            
           
       
            <form name="infosearch" method="post" action="infoupdate.jsp"> 
        </div>
            <div class="form-group">
            &nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" disabled  name="name" value="<%= login_name %>">
            </div>
            <div class="form-group">
            &nbsp;아&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;<input type="text" disabled  name="ID" value="<%= id %>">
            </div>
            <div class="form-group">
              비밀&nbsp;번호 &nbsp;확인&nbsp;&nbsp;:&nbsp;&nbsp; <input type="password" name="pass">
            </div>
            <div class="form-group">
            &nbsp;닉&nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;<input type="text" name="nic" value="<%= login_nic %>">
            </div>
            <div class="form-group">
               &nbsp;연&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; <input type="text" name="telNo" size="30px"  placeholder="  -제외하고 입력하시오." value="<%= login_telNo %>">
            </div>
            <div class="form-group">
            &nbsp;이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; <input type="text" name="eMail" size="20px" value="<%= login_eMail %>">
            </div>
            <div class="form-group">
              &nbsp;&nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;<input type="text" name="address"  size=40px value="<%= login_address %>">
            </div>
      </div>
      <div class="modal-footer">
          <div class="row">
              <input type="button" class="btn btn-primary btn-rg" value="수정" onclick="chk()">
   </form>  
          <button class="btn btn-primary btn-rg" onclick="location.href= 'index.jsp'">취소</button>
          </div>    
      </div>
  </div>
  </div>
</div>
            </div>
         <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy;기저귀차고와 2017</p>
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
