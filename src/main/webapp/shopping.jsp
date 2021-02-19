<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/10
  Time: 12:05
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

    <link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">
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

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">

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
                <li class="nav-item"><a href="blog.html" class="nav-link">捐 赠</a></li>
                <li class="nav-item active"><a href="shopping.jsp" class="nav-link">购 物</a></li>
                <li class="nav-item"><a href="about.html" class="nav-link">沟 通</a></li>
                <li class="nav-item"><a href="login.jsp" class="nav-link"><c:if test="${username==null}">登录/注册</c:if><c:if test="${username!=null}">${username}</c:if></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

<div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
        <div class="block-30 block-30-sm item" style="background-image: url('images/bg1.jpg');" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-7">
                        <h2 style="color:white;font:38px bolder;font-family:'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, 'sans-serif'">你的喜爱,<br/>就是我们最大的期待</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="site-section fund-raisers">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/ydx4.jpg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>运 动 鞋</h2>
                        <span class="time d-block mb-3">Sports Shoes</span>
                        <p>共有 <span class="text-success">252</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/lx6.jpeg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>凉 鞋</h2>
                        <span class="time d-block mb-3">Sandal</span>
                        <p>共有 <span class="text-success">150</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/fbx5.jpeg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>帆 布 鞋</h2>
                        <span class="time d-block mb-3">Canvas Shoes</span>
                        <p>共有 <span class="text-success">127</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/xx5.jpeg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>休 闲 鞋</h2>
                        <span class="time d-block mb-3">Casual Shoes</span>
                        <p>共有 <span class="text-success">100</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>


            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/mtx1.jpg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>拖 鞋</h2>
                        <span class="time d-block mb-3">Slipper</span>
                        <p>共有 <span class="text-success">252</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/xz4.jpeg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>靴 子</h2>
                        <span class="time d-block mb-3">Boots</span>
                        <p>共有 <span class="text-success">400</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/px8.jpeg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>皮 鞋</h2>
                        <span class="time d-block mb-3">Leather Shoes</span>
                        <p>共有 <span class="text-success">44</span>双 <br> <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-5">
                <div class="person-donate text-center">
                    <img src="images/yx4.jpeg" alt="Image placeholder" class="img-fluid">
                    <div class="donate-info">
                        <h2>雨鞋</h2>
                        <span class="time d-block mb-3">Rainshoes</span>
                        <p>共有 <span class="text-success">89</span>双 <br>  <a href="#" class="link-underline fundraise-item">详情</a></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div> <!-- .section -->

<div class="featured-section overlay-color-2" style="background-image: url(images/ydx1.jpg);">

    <div class="container">
        <div class="row">

            <div class="col-md-6 mb-5 mb-md-0">
                <img src="images/ydx1.jpg" alt="Image placeholder" class="img-fluid">
            </div>

            <div class="col-md-6 pl-md-5">

                <div class="form-volunteer">

                    <h2>即刻加入我们吧！</h2>
                    <form action="#" method="post">

                        <div class="form-group">
                            <!-- <label for="email">Email</label> -->
                            <input type="text" class="form-control py-2" id="email" placeholder="注册邮箱">
                        </div>
                        <div class="form-group">
                            <!-- <label for="name">Name</label> -->

                            <input type="text" class="form-control py-2" id="name" placeholder="注册密码">
                        </div>
                        <div class="form-group">
                            <!-- <label for="v_message">Email</label> -->
                            <input type="radio" name="usertype" value="捐赠者"/>
                            <span style="color: white;font:18px bold;">捐赠者</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="usertype" value="受捐者"/>
                            <span style="color: white;font:18px bold;">受捐者</span>
                            <!-- <input type="text" class="form-control py-2" id="email"> -->
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-white px-5 py-2" value="注 册">
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

</body>
</html>
