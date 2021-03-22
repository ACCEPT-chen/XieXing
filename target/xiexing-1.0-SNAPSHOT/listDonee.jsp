<%--
  Created by IntelliJ IDEA.
  User: 14178
  Date: 2021/2/19
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="zh">
<head>
    <title>携行 &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <%--    <link rel="stylesheet" href="css/owl.carousel.min.css">--%>
    <%--    <link rel="stylesheet" href="css/owl.theme.default.min.css">--%>
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
    <div class="container"><a class="navbar-brand" href="index.html">携&nbsp; 行</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="javascript:void(0);" class="nav-link">首 页</a></li>
                <li class="nav-item active"><a href="index.jsp" class="nav-link">捐 赠</a></li>
                <li class="nav-item"><a href="javascript:void(0);" class="nav-link">购 物</a></li>
                <li class="nav-item"><a href="contactDonor.jsp" class="nav-link">沟 通</a></li>
                <li class="nav-item"><a href="listDonor.jsp" class="nav-link">${username}</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->
<div class="block-31" style="position: relative;">
    <div class="loop-block-31 ">
        <div class="block-30 block-30-sm item" style="background-image: url('images/bg_1.jpg');"
             data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-7">
                        <h2 class="heading">收到的爱心帮助</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main-section">
    <div class="container">
        <div class="row">
            <ul id="donationlist">
                <c:forEach items="${requestScope.donationList}" var="donation">
                    <li class="clearfix">
                        <p>鞋 昵称： <strong>${donation.name}</strong></p>
                        <div class="show_item">
                            <a class="img-hover" href=${donation.photo}>
                                <span class="icon icon-search"></span>
                                <img class="img-fluid" src=${donation.photo}>
                            </a>
                        </div>
                        <div class="item_info">
                            <br>
                            <span>尺码： ${donation.size}</span> - <span>类型： ${donation.type}</span> -
                            <span>${donation.sex}</span>
                        </div>
                        <div class="item_cond">
                            <c:if test="${donation.cond==1}">
                                <span>已匹配</span>
                                <div class="donee-info">
                                    <span>捐助者姓名： ${donor.name}</span>
                                    <span>捐助者邮箱： ${donor.email}</span>
                                    <div class="show_item">
                                        <a class="img-hover" href=${donor.photo}>
                                            <span class="icon icon-search"></span>
                                            <img class="img-fluid" src=${donor.photo}>
                                        </a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${donation.cond==0}"><span>等待确认</span></c:if>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>


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


<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>

<script src="js/jquery.fancybox.min.js"></script>

<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<%--<script type="text/javascript">--%>
<%--    function jumptodonor(id) {--%>
<%--        window.location.href="contactServlet?param=lookee&id="+id;--%>
<%--        // window.open("/contactServlet?id="+id,'_blank');--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>

