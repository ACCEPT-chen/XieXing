<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/2/7
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <style>
        #my-img{
            width: 800px;
            height: 300px;
        }
    </style>
    <title>GiveHope &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <script>
        function checkName(){
            var inputNode = document.getElementById("name");
            var spanNode = document.getElementById("confirmname");
            var content = inputNode.value;
            var reg = /^[a-z][a-z0-9].{1,14}$/i;
            if(inputNode.value.length==0){
                spanNode.innerHTML = "不能为空哦！".fontcolor("red");
                return false;
            }
            else{
                spanNode.innerHTML = "名字合法！".fontcolor("green");
                return true;
            }
        }
        function checkSize(){
            var inputNode = document.getElementById("size");
            var spanNode = document.getElementById("confirmsize");
            var content = inputNode.value;

            var reg = /^(?:[1-9]?\d|100)$/;
            if(inputNode.value.length==0){
                spanNode.innerHTML = "不能为空哦！".fontcolor("red");
                return false;
            }
            else if(reg.test(content)){
                spanNode.innerHTML = "尺寸合法".fontcolor("green");
                return true;
            }
            else{
                spanNode.innerHTML = "尺寸大小不合法".fontcolor("red");
                return false;
            }
        }
        function checkAll(){
           var checkname=checkName();
           var checksize=checkSize();
           var checkphoto=Ckeckphoto();
            if(checksize&&checkname&&checkphoto){
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
    </script>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container"><a class="navbar-brand" href="index.jsp">携&nbsp; 行</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="index.jsp" class="nav-link">首 页</a></li>
                <li class="nav-item active"><a href="donation.jsp" class="nav-link">捐 赠</a></li>
                <li class="nav-item"><a href="shopping.jsp" class="nav-link">购 物</a></li>
                <li class="nav-item"><a href="listServlet" class="nav-link">沟 通</a></li>
                <li class="nav-item"><a href="login.jsp" class="nav-link"><c:if test="${username==null}">登录/注册</c:if><c:if test="${username!=null}">${username}</c:if></a></li>
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
                <img src="images/ydx1.jpg" alt="Image placeholder" class="img-fluid" id="my-img" name="my-img" >
            </div>

            <div class="col-md-6 pl-md-5">

                <div class="form-volunteer">

                    <h2 style="font-size: 25px;font-weight: bolder;line-height: 80px; width: 300px;margin: 0 auto;">捐赠您的爱鞋吧！</h2>
                    <form action="donationServlet?param=donation" method="post" enctype="multipart/form-data" onsubmit="return checkAll()">

                        <div class="form-group">
                            <input type="text" class="form-control py-2" name="name" id="name" placeholder="您爱鞋的名字" onblur="checkName()">
                            <span id="confirmname"></span>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control py-2" name="size" id="size" placeholder="尺码" onblur="checkSize()" >
                            <span id="confirmsize"></span>
                        </div>

                        <div class="form-group">
                            <label class="section-heading">男女款式：</label>
                            <input type="radio" name="sex" value="男" checked>
                            <span style="color: white;font:18px bolder;" >男</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sex" value="女">
                            <span style="color: white;font:18px bold;">女</span>

                        </div>
                        <label class="section-heading">您爱鞋的类型：</label>
                        <select  name="type">
                            <option value="运动鞋">运动鞋</option>
                            <option value="凉鞋">凉鞋</option>
                            <option value="帆布鞋">帆布鞋</option>
                            <option value="休闲鞋">休闲鞋</option>
                            <option value="拖鞋">拖鞋</option>
                            <option value="靴子">靴子</option>
                            <option value="皮鞋">皮鞋</option>
                            <option value="雨鞋">雨鞋</option>
                        </select>
                        <div class="form-group">
                            <label class="section-heading">鞋子的现照：
                            <input type="file" class="custom-select-sm" name="photo"  id="photo" onchange="change(this)"/>
                            </label>
                        </div>

                        <div class="form-group">
                            <input type="submit" class="btn btn-white px-5 py-2" value="提 交">
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>

</div> <!-- .featured-donate -->

<footer class="footer">
    <div class="container">
        <div class="row pt-5">
            <div class="col-md-12 text-center">
                <p>
                    上海大学“携行”团队 | 联系我们 xxxxxxxxxxx <i class="ion-ios-heart text-danger" aria-hidden="true"></i>
                </p>

            </div>
        </div>
    </div>
</footer>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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

</body>
</html>
