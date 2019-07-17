<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="utf-8">
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


<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<head>
    <title>展品搜索</title>
</head>
<style>
    .showPicture{
        height: 100px;
        width: 100px;
    }
    .frame{background-color: beige;
        margin:2px 20px;
        border: outset;
        border-color: black;
        border-width: 3px;}

</style>
<body>
<header class="main-header">
    <a href="#" class="logo">
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">用户<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="#">好友列表</a></li>
                            <li><a href="#">收藏夹</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="input-group">
                <input type="text" class="form-control" onkeydown="onKeyDown(event)"/>
                <span class="input-group-addon"><i class="glyphicon glyphicon-search" onclick="doSearch()"></i></span>
            </div>
        </div>
    </div>
    <section>
        <h2>搜索结果：</h2>
        <div id="selection">
            <!--排序方式:-->
            <!--<input type="radio"name="selection"value="价格">价格-->
            <!--<input type="radio"name="selection"value="热度">热度-->
            <!--<input type="radio"name="selection"value="标题">标题-->
        </div>
        <table>
            <tr>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src="../img/金石/古父己卣.jpg"> </td>
                            <td>古父己卣</td>
                        </tr>
                        <tr>
                            <td>朝代：</td>
                        </tr>
                        <tr>
                            <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                        </tr>
                        <tr>
                            <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                            <td><button type="button"><a href="#">收藏</a></button></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                            <td>古父己卣</td>
                        </tr>
                        <tr>
                            <td>朝代：</td>
                        </tr>
                        <tr>
                            <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                        </tr>
                        <tr>
                            <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                            <td><button type="button"><a href="#">收藏</a></button></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                            <td>古父己卣</td>
                        </tr>
                        <tr>
                            <td>朝代：</td>
                        </tr>
                        <tr>
                            <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                        </tr>
                        <tr>
                            <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                            <td><button type="button"><a href="#">收藏</a></button></td>
                        </tr>
                    </table>
                </td>

            </tr>
            <tr>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                            <td>古父己卣</td>
                        </tr>
                        <tr>
                            <td>朝代：</td>
                        </tr>
                        <tr>
                            <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                        </tr>
                        <tr>
                            <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                            <td><button type="button"><a href="#">收藏</a></button></td>
                        </tr>
                    </table>
                </td>  <td>
                <table class="frame">
                    <tr>
                        <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                        <td>古父己卣</td>
                    </tr>
                    <tr>
                        <td>朝代：</td>
                    </tr>
                    <tr>
                        <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                            此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                        <td><button type="button"><a href="#">收藏</a></button></td>
                    </tr>
                </table>
            </td>  <td>
                <table class="frame">
                    <tr>
                        <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                        <td>古父己卣</td>
                    </tr>
                    <tr>
                        <td>朝代：</td>
                    </tr>
                    <tr>
                        <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                            此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                        <td><button type="button"><a href="#">收藏</a></button></td>
                    </tr>
                </table>
            </td>
            </tr>
            <tr>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                            <td>古父己卣</td>
                        </tr>
                        <tr>
                            <td>朝代：</td>
                        </tr>
                        <tr>
                            <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                        </tr>
                        <tr>
                            <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                            <td><button type="button"><a href="#">收藏</a></button></td>
                        </tr>
                    </table>
                </td>  <td>
                <table class="frame">
                    <tr>
                        <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                        <td>古父己卣</td>
                    </tr>
                    <tr>
                        <td>朝代：</td>
                    </tr>
                    <tr>
                        <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                            此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                        <td><button type="button"><a href="#">收藏</a></button></td>
                    </tr>
                </table>
            </td>  <td>
                <table class="frame">
                    <tr>
                        <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                        <td>古父己卣</td>
                    </tr>
                    <tr>
                        <td>朝代：</td>
                    </tr>
                    <tr>
                        <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                            此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                        <td><button type="button"><a href="#">收藏</a></button></td>
                    </tr>
                </table>
            </td>
            </tr>
            <tr>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                            <td>古父己卣</td>
                        </tr>
                        <tr>
                            <td>朝代：</td>
                        </tr>
                        <tr>
                            <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                        </tr>
                        <tr>
                            <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                            <td><button type="button"><a href="#">收藏</a></button></td>
                        </tr>
                    </table>
                </td>  <td>
                <table class="frame">
                    <tr>
                        <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                        <td>古父己卣</td>
                    </tr>
                    <tr>
                        <td>朝代：</td>
                    </tr>
                    <tr>
                        <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                            此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                        <td><button type="button"><a href="#">收藏</a></button></td>
                    </tr>
                </table>
            </td>  <td>
                <table class="frame">
                    <tr>
                        <td rowspan="2"><img class="showPicture" src="img/金石/古父己卣.jpg"> </td>
                        <td>古父己卣</td>
                    </tr>
                    <tr>
                        <td>朝代：</td>
                    </tr>
                    <tr>
                        <td colspan="2">藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                            此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="ExhibitionDetails.jsp">详情</a></button></td>
                        <td><button type="button"><a href="#">收藏</a></button></td>
                    </tr>
                </table>
            </td>
            </tr>
        </table>
        <div class="row text-center">
            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>

    </section>
    <script type="text/javascript">
        function onKeyDown(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13){ // enter 键
                doSearch();
            }

        }
        function doSearch() {
            alert("搜索！")
        }


    </script>
</div>
</body>
</html>
