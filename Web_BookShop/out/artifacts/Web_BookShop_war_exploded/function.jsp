<%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-23
  Time: 下午9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>功能说明</title>

    <link rel="icon" href="img/yumaoicon.png">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/__zcrMain.css" rel="stylesheet"><!-- 自定义less文件编译之后生成的css文件 -->
    <link href="css/zcrMain.css" rel="stylesheet"><!-- zcr写CSS的地方 -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body id="functionPage">
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation"><!-- 顶部导航条 -->
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.html">
                <img alt="Brand" src="img/catlogo.png" width="111px">
            </a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- <a class="navbar-brand" href="index.html">DB Project</a> -->
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="index.jsp"><span class="icon fa fa-home"></span> 首页</a>
                </li>
                <li class="dropdown">
                    <a href="#trick" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="icon fa fa-group"></span>
                        团队
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-chrome">陈绎天-2014302637</a></li>
                        <li><a href="#group">胡博-2014302638</a></li>
                    </ul>
                </li>
                <li class="active"><a href="function.jsp"><span class="icon fa fa-envira"></span> 功能</a></li>
                <li><a href="manage.jsp"><span class="icon fa fa-wrench"></span> 管理</a></li>
                <li><a href="#aboutModal" data-toggle="modal" data-target="#aboutModal"><span class="icon fa fa-comments"></span> 关于</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <%
                        if (session.getAttribute("studentID")==null){
                            out.println("<a href=\"login.jsp\" class=\"login\">登录 | 注册</a>");
                        }else{
                            out.println("<li><a href=\"manage.jsp#shopping-cart\"><span class=\"icon fa fa-shopping-cart\"></span> 购物车</a></li>");
                            out.println("<li><a href=\"manage.jsp\">"+session.getAttribute("username")+"</a></li>\n" +
                                    "                <li><a href=\"process_logout.jsp\">注销</a></li>v");
                        }
                    %>
                </li>
            </ul>
        </div>
    </div>
</nav><!-- 顶部导航条 -->

<div id="homepage-feature" class="carousel slide" data-ride="carousel"><!-- 轮播 -->
    <ol class="carousel-indicators"><!-- 进度指示器 -->
        <li data-target="#homepage-feature" data-slide-to="0" class="active"></li>
        <li data-target="#homepage-feature" data-slide-to="1"></li>

    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="img/crazy-animals.jpg" alt="animals">
            <div class="carousel-caption">
                <h3>西工大校园旧书交易系统</h3>
                <p>Talk is cheap,show us the book.</p>
            </div>
        </div>
        <div class="item">
            <img src="img/girl.jpg" alt="girl">
            <div class="carousel-caption">
                <h3>NPUer &middot; 专属</h3>
                <p>我们将思索汇聚指尖，与你在云端相遇</p>
            </div>
        </div>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#homepage-feature" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#homepage-feature" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- 轮播 -->

<div class="container" id="summary-container">
    <div class="row">
        <div class="col-md-6">
            <img src="img/code.png" alt="Language">
            <h3>编程语言</h3>
            <p>
                使用的技术：JAVA、JSP、Servlet、JDBC
                、LESS、JavaScript、HTML<br>
                Web框架：采用Django
            </p>
        </div>
        <div class="col-md-6">
            <!-- <img src="img/book.png" alt="book"> -->
            <img src="img/respond.png" alt="响应式">
            <h3>开发环境</h3>
            <p>
                DreamWeave，Intellij IDEA<br>
                MySQL WorkBench
            </p>
        </div>
    </div>
    <!-- <hr class="divider"> -->
    <div class="tabList">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#abstract" role="tab" data-toggle="tab">项目简介</a></li>
            <!-- <li role="presentation"><a href="#guide" role="tab" data-toggle="tab">使用方法</a></li> -->
            <li role="presentation"><a href="#group" role="tab" data-toggle="tab">团队</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="abstract">
                <h3>NPUer专属旧书交易平台</h3>
                <h5>我们将思索汇聚指尖，与你在云端相遇</h5>
                <div class="row">
                    <div class="col-md-4">
                        <img src="img/Hot_Filter_Feather.png" alt="">
                    </div>
                    <div class="col-md-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">这是我们的web大作业</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: left">
                                    鉴于工大校园中每年都有大量的旧书被当废纸处理掉，而又有好多同学由于课程需要，到北门外的旧书店去购买，浪费了很多资源。<br>
                                    其实...我们可以有自己的旧书交易系统！
                                    只要简单注册一个账号，就可以淘到自己需要的好书~<br>
                                    种类齐全，教科书、课外书...计算机相关、文学、哲学、美学...应有尽有！不要再犹豫，赶快来体验吧!
                                </p>
                            </div>
                            <div class="panel-footer">2016</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="tab-pane" id="guide">
                <h3>Help信息</h3>
            </div> -->

            <div class="tab-pane" id="group">
                <a name="trick"></a>
                <h3>我们的团队</h3>
                <p>
                    来自计算机学院10011407班的 胡博 和 陈绎天。我们崇(xi)尚(huan)实(zhe)战(teng)
                </p>
                <div class="row">
                    <div class="col-md-6 author1">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <div class="portrait">
                                        <img src="img/zcrPortrait.png" alt="陈绎天">
                                    </div>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <div class="authorinfo">
                                    <h4>陈绎天</h4>
                                    <p>
                                        计算机学院10011407班 2014302637
                                    </p>
                                    <p>
                                        一个落魄街头的程序猿。主要负责后台部分
                                    </p>
                                    <p style="text-align: left">项目贡献度：</p>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            <span class="sr-only">50% Complete</span>50%
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 author2">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <div class="portrait">
                                        <img src="img/subinPortrait.png" alt="胡博">
                                    </div>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <div class="authorinfo">
                                    <h4>胡博</h4>
                                    <p>
                                        计算机学院10011407班 2014302638
                                    </p>
                                    <p>
                                        前端界小霸王，喜欢吃饭睡觉打游戏.主要负责前端部分
                                    </p>
                                    <p style="text-align: left">项目贡献度：</p>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            <span class="sr-only">50% Complete</span>50%
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </div>







        </div>
    </div>

</div>
</div>
</div>
</div>

<div class="details-info">
    <div class="container card-container">
        <div class="row">
            <div class="col-sm-6 card-group">
                <article class="card" id="card1">
                    <h3><span class="icon fa fa-book"></span> 主要功能</h3>
                    <p>
                        我们专注于校园二手书交易。
                        我们支持：书籍查询、发布出售书籍信息、发布求购书籍信息以及用户基本信息管理、实时更新书籍交易记录等核心功能。<br>
                        我们将思索汇聚指尖，与你在云端相遇。希望本系统可以为更多的NPUer带来学习上的便利。<span class="icon fa fa-smile-o"></span>
                    </p>
                </article>
                <article class="card" id="card3">
                    <h3><span class="icon fa fa-envira"></span> 实践记录</h3>
                    <p>
                        在设计界面的时候查阅了大量的其他网站的源代码，比较优化，借助bootstrap的架构，反复尝试后，终于勉强实现了现在的界面。<br>
                    </p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </article>
            </div>
            <div class="col-sm-6 card-group">
                <article class="card" id="card2">
                    <h3><span class="icon fa fa-database"></span>网络编程</h3>
                    <p>
                        我们使用开源关系型数据库MySQL，不同于SQLite，这是一个真正的服务器数据库。<br> 在整个设计中，我们一人负责前端，一人负责后台，页面设计借鉴了csdn以及一些程序员交流网站的界面，后台则通过课堂学习，搭建服务器，进行资源整合。
                    </p>
                </article>
                <article class="card" id="card4">
                    <h3><span class="icon fa fa-envira"></span> 存在的不足</h3>
                    <p>

                        由于做大作业的过程中，同时要准备多门考试的复习，所以只能采用每天抽出一点时间的方法来做，做了一些重复的工作。<br>
                        对于一些扩展的模块，还有待完善，以使其更加健壮。

                    </p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </article>
            </div>
        </div>
    </div>
</div>

<footer role="contentinfo">
    <ul class="social">
        <li><a href="#" title="QQ"><span class="icon fa fa-qq"></span></a></li>
        <li><a href="#" title="微信"><span class="icon fa fa-weixin"></span></a></li>
        <li><a href="#" title="微博"><span class="icon fa fa-weibo"></span></a></li>
        <li><a href="#" title="Github"><span class="icon fa fa-github-alt"></span></a></li>
    </ul>
    <div class="copy">
        <p>CopyRight &copy 2017 瞎写的，没有版权</p>
        <p>西北工业大学</p>
    </div>
</footer>
<div class="modal fade" id="aboutModal"><!-- "关于"模态框 -->
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">关于此交易系统</h4>
            </div>
            <div class="modal-body">
                <p>这是我们的web大作业&hellip;</p>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
                <button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-3.1.0.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>