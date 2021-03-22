<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
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
        <div class="block-30 block-30-sm item" style="background-image: url(images/bg1.jpg);"
             data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-7">
                        <h2 style="color:white;font:38px bolder;font-family:'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, 'sans-serif'">
                            我可能不了解你，<br/>但我的鞋子可以陪你走上一段<br/></h2>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="site-section section-counter">
    <div class="container">
        <div class="row">
            <div class="col-md-6 pr-5">
                <div class="block-48">
                    <span class="block-48-text-1">累计</span>
                    <div class="block-48-counter ftco-number" data-number="1321901">0</div>
                    <span class="block-48-text-1 mb-4 d-block">双旧鞋找到了新主人</span>
                    <p class="mb-0"><a href="#" class="btn btn-white px-3 py-2">了解详情</a></p>
                </div>
            </div>
            <div class="col-md-6 welcome-text">
                <h2 class="display-4 mb-3">Who Are We?</h2>
                <p class="lead">可能就是一双旧鞋子，就会温暖一双伤痕累累的小脚；可能就是一个小小的举动，就会慰藉一个弱小的心灵。
                    在全民垃圾回收和废物利用的大环境下，本网站希望通过聚集那些拥有一颗善心的鞋友们，回收利用他们的旧鞋，并给那些急需者送去他们的善意。</p>
                <p class="mb-4">源于环境保护和爱心捐助的初衷，我们开发了“携行”网站，希望为这份事业尽自己的绵薄之力，感谢您的参与。</p>

            </div>
        </div>
    </div>
</div>

<div class="site-section border-top">
    <div class="container">
        <div class="row">

            <div class="col-md-4">
                <div class="media block-6">
                    <div class="icon"><span class="ion-ios-bulb"></span></div>
                    <div class="media-body">
                        <h3 class="heading">To&nbsp;&nbsp;&nbsp;&nbsp;捐赠者</h3>
                        <p>本网站作为一个小型无偿捐赠平台，希望可以给热心公益的捐赠者们，提供了一对一旧鞋认捐的平台。</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="media block-6">
                    <div class="icon"><span class="ion-ios-cash"></span></div>
                    <div class="media-body">
                        <h3 class="heading">To&nbsp;&nbsp;&nbsp;&nbsp;受捐者</h3>
                        <p>本网站作为一个小型无偿购物平台，希望可以给急需者们一个选择尺码和款式的选择空间。</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="media block-6">
                    <div class="icon"><span class="ion-ios-contacts"></span></div>
                    <div class="media-body">
                        <h3 class="heading">关于我们</h3>
                        <p>我们是由三名上海大学计算机专业本科生组成的团队，期待与您的合作！</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div> <!-- .site-section -->
<!-- .section -->
<!-- .section -->
<!-- .featured-donate -->
<!-- .section -->

<script language="JavaScript" type="text/javascript">
    function login() {
        var email = this.email;
        var password = document.getElementById("password");
        var type = document.getElementsByName("type");
        for (var i = 0, len = type.length; i < len; i++) {
            if (type[i].checked) {
                leixing = type[i];
            }
        }
        window.location.href = "loginServlet?param=login&email=" + email.value + "&password=" + password.value + "&leixing=" + leixing.value + "";
    }

    function register() {
        window.location.href = "loginServlet?param=register";
    }

    function checkEmail() {
        var inputNode = document.getElementById("email");
        var spanNode = document.getElementById("confirmemail");
        var content = inputNode.value;
        //编写邮箱的正则
        var reg = /^[a-z0-9]\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/i;///^[a-z0-9]\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/i;
        if (inputNode.value.length == 0) {
            spanNode.innerHTML = "不能为空哦！".fontcolor("red");
            return false;
        }
        if (reg.test(content)) {
            spanNode.innerHTML = "邮箱合法".fontcolor("green");
            return true;
        } else {
            spanNode.innerHTML = "邮箱格式错误".fontcolor("red");
            return false;
        }
    }

    function jump() {
        window.location.href = "/vvv";
    }

</script>

<div hidden id="jumptoList_email">${useremail}</div>
<div class="featured-section overlay-color-2" style="background-image: url(images/ydx1.jpg);">

    <div class="container">
        <div class="row">

            <div class="col-md-6 mb-5 mb-md-0">
                <img src="images/ydx1.jpg" alt="Image placeholder" class="img-fluid">
            </div>

            <div class="col-md-6 pl-md-5">

                <div class="form-volunteer">
                    <h2 style="font-size: 25px;font-weight: bolder;line-height: 80px;width: 260px;margin: 0 auto;">即刻加入我们吧！</h2>
                    <form action="loginServlet?param=login" method="POST">
                        <table>
                            <div class="form-group">
                                <input type="text" class="form-control py-2" name="email" onblur="checkEmail()"
                                       id="email" placeholder="邮箱">
                                <%--                                <span id="confirmemail" style="font:15px bold;"></span>--%>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control py-2" name="password" id="password"
                                       placeholder="密码">
                            </div>
                            <div class="form-group">
                                <input type="radio" name="type" value="doner" checked/>
                                <span style="color: white;font:18px bolder;">捐赠者</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="type" value="donee"/>
                                <span style="color: white;font:18px bolder;">受捐者</span>
                            </div>

                            <div class="form-group">
                                <input type="submit" class="btn btn-white px-5 py-2" value="登 录"
                                       onclick="JavaScript:login()" onsubmit="return check();">
                                <input type="Button" class="btn btn-white px-5 py-2" value="注 册"
                                       onclick="JavaScript:register()">
                            </div>
                            <span style="color: red">${error}</span>
                        </table>
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
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>


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
<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>--%>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
    function jumptoList() {
        window.location.href="listServlet";
    }
</script>


</body>
</html>
