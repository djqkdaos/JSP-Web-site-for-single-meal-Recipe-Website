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
   location.href="login.jsp";
}
    function chk(){
         if (regis.name.value == ""){
        alert("이름을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
         if (regis.id.value == ""){
        alert("아이디를입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (regis.pass.value == ""){  
        alert("비밀번호를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }

          if (regis.pass.value != ""){
       if (regis.passchk.value == ""){
        alert("비밀번호확인을 해주세요.");
        //비어있을 때 실행
        return false;
         }
         }
          if (regis.pass.value != regis.passchk.value){
        alert("비밀번호가 다릅니다.");
        //비어있을 때 실행
        return false;
         }
          if (regis.nic.value == ""){
        alert("닉네임을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (regis.telNo.value == ""){
        alert("연락처를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
        
          if (regis.eMail.value == ""){
        alert("eMail을 입력해주세요.");
        //비어있을 때 실행
        return false;
         }
          if (regis.address.value == ""){
        alert("주소를 입력해주세요.");
        //비어있을 때 실행
        return false;
         }

        //비어있지 않아야 실행
        regis.submit();
    }
   </script>
</head>

<body>



    <!-- Page Content -->
    
    <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true" style="overflow: auto">
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
                                <a href="portfolio-1-col.jsp">일반게시판</a>
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
                                <a href="blog-home-2.jsp">10000원대</a>
                            </li>
                            <li>
                                <a href="blog-post.jsp">15000원대</a>
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
                  
                  <li>
                        <a href="login.jsp"><font color="white">Login</font></a>
                    </li>
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
          <h1 class="text-center">회원 가입</h1>
      </div>
      <div class="modal-body">
         <div class="row">


            <form name="regis" method="post" action="registerinsert.jsp"> 
           
        </div>
         <h4 class = "text-center">회원 정보</h4>
            <div class="form-group">
            &nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;<input type="text" name="name">
            </div>
            <div class="form-group">
            &nbsp;아&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;<input type="text" name="id">
            </div>
            <div class="form-group">
              비&nbsp;밀&nbsp;&nbsp;&nbsp;번&nbsp;호&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp; <input type="password" name="pass">
            </div>
            <div class="form-group">
              비밀&nbsp;번호 &nbsp;확인&nbsp;&nbsp;:&nbsp;&nbsp; <input type="password" name="passchk">
            </div>
            <div class="form-group">
            &nbsp;닉&nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;<input type="text" name="nic">
            </div>

            <div class="form-group">
               &nbsp;연&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; <input type="text" name="telNo" size="30px"  placeholder="  -제외하고 입력하시오.">
            </div>
            <div class="form-group">
            &nbsp;이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; <input type="text" name="eMail" size="20px">
            </div>
            <div class="form-group">
              &nbsp;&nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;<input type="text" name="address"  size=40px>
            </div>
    
      </div>
      <div class="modal-footer">
          <div class="row">
              <input type="button" class="btn btn-primary btn-rg" value="회원가입" onclick="chk()">
   </form>  
          <input type="button" class="btn btn-primary btn-rg" value="취소" onclick="cancel()">
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
