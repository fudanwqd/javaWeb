<%@ page import="entity.User" %>
<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-grid.css">
<link rel="stylesheet" href="../css/bootstrap-reboot.css">
<link rel="stylesheet" href="../css/AdminLTE.css">



<link rel="stylesheet" href="../css/font-awesome.css">
<script src="../js/jquery-3.3.1.min.js"></script>

<script src="../js/adminlte.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrap-table-treegrid.js"></script>
<script src="../js/jquery.treegrid.min.js"></script>
<script src="../js/bootstrap-tab.js"></script>
<script type="text/javascript" src="../js/swiper.min.js"></script>


<style>
    .imgs{
        border-radius: 60%;
    }
    td{
        padding: 10px;
        background-color: #eff7ff ;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<body>


<%--<jsp:useBean id="user" class="entity.User" scope="session"></jsp:useBean>--%>

<jsp:include page="header.jsp"></jsp:include>
<h1 style="font-style: italic" class="text-center">最热展品</h1>
<%
    List<Artwork> hotArtworks = null;
    hotArtworks= (List<Artwork>) request.getAttribute("hotArtworks");
    if(hotArtworks!=null){
%>
<div id="homePageCarousel" class="carousel slide" data-ride="carousel">
    <!--指示符-->
    <ul class="carousel-indicators">
        <li data-target="#homePageCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#homePageCarousel" data-slide-to="1"></li>
        <li data-target="#homePageCarousel" data-slide-to="2"></li>
        <%--<li data-target="#homePageCarousel" data-slide-to="3"></li>--%>
    </ul>
    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active" style="text-align: center">
            <a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(0).getId()%>">
                <img src="<%=hotArtworks.get(0).getImgPath()%>" class="img-fluid img-home">
                <div class="carousel-caption">
                    <h4 class="font-italic"><%=hotArtworks.get(0).getName()%></h4>
                    <p class="font-italic">
                        <%=hotArtworks.get(0).getDescription().substring(0,80)%>
                    </p>
                </div>
            </a>
        </div>
        <%
            for(int i = 1 ; i < hotArtworks.size() ; ++i){
        %>
        <div class="carousel-item" style="text-align: center">
            <a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(i).getId()%>">
                <img src="<%=hotArtworks.get(i).getImgPath()%>" class="img-fluid img-home">
                <div class="carousel-caption">
                    <h4 class="font-italic"><%=hotArtworks.get(i).getName()%></h4>
                    <p class="font-italic">
                        <%=hotArtworks.get(i).getDescription().substring(0,80)%>
                    </p>
                </div>
            </a>
        </div>
        <%
            }
        %>
    </div>
    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#homePageCarousel" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#homePageCarousel" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
    <%
        }
    %>
</div>
<%--<h1 style="font-style: italic" class="text-center">最热展品</h1>--%>

<%--<section class="pc-banner">--%>
    <%--<div class="swiper-container">--%>
        <%--<div class="swiper-wrapper">--%>

            <%--<%--%>
                <%--List<Artwork> hotArtworks = null;--%>
                <%--hotArtworks= (List<Artwork>) request.getAttribute("hotArtworks");--%>
                <%--if(hotArtworks!=null){--%>
            <%--%>--%>
            <%--<div class="swiper-slide swiper-slide-center none-effect">--%>

                <%--<a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(0).getId()%>">--%>
                    <%--<img  src=<%=hotArtworks.get(0).getImgPath()%>>--%>
                <%--</a>--%>
                <%--<p class="text-center"><%=hotArtworks.get(0).getName()%></p>--%>
                <%--<div class="layer-mask"></div>--%>
            <%--</div>--%>
            <%--<div class="swiper-slide ">--%>
                <%--<a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(1).getId()%>">--%>
                    <%--<img src=<%=hotArtworks.get(1).getImgPath()%>>--%>
                <%--</a>--%>
                <%--<p class="text-center"><%=hotArtworks.get(1).getName()%></p>--%>
                <%--<div class="layer-mask"></div>--%>
            <%--</div>--%>
            <%--<div class="swiper-slide ">--%>
                <%--<a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(2).getId()%>">--%>
                    <%--<img src=<%=hotArtworks.get(2).getImgPath()%>>--%>
                <%--</a>--%>
                <%--<p class="text-center"><%=hotArtworks.get(2).getName()%></p>--%>
                <%--<div class="layer-mask"></div>--%>
            <%--</div>--%>
            <%--<%--%>
                <%--}--%>
            <%--%>--%>
        <%--</div>--%>
        <%--<div class="button">--%>
            <%--<div class="swiper-button-prev"></div>--%>
            <%--<div class="swiper-button-next"></div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>


<h1 style="font-style: italic" class="text-center">最新展品</h1>
<div>
    <table>
        <tr>
        <%
            List<Artwork> freshArtworks = null;
            freshArtworks =  (List<Artwork>) request.getAttribute("freshArtworks");
            if(hotArtworks!=null){
                for(int i=0;i<freshArtworks.size();i++){
        %>
            <td style="text-align: center">
                    <a href="/ExhibitionDetailsServlet?id=<%=freshArtworks.get(i).getId()%>">
                <img  class="imgs" style="align-self: auto" src="<%=freshArtworks.get(i).getImgPath()%>"  height="300" width="300" >
            </a>

            <h3 class="text-center"><%=freshArtworks.get(i).getName()%></h3>
            <p><%=freshArtworks.get(i).getDescription().substring(0,60)+"..."%></p>
            </td>
        <%
                }
            }
        %>
        </tr>
    </table>
</div>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.bundle.js"></script>
<script src="../js/bootstrap.js"></script>
<script type="text/javascript">

    window.onload = function() {

        <%
        if(hotArtworks == null){
        %>
        window.location.href="/HomeServlet";
        <%
        }
        %>

        var swiper = new Swiper('.swiper-container',{
            autoplay: false,
            speed: 1000,
            autoplayDisableOnInteraction: false,
            loop: true,
            centeredSlides: true,
            slidesPerView: 2,
            pagination: '.swiper-pagination',
            paginationClickable: true,
            prevButton: '.swiper-button-prev',
            nextButton: '.swiper-button-next',
            onInit: function(swiper) {
                swiper.slides[2].className = "swiper-slide swiper-slide-active";
            },
            breakpoints: {
                668: {
                    slidesPerView: 1
                }
            }
        });
    }


</script>

</body>
</html>