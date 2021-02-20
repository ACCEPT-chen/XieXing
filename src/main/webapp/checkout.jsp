<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/2/20
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title>GiveHope &mdash; Website Template by Colorlib</title>
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
        function checkAll(){
            // var confirmSecret =passwordCheck();
            // var userName = checkName();
            // var userSecret =checkpassword();
            // var userEmail = checkEmail();
            // var checkphoto=Ckeckphoto();
            // if(userName&&userEmail&&userSecret&&confirmSecret&&checkphoto){
            //     return true;
            // }
            // else {
            //     alert("提交失败，请重新填写！");
            //     return false;
            //
            // }
            alert("确认订单");
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
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="index.jsp" class="nav-link">首 页</a></li>
                <li class="nav-item"><a href="donation.jsp" class="nav-link">捐 赠</a></li>
                <li class="nav-item"><a href="shopping.jsp" class="nav-link">购 物</a></li>
                <li class="nav-item"><a href="about.html" class="nav-link">沟 通</a></li>
                <li class="nav-item active"><a href="login.jsp" class="nav-link">登录 / 注册</a></li>
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

<div class="featured-section overlay-color-2" style="background-image: url(images/ydx1.jpg);">

    <div class="container">
        <div class="row">

            <div class="col-md-6 mb-5 mb-md-0">
                <img src="images/ydx1.jpg" alt="Image placeholder" class="img-fluid" id="my-img" name="my-img" onchange="change(this)">
            </div>

            <div class="col-md-6 pl-md-5">

                <div class="form-volunteer">

                    <h2>核对订单</h2>

                    <form action="searchServlet?param=check" method="post"  onsubmit="return checkAll()">
<div class="col-lg-4 ">
    <div class="row">
        <input type="text" readonly class="form-control py-2" name="shoes_name" id="shoes_name" placeholder=" ${donation.name}">
        <%--                            ${donation.name}--%>

        <input type="text" readonly class="form-control py-2" name="shoes_type" id="shoes_type" placeholder="${donation.type}">
        <%--                            ${donation.type}--%>


        <input type="password" readonly class="form-control py-2" name="shoes_size" id="shoes_size" placeholder="${donation.size}">
        <%--                            ${donation.size}--%>
        <input type="password" readonly class="form-control py-2" name="shoes_sex" id="shoes_sex" placeholder="${donation.sex}">
        <%--                            ${donation.sex}--%>
        <input type="password" class="form-control py-2" name="donorname" id="donorname" placeholder="${donorname}">
        <%--                            ${donation.donorname}--%>

        <input type="password" class="form-control py-2" name="donoremail" id="donoremail" placeholder="${donation.useremail}">
        <%--                            ${donation.donoremail}--%>
        <input type="password" class="form-control py-2" name="doneename" id="doneename" placeholder="${username}">
        <%--                            ${donation.doneename}--%>
        <input type="password" class="form-control py-2" name="doneeemail" id="doneeemail" placeholder="${useremail}">
        <%--                            ${donation.doneeemail}--%>
    <div class="form-group">
        <input type="submit" class="btn btn-white px-5 py-2" value="确认">
    </div>
    <div class="form-group">
        <button class="btn btn-white px-5 py-2" onclick="javascript :history.back(-1);" >取消</button>
    </div>
    </div>
</div>

                        <div>&nbsp;</div>
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
