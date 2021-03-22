<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/16
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <style>
        #my-img{
            width: 800px;
            height: 300px;
        }
    </style>
    <title>携 行—慈善捐鞋网站</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%--    <link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">--%>
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/fancybox.min.css">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">

    <script language="JavaScript" type="text/javascript">
        function checkName(){
            var inputNode = document.getElementById("username");
            var spanNode = document.getElementById("confirmname");
            var content = inputNode.value;
            //用户名的规则:英文与数字组成
            //var reg = /^[a-z][a-z0-9].{1,14}$/i;
            if(inputNode.value.length==0){
                spanNode.innerHTML = "不能为空哦！".fontcolor("red");
                return false;
            }
            // if(reg.test(content)){
            //     spanNode.innerHTML = "用户名合法".fontcolor("green");
            //     return true;
            // }
            else{
                spanNode.innerHTML = "用户名合法".fontcolor("green");
                return true;
            }
        }
        //密码格式检验
        function checkpassword(){
            var inputNode = document.getElementById("password");
            var spanNode = document.getElementById("confirmpassword");
            var content = inputNode.value;
            //密码名的规则：以字母和数字开头，不超过15位
            var reg = /^[a-z0-9].{1,14}$/i;
            if(inputNode.value.length==0){
                spanNode.innerHTML = "不能为空哦！".fontcolor("red");
                return false;
            }
            if(reg.test(content)){
                spanNode.innerHTML = "密码格式正确".fontcolor("green");
                return true;
            }
            else{
                spanNode.innerHTML = "格式错误：以字母和数字开头，2-14位".fontcolor("red");
                return false;
            }
        }

        function checkEmail(){
            var inputNode = document.getElementById("email");
            var spanNode = document.getElementById("confirmemail");
            var content = inputNode.value;
            //编写邮箱的正则
            var reg = /^[a-z0-9]\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/i;///^[a-z0-9]\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/i;
            if(inputNode.value.length==0){
                spanNode.innerHTML = "不能为空哦！".fontcolor("red");
                return false;
            }
            if(reg.test(content)){
                spanNode.innerHTML = "邮箱合法".fontcolor("green");
                return true;
            }
            else{
                spanNode.innerHTML = "邮箱格式错误".fontcolor("red");
                return false;
            }
        }

       //确认密码
        function passwordCheck(){
            var confirmSecret = document.getElementById("checkpwd");
            var secret = document.getElementById("password");
            //var text = inputNode.value;
            var spanNode = document.getElementById("confirmpwd");
            //var content = checkSecreat();
            if(secret.value==confirmSecret.value&&confirmSecret.value!=""){
                spanNode.innerHTML = "密码输入正确".fontcolor("green");
                return true;
            }
            else{
                spanNode.innerHTML = "密码输入错误".fontcolor("red");
                return false;
            }
        }
        function Ckeckphoto(){
            var strFile = document.getElementById("photo").value;
            if(strFile =="" || strFile == null){
                alert("请上传鞋子的现照!");
                return false;
            }else{
                //檔案擴展名稱
                var fileExt = document.getElementById("photo").value.substr(document.getElementById("photo").value.lastIndexOf(".")).toLowerCase();
                var allowExt = ".jpg|.gif|.png|";
                if(allowExt != 0 && allowExt.indexOf(fileExt + "|") == -1){
                    alert("请上传【.jpg|.gif|.png】类型的图片!");
                    return false;
                }

            }
            return true;
        }


        function checkAll(){
            var confirmSecret =passwordCheck();
            var userName = checkName();
            var userSecret =checkpassword();
            var userEmail = checkEmail();
            var checkphoto=Ckeckphoto();
            if(userName&&userEmail&&userSecret&&confirmSecret&&checkphoto){
                return true;
            }
            else {
                alert("提交失败，请重新填写！");
                return false;

            }
        }

        function change(resouce) {
            //获取图片文件的对象
            var imgFile=resouce.files[0];
            //获取图片本地内存路径
            var url=window.URL.createObjectURL(imgFile);
            document.getElementById("my-img").setAttribute("src",url);
            // JQuery $("#image").attr("src",url);
        }

    </script>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container"><a class="navbar-brand" href="index.jsp">携&nbsp; 行</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="index.jsp" class="nav-link">首 页</a></li>
                <li class="nav-item"><a href="donation.jsp" class="nav-link">捐 赠</a></li>
                <li class="nav-item"><a href="shopping.jsp" class="nav-link">购 物</a></li>
                <li class="nav-item">
                    <c:if test="${username==null}"><a href="login.jsp" class="nav-link">登录/注册</a></c:if>
                    <c:if test="${username!=null}"><a href="listServlet" class="nav-link">${username}</a></c:if>
                </li>
                <li class="nav-item"><a href="loginServlet?param=logout" class="nav-link">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

<div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
        <div class="block-30 block-30-sm item" style="background-image: url(images/bg1.jpg);" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-7">
                        <h2 style="color:white;font:38px bolder;font-family:'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, 'sans-serif'">我可能不了解你，<br/>但我的鞋子可以陪你走上一段<br/></h2>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- .site-section -->
<!-- .section -->
<!-- .section -->
<!-- .featured-donate -->
<!-- .section -->

<div class="featured-section overlay-color-2" style="background-image: url(images/ydx1.jpg);">

    <div class="container">
        <div class="row">

            <div class="col-md-6 mb-5 mb-md-0">
                <img src="images/ydx1.jpg" alt="Image placeholder" class="img-fluid" id="my-img" name="my-img" onchange="change(this)">
            </div>

            <div class="col-md-6 pl-md-5">

                <div class="form-volunteer">

                    <h2>即刻加入我们吧！</h2>

                    <form action="loginServlet?param=adduser" method="post" enctype="multipart/form-data" onsubmit="return checkAll()">

                        <div class="form-group">
                            <input type="text" class="form-control py-2" name="email" id="email" onblur="checkEmail()" placeholder="邮箱">
                            <span id="confirmemail" style="font:15px bold;"></span>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control py-2" name="username" id="username" onblur="checkName()" placeholder="注册用户名">
                            <span id="confirmname" style="font:15px bold;"></span>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control py-2" name="password" id="password" onblur="checkpassword()" placeholder="密码">
                            <span id="confirmpassword" style="font:15px bold;"></span>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control py-2" name="checkpwd" id="checkpwd" onblur="passwordCheck()" placeholder="确认密码">
                            <span id="confirmpwd" style="font:15px bold;"></span>
                        </div>

                        <div class="form-group">
                           <span style="color: white;font:18px bolder;">上传用户头像   </span>
                            <input type="file" style="color:white;" name="photo" id="photo" onchange="change(this)"/>
                        </div>
                        <div class="form-group">

                            <input type="radio" name="usertype" value="donor" checked>
                            <span style="color: white;font:18px bolder;" >捐赠者</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="usertype" value="donee">
                            <span style="color: white;font:18px bold;">受捐者</span>

                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-white px-5 py-2" value="注 册">
                        </div>
                        <div>&nbsp;</div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div> <!-- .featured-donate -->

<footer class="footer">
    <div class="col-md-12 text-center">
        <p>上海大学“携行”团队 | 联系我们 xiexing2021@163.com</p>
    </div>
</footer>

<!-- loader -->
<div id="ftco-loader" class="fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"></circle><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"></circle></svg></div>


<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>

<script src="js/jquery.fancybox.min.js"></script>

<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>


</body></html>
