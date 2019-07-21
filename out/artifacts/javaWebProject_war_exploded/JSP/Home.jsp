<%@ page import="entity.User" %>
<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/font-awesome.css">
<link rel="stylesheet" href="../css/AdminLTE.css">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/adminlte.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrap-table-treegrid.js"></script>
<script src="../js/jquery.treegrid.min.js"></script>
<script src="../js/bootstrap-tab.js"></script>
<script type="text/javascript" src="../js/swiper.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<body>


<%--<jsp:useBean id="user" class="entity.User" scope="session"></jsp:useBean>--%>

<jsp:include page="header.jsp"></jsp:include>

<h1 style="font-style: italic" class="text-center">最热展品</h1>
<section class="pc-banner">
    <div class="swiper-container">
        <div class="swiper-wrapper">

            <%
                List<Artwork> hotArtworks = null;
                hotArtworks= (List<Artwork>) request.getAttribute("hotArtworks");
                if(hotArtworks!=null){
            %>
            <div class="swiper-slide swiper-slide-center ">

                <a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(0).getId()%>">
                    <img  class="rounded-circle" src=<%=hotArtworks.get(0).getImgPath()%>>
                </a>
                <p class="text-center"><%=hotArtworks.get(0).getName()%></p>
                <div class="layer-mask"></div>
            </div>
            <div class="swiper-slide ">
                <a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(1).getId()%>">
                    <img  class="rounded-circle" src=<%=hotArtworks.get(1).getImgPath()%>>
                </a>
                <p class="text-center"><%=hotArtworks.get(1).getName()%></p>
                <div class="layer-mask"></div>
            </div>
            <div class="swiper-slide ">
                <a href="/ExhibitionDetailsServlet?id=<%=hotArtworks.get(2).getId()%>">
                    <img  class="rounded-circle" src=<%=hotArtworks.get(2).getImgPath()%>>
                </a>
                <p class="text-center"><%=hotArtworks.get(2).getName()%></p>
                <div class="layer-mask"></div>
            </div>
            <%
                }
            %>
        </div>
        <div class="button">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>
</section>


<h1 style="font-style: italic" class="text-center">最新展品</h1>
<div class="container">
    <div class="row">
        <%
            List<Artwork> freshArtworks = null;
            freshArtworks =  (List<Artwork>) request.getAttribute("freshArtworks");
            if(hotArtworks!=null){
                for(int i=0;i<freshArtworks.size();i++){
        %>
        <div class="col-lg-4">
            <a href="/ExhibitionDetailsServlet?id=<%=freshArtworks.get(i).getId()%>">
                <img src="<%=freshArtworks.get(i).getImgPath()%>" class="img-rounded"  height="300" width="300" >
            </a>
            <p class="text-center"><%=freshArtworks.get(i).getName()%></p>
        </div>
        <%
                }
            }
        %>

    </div>
</div>
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