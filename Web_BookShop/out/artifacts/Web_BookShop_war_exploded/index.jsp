<%@ page import="Database.MySQLDatabase" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<title>西工大校园旧书交易系统</title>
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
<body id="homepage">
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation"><!-- 顶部导航条 -->
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp">
						<img alt="Brand" src="img/catlogo.png" width="111px">
					</a>
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- <a class="navbar-brand" hrindex.jsphtml">DB Project</a> -->
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                        	<a href="index.jsp"><span class="icon fa fa-home"></span> 首页</a>
                        </li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span class="icon fa fa-group"></span> 
								团队
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">2014302637-陈绎天</a></li>
								<li><a href="#">2014302638-胡博</a></li>
							</ul>
						</li>
                        <li><a href="function.jsp"><span class="icon fa fa-envira"></span> 功能</a></li>
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

                        	<!-- <a href="#" class="register">注册</a> -->
                        </li>
                        <!-- <li>
                        	<div class="portrait">
								<img src="img/zcrPortrait.png" alt="晨风睿思头像">
							</div>
                        </li> -->
                    </ul>
                </div>
			</div>
	</nav><!-- 顶部导航条 -->

		<main role="main">
			<div class="container">
				
				<!-- 面包屑导航 -->
				<ul class="breadcrumb">
					<li><a href="#">首页</a></li>
				</ul>

				<div class="page-header">
					<h1><span class="icon fa fa-paper-plane"></span> 西工大校园旧书交易系统<small> NPUer</small></h1>
				</div>
				<div class="row"><!-- .row -->
					<div class="grid-options col-sm-3"><!-- 左侧分类栏 -->
						<!-- <h2 class="clearfix">从下面的分类中选择
							<button type="button"
							class="options-panel-toggle btn btn-primary pull-right" data-toggle="collapse" data-target="#options-panel">
							<span class="icon fa fa-cog fa-2x"></span>
							</button>
						</h2> -->
						<!-- <div id="options-panel" class="options-panel collapse"> -->
							<a href="#" class="btn choose-clearance">
								<span class="icon fa fa-tag fa-3x"></span>
								<h3>ARC On Sale</h3>
								<p>我们将思索汇聚指尖<br>与你在云端相遇</p>
							</a>
							<div class="panel panel-default">
								<div class="panel-heading">公告</div>
								<div class="panel-body">
									书籍是人类进步的阶梯
								</div>
							</div>
						<!-- </div> -->
							
							<div class="panel panel-default">
								<div class="panel-heading">
								<h3 class="panel-title">Database Powered</h3>
								</div>
							<div class="panel-body">
								学好网络编程
							</div>
							</div>

						<div class="panel panel-default">
							<div class="panel-body">
							Keep calm,and go to study.
							</div>
						<div class="panel-footer">希望该系统对大家有所帮助</div>
						</div>
					</div><!-- 左侧分类栏 -->
					<div class="products-grid col-sm-9"><!-- 书籍展示区 -->
						<div class="row">
							<%
								MySQLDatabase mySQLDatabase=new MySQLDatabase();
								mySQLDatabase.Query("select * from tbl_book");
								ResultSet resultSet=mySQLDatabase.getResultSet();
								try {
									while(resultSet.next()){
                                        String bookname=resultSet.getString("bookname");
                                        String author=resultSet.getString("author");
                                        String publisher=resultSet.getString("publisher");
                                        String price=String.valueOf(resultSet.getDouble("price"));
                                        String pictureURL=resultSet.getString("pictureURL");
                                        String args="?bookname="+bookname;
                                        String html="<div class=\"product-item col-xs-6 col-md-4\">\n" +
												"\t        \t\t\t\t\t<p href=\"#\"><img src=\""+pictureURL+"\" alt=\"sample product\" /></p>\n" +
												"\t\t\t\t\t            <h4><p href=\"#\">"+bookname+"</p></h4>\n" +
												"\t\t\t\t\t            <p>"+"作者："+author+"</p>\n" +
												"\t\t\t\t\t            <p>\n" +
												"\t\t\t\t\t            \t"+"出版社："+publisher+"\n" +
												"\t\t\t\t\t            </p>\n" +
												"\t\t\t\t\t\t\t\t<p>价格："+price+"</p>\n" +
												"\t\t\t\t\t            <a class=\"btn btn-primary btn-xs pull-right\" href=\"detailInfo.jsp"+args+"\">查看详细资料 <i class=\"fa fa-arrow-circle-right\"></i></a>\n" +
												"        \t\t\t\t\t</div>";
                                        out.println(html);
                                        //TODO
                                    }
								} catch (SQLException e) {
									e.printStackTrace();
								}
								mySQLDatabase.FreeDatabase();
							%>


							<%--<div class="product-item col-xs-6 col-md-4">--%>
	        					<%--<a href="#"><img src="img/books/machineLearning.jpg" alt="sample product" /></a>--%>
					            <%--<h3><a href="#">机器学习</a> <span class="icon fa fa-star"></span><span class="icon fa fa-star"></span></h3>--%>
					            <%--<p>作者：晨风睿思</p>--%>
					            <%--<p>--%>
					            	<%--This text describes the above product a little not too much but just enough or maybe a little more--%>
					            <%--</p>--%>
								<%--<p>价格：</p>--%>
					            <%--<a class="btn btn-primary btn-xs pull-right" href="detailInfo.jsp">查看详细资料 <i class="fa fa-arrow-circle-right"></i></a>--%>
        					<%--</div>--%>
						</div>
					</div><!-- 书籍展示区 -->
				</div><!-- .row -->
			</div><!-- .container -->
		</main>

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
						<p>这是我们的网络编程大作业&hellip;</p>
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

