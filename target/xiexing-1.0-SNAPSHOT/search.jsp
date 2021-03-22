<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/2/20
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/search.css">
    <style>

        .block {
            display: flex;
            align-items: center;
            width: 500px;
            height: 30px;
            padding-bottom: 50px;
            margin: 10px auto 10px;
        }

        #wordTags {
            display: flex;
            flex-wrap: nowrap;
        }
    </style>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
    <script type="text/javascript" src="js/PageJS/aspect.js"></script>
    <script type="text/javascript" src="js/PageJS/keyWord.js"></script>
    <script type="text/javascript">
        function load() {
            window.location.hash = "1100px";
            // window.location.hash = "#bbb";
        }

        $(function () {
            var keyWord = $("#wordInput").keyWord({
                panel: '#wordTags',
                value: '#wordHiddenInput',
                max: 3,
                tips: '最多只能输入3项'
            });
            keyWord.init('${requestScope.type},${requestScope.size},${requestScope.sex}');
        });

    </script>
    <script>
        /**
         * 上一页点击事件
         */
        function prePage() {
            var curPage = document.getElementById("pageno").value;
            if (curPage <= 1) {
                $(this).attr('disabled', "true");
            }
            window.location.href = 'searchServlet?param=surf&type=${requestScope.type}&size=${requestScope.size}&sex=${requestScope.sex}&pageno=${requestScope.shoesPage.prePage}';
            // alert("上一页");
            return false;
        }

        /**
         * 下一页点击事件
         */
        function nextPage() {
            var curPage = ${requestScope.shoesPage.pageNo};
            var pageNumber = ${requestScope.shoesPage.totalPages};
            if (curPage >= pageNumber) {
                $(this).attr('disabled', "true");
            }
            window.location.href = 'searchServlet?param=surf&type=${requestScope.type}&size=${requestScope.size}&sex=${requestScope.sex}&pageno=${requestScope.shoesPage.nextPage}';
            return false;
        }

        function firstPage() {
            window.location.href = 'searchServlet?param=surf&type=${requestScope.type}&size=${requestScope.size}&sex=${requestScope.sex}&pageno=${requestScope.shoesPage.firstPage}';
            // alert("首页");
            return false;
        }

        function lastPage() {
            window.location.href = "searchServlet?param=surf&type=${requestScope.type}&size=${requestScope.size}&sex=${requestScope.sex}&pageno=${requestScope.shoesPage.lastPage}";
            // alert("尾页");
            return false;
        }

        function jumpPage() {
            var curPage = document.getElementById("pageno").value;
            if (curPage != ${requestScope.shoesPage.pageNo} && curPage <= ${requestScope.shoesPage.totalPages} && curPage >= 1)
                window.location.href = "searchServlet?param=surf&type=${requestScope.type}&size=${requestScope.size}&sex=${requestScope.sex}&pageno=" + curPage;
            // alert("跳页");
            return false;
        }

        function gosearch(str1, str2, str3) {
            window.location.href = "searchServlet?param=surf&type=+" + str1 + "&size=" + str2 + "&sex=" + str3 + "&pageno=" + curPage;
        }

        function changeKey(index, str) {
            var str1 = '${requestScope.type}';
            var str2 = '${requestScope.size}';
            var str3 = '${requestScope.sex}';
            if (index == 1) {
                str1 = str;
            } else if (index == 2) {
                str2 = str;
            } else if (index == 3) {
                str3 = str;
            }
            var keyWord = $("#wordInput").keyWord({
                panel: '#wordTags',
                value: '#wordHiddenInput',
                max: 3,
                tips: '最多只能输入3项'
            });
            keyWord.init(str1 + ',' + str2 + ',' + str3);

            gosearch(str1, str2, str3);
        }

    </script>

</head>
<body onload="load()">

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
                <li class="nav-item"><a href="listServlet" class="nav-link">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->
<div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
        <div class="block-30 block-30-sm item" style="background-image: url('images/bg1.jpg');"
             data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-7">
                        <h2 style="color:white;font:38px bolder;font-family:'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, 'sans-serif'">
                            你的喜爱,<br/>就是我们最大的期待</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="featured-section overlay-color-2">
    <div class="col-lg-12">
        <div class="text-center w-100 pt-3">
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&type=全部类型&size=${requestScope.size}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys active">全部类型</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&type=运动鞋&size=${requestScope.size}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'运动鞋')">运动鞋</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&type=凉鞋&size=${requestScope.size}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'凉鞋')">凉鞋</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&type=帆布鞋&size=${requestScope.size}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'帆布鞋')">帆布鞋</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&type=休闲鞋&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'休闲鞋')">休闲鞋</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&type=拖鞋&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'拖鞋')">拖鞋</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&type=靴子&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'靴子')">靴子</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&type=皮鞋&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'皮鞋')">皮鞋</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&type=雨鞋&pageno=1"
                                                    class="classifys " onclick="changeKey(1,'雨鞋')">雨鞋</a></div>
        </div>
    </div>
    <div id="bbb" hidden></div>
    <div class="col-lg-12">
        <div class="text-center w-100 pt-3">
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&size=全部尺码&type=${requestScope.type}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys active">全部尺码</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&size=36&type=${requestScope.type}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys " onclick="changeKey(2,'36')">36</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&size=37&type=${requestScope.type}&sex=${requestScope.sex}&pageno=1"
                                                    class="classifys " onclick="changeKey(2,'37')">37</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&size=38&pageno=1"
                                                    class="classifys " onclick="changeKey(2,'38')">38</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&size=39&pageno=1"
                                                    class="classifys " onclick="changeKey(2,'39')">39</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow" href="searchServlet?param=surf&size=40&pageno=1"
                                                    class="classifys " onclick="changeKey(2,'40')">40</a></div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="text-center w-100 pt-3">
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&sex=全部&type=${requestScope.type}&size=${requestScope.size}&pageno=1"
                                                    class="classifys active">全部</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&sex=男&type=${requestScope.type}&size=${requestScope.size}&pageno=1"
                                                    class="classifys " onclick="changeKey(3,'男')">男</a></div>
            <div class="btn btn-white px-5 py-2"><a rel="nofollow"
                                                    href="searchServlet?param=surf&sex=女&type=${requestScope.type}&size=${requestScope.size}&pageno=1"
                                                    class="classifys " onclick="changeKey(3,'女')">女</a></div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="text-center w-100 pt-3">
            <div class="block">
                <div id="wordTags"></div>
                <%--                <input  id="wordInput" type="text" name="" placeholder="请输入关键词以空格结尾">--%>
                <input id="wordHiddenInput" type="hidden" name="">
                <%--                <input type="Button"  class="btn btn-white px-5 py-2" value="搜索" onclick="gosearch()">--%>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${requestScope.shoesPage.donationList}" var="shoes">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img style="width: 100%" src="photos/${shoes.photo}.jpg" alt="">
                                <%--                            <img src="../photos/${shoes.photo}.jpg" alt="">--%>
                            <div class="pi-links"><a href="searchServlet?param=check&checkid=${shoes.id}"
                                                     class="add-card"><em class="flaticon-bag"></em><span>Want it</span></a>
                            </div>
                        </div>
                        <div class="pi-text">
                            <h6>${shoes.size}&nbsp;&nbsp;&nbsp;&nbsp;${shoes.sex}</h6>
                            <p>${shoes.name}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
    <div class="col-lg-12">
        <div class="text-center w-100 pt-3">
            <%--                        <button class="site-btn sb-line sb-dark">LOAD MORE</button>--%>
            <input type="Button" id="first" class="btn btn-white px-5 py-2" value="首页" onclick="firstPage()">
            <input type="Button" id="pre" class="btn btn-white px-5 py-2" value="上一页" onclick="prePage()">
            <input type="text" id="pageno" name="pageno" class="btn btn-white px-5 py-2" style="width: 180px;"
                   value="${requestScope.shoesPage.pageNo}" onblur="jumpPage()">
            <input type="Button" id="next" class="btn btn-white px-5 py-2" value="下一页" onclick="nextPage()">
            <input type="Button" id="last" class="btn btn-white px-5 py-2" value="尾页" onclick="lastPage()">
            <p style="width: 180px;margin: 0 auto;padding-top: 20px;font-size: 16px;color: #000;">
                总共${requestScope.shoesPage.totalPages}页</p>
        </div>
    </div>
</div>


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

</body>
</html>

