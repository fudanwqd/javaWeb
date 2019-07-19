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
<%--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
<%--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>--%>
<%--<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>--%>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<body>
<header class="main-header">
    <a href=" " class="logo">
        <span class="logo-mini"><b>ZK</b>JZ</span>
        <span class="logo-lg"><b>Welcome</b> 张江博物馆</span>
    </a>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" id="mytab">
                    <li><a href="Home.jsp">首页</a></li>
                    <li><a href="Search.jsp">搜索</a></li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="Person.jsp">个人信息</a></li>
                            <li><a href="Friends.jsp">好友列表</a></li>
                            <li><a href="CollectionDirectory.jsp">收藏夹</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
    <h1 style="font-style: italic" class="text-center">最热展品</h1>
    <section class="pc-banner">
        <div class="swiper-container">
            <div class="swiper-wrapper">

                    <%
                        List<Artwork> hotArtworks = null;
                        hotArtworks= (List<Artwork>) request.getAttribute("hotArtworks");
                        if(hotArtworks!=null){
                            %>
                    <div class="swiper-slide swiper-slide-center none-effect">
                    <a href="ExhibitionDetails.jsp?id=<%=hotArtworks.get(0).getId()%>">
                        <img  class="rounded-circle" src=<%=hotArtworks.get(0).getImgPath()%>>
                    </a>
                    <div class="layer-mask"></div>
                    </div>
                <div class="swiper-slide ">
                    <a href="ExhibitionDetails.jsp?id=<%=hotArtworks.get(1).getId()%>">
                        <img  class="rounded-circle" src=<%=hotArtworks.get(1).getImgPath()%>>
                    </a>
                    <div class="layer-mask"></div>
                </div>
                <div class="swiper-slide ">
                    <a href="ExhibitionDetails.jsp?id=<%=hotArtworks.get(2).getId()%>">
                        <img  class="rounded-circle" src=<%=hotArtworks.get(2).getImgPath()%>>
                    </a>
                    <div class="layer-mask"></div>
                </div>
                <%
                        }
                    %>

                <%--<div class="swiper-slide swiper-slide-center none-effect">--%>
                    <%--<a href="#">--%>
                        <%--<img  class="rounded-circle" src="../img/书画/清 弘仁 疏泉洗砚图卷.jpg">--%>
                    <%--</a>--%>
                    <%--<div class="layer-mask"></div>--%>
                <%--</div>--%>
                <%--<div class="swiper-slide">--%>
                    <%--<a href="#">--%>
                        <%--<img src="../img/书画/清 王翚 茂林仙馆图轴.jpg">--%>
                    <%--</a>--%>
                    <%--<div class="layer-mask"></div>--%>
                <%--</div>--%>
                <%--<div class="swiper-slide">--%>
                    <%--<a href="#">--%>
                        <%--<img src="../img/书画/清 蒋廷锡 芍药图轴.jpg">--%>
                    <%--</a>--%>
                    <%--<div class="layer-mask"></div>--%>
                <%--</div>--%>
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
                <a href="ExhibitionDetails.jsp?id=<%=freshArtworks.get(i).getId()%>">
                <img src="<%=freshArtworks.get(i).getImgPath()%>" class="img-rounded"  height="300" width="300" >
                </a>
                <p><%=freshArtworks.get(i).getName()%></p>
            </div>
            <%
               }
            }
        %>
        </div>
    </div>
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script type="text/javascript">

    window.onload = function() {
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
         window.onload = function loadPicture() {
             window.location.href="/HomeServlet";
             alert("1")
            // $.ajax({
            //     url:"/HomeServlet",//servlet文件的名称
            //     type:"GET",
            //     success:function(e){
            //         alert("servlet调用成功！");
            //     }
            // });
        }
    }


</script>
</body>
</html>