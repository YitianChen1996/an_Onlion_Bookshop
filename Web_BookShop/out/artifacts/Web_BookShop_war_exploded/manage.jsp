<%@ page import="Database.MySQLDatabase" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%! String currentstudentID; %>
<%
	if (session.getAttribute("studentID")!=null) {
	    currentstudentID=(String) session.getAttribute("studentID");
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<title>ARC校园旧书交易系统</title>
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
<body id="managepage">
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
                        <li>
                        	<a href="index.jsp"><span class="icon fa fa-home"></span> 首页</a>
                        </li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span class="icon fa fa-group"></span> 
								团队
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Paradox</a></li>
								<li><a href="#">Cherrywind</a></li>
							</ul>
						</li>
                        <li><a href="function.jsp"><span class="icon fa fa-envira"></span> 功能</a></li>
                        <li class="active"><a href="manage.jsp"><span class="icon fa fa-wrench"></span> 管理</a></li>
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

		<!-- 自适应布局 -->
<div class="container-fluid">
<div class="row">
<!-- 左侧导航栏 -->
<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-pills nav-stacked" role="tablist" id="manageTabList">
		<!-- <li role="presentation" class="active"><a href="#myhome" role="tab" data-toggle="tab"><span class="icon fa fa-home"></span> 我的首页</a></li> -->
		<li role="presentation" class="active" id="shoppingActive"><a href="#shopping-cart" role="tab" data-toggle="tab"><span class="icon fa fa-shopping-cart"></span> 购物车</a></li>
		<%--<li role="presentation" id="userprofile"><a href="#profile" role="tab" data-toggle="tab"><span class="icon fa fa-mortar-board"></span> 个人资料</a></li>--%>
		<li role="presentation"><a href="#uploadhistory" role="tab" data-toggle="tab"><span class="icon fa fa-wrench"></span> 我发布的</a></li>
		<li role="presentation"><a href="#upload" role="tab" data-toggle="tab" id="uploadtabID"><span class="icon fa fa-cloud-upload"></span> 发布新书</a></li>
		<%--<li role="presentation"><a href="#myorder" role="tab" data-toggle="tab"><span class="icon fa fa-bell"></span> 我的订单</a></li>--%>
		<%--<li role="presentation"><a href="#settings" role="tab" data-toggle="tab"><span class="icon fa fa-wrench"></span> 设置</a></li>--%>
		<%--<li role="presentation"><a href="#" role="tab" data-toggle="tab"><span class="icon fa fa-history"></span> 购书足迹</a></li>--%>
		<%--<li role="presentation"><a href="#" role="tab" data-toggle="tab"><span class="icon fa fa-comments"></span> 我的书评</a></li>--%>
	</ul>
</div>
<!-- 右侧管理控制台 -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- <h1 class="page-header">管理控制台</h1> -->
	<div class="tab-content">
		<!-- <div role="tabpanel" class="tab-pane active" id="myhome">
			<div class="row">
				<div class="col-md-4">
					<div>
						<img src="img/zcrPortrait.png" alt="">
					</div>
				</div>
				<div class="col-md-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Panel title</h3>
						</div>
						<div class="panel-body">
							Panel content
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div role="tabpanel" class="tab-pane active" id="shopping-cart">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">我的购物车</h3>
				</div>
				<div class="panel-body">
					<table class="table table-striped">
						<thead>
						<tr>
						<th>书籍封面</th>
						<th>作者</th>
						<th>卖书者</th>
						<th>价格</th>
						</tr>
						</thead>
						<tbody>

						<%
							MySQLDatabase mySQLDatabase=new MySQLDatabase();
							mySQLDatabase.Query("select pictureURL,author,username,price \n" +
									"from shoppingcart as s inner join tbl_book as b inner join user as u\n" +
									"on s.bookname=b.bookname and s.ownerID=\""+currentstudentID+"\" and u.studentID=b.ownerID");
							ResultSet resultSet=mySQLDatabase.getResultSet();
							try {
								while(resultSet.next()){
                                    String pictureURL=resultSet.getString("pictureURL");
                                    String author=resultSet.getString("author");
                                    String username=resultSet.getString("username");
                                    double price=resultSet.getDouble("price");
                                    out.println("<tr>\n" +
                                            "\t\t\t\t\t\t<td><a href=\"#\"><img src=\""+pictureURL+"\" alt=\"sample product\" /></a></td>\n" +
                                            "\t\t\t\t\t\t<td>"+author+"</td>\n" +
                                            "\t\t\t\t\t\t<td>"+username+"</td>\n" +
                                            "\t\t\t\t\t\t<td>"+price+"</td>\n" +
                                            "\t\t\t\t\t\t</tr>");
                                }
							} catch (SQLException e) {
								e.printStackTrace();
							}
							mySQLDatabase.FreeDatabase();
						%>

						<%--<tr>--%>
						<%--<td><a href="#"><img src="img/books/machineLearning.jpg" alt="sample product" /></a></td>--%>
						<%--<td>Apple Macbook air</td>--%>
						<%--<td>Apple</td>--%>
						<%--<td>80</td>--%>
						<%--</tr>--%>

						<%--<tr>--%>
						<%--<td><a href="#"><img src="img/books/CPrimerPlus.jpg" alt="sample product" /></a></td>--%>
						<%--<td>Apple iPad air</td>--%>
						<%--<td>匿名用户</td>--%>
						<%--<td>60</td>--%>
						<%--<td>文学</td>--%>
						<%--</tr>--%>
						<%--<tr>--%>
						<%--<td><a href="#"><img src="img/books/beautyofcoding.jpg" alt="sample product" /></a></td>--%>
						<%--<td>Apple Macbook pro</td>--%>
						<%--<td>Huper</td>--%>
						<%--<td>50</td>--%>
						<%--<td>玄学</td>--%>
						<%--</tr>--%>
						</tbody>
					</table>
					<p class="pull-right"><a onclick="openpayment()" class="btn btn-primary" href="#" role="button">结算</a></p>
					<script>
                        function openpayment() {
                            window.open("pay.html", "newwindow","height=520, width=520, top=200,left=500,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no,status=no")
                        }
					</script>
				</div>
			</div>
		</div>
		<%--<div role="tabpanel" class="tab-pane" id="profile">--%>
		<%--<!-- <a name="#anchor-profile"></a> -->--%>
			<%--<div class="row">--%>
				<%--<div class="col-md-3">--%>
					<%--<div>--%>
						<%--<img src="img/zcrPortrait.png" alt="">--%>
					<%--</div>--%>
					<%--<br>--%>
					<%--<div class="panel panel-default">--%>
						<%--<div class="panel-heading">--%>
							<%--<h3 class="panel-title">我的资料卡</h3>--%>
						<%--</div>--%>
						<%--<div class="panel-body">--%>
							<%--<p>姓名: </p>--%>
							<%--<p>昵称: </p>--%>
							<%--<p>学院: </p>--%>
							<%--<p>活跃等级: <span class="icon fa fa-star"></span><span class="icon fa fa-star"></span><span class="icon fa fa-star-half-o"></span></p>--%>
							<%--<p><span class="icon fa fa-map-marker"></span> 中国</p>--%>
							<%--<p><span class="icon fa fa-clock-o"></span> 2016,July 12</p>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="col-md-9">--%>
					<%--<div class="panel panel-default" id="myprofile">--%>
						<%--<div class="panel-heading">--%>
							<%--<h3 class="panel-title">我的资料卡</h3>--%>
						<%--</div>--%>
						<%--<div class="panel-body">--%>
							<%--<ul class="list-group">--%>
								<%--<li class="list-group-item">--%>
									<%--姓名:--%>
								<%--</li>--%>
								<%--<li class="list-group-item">--%>
									<%--学院:--%>
								<%--</li>--%>
								<%--<li class="list-group-item">--%>
									<%--性别: <span class="icon fa fa-male"></span>--%>
								<%--</li>--%>
								<%--<li class="list-group-item">累计买书量: 5</li>--%>
								<%--<li class="list-group-item">QQ: 666</li>--%>
								<%--<li class="list-group-item">微信: 777</li>--%>
								<%--<li class="list-group-item">--%>
									<%--<h4>个人简介</h4>--%>
									<%--<p>--%>
										<%--1992年的巴塞罗那奥运会，被冠以“梦之队”美名的美国男篮横空出世，这支拥有“乔丹、伯德、约翰逊、巴克利……”等11位篮球名人堂级球员的传奇之师，留下了每场平均赢44 分、最少一场赢32 分的非凡纪录。由梦之队随队记者杰克·麦卡勒姆撰写，乔丹、“魔术师”等人自述的梦之队集体传记《梦之队》，将为我们深度解密这支伟大之师。梦之队有多么伟大？--%>
									<%--</p>--%>
								<%--</li>--%>
							<%--</ul>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</div>--%>

		<div role="tabpanel" class="tab-pane" id="upload">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">发布新书</h3>
				</div>
				<div class="panel-body">
					<div class="panel panel-default">
						<!-- <div class="panel-heading">
							<h3 class="panel-title">编程之美</h3>
						</div> -->

						<%
							currentstudentID=(String) session.getAttribute("studentID");
							request.setAttribute("ownerID",currentstudentID);
						%>
						<form action="http://localhost:8080/index/fileUploadServlet" accept-charset="UTF-8" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">书名</span>
									<input type="text" class="form-control" name="bookname">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">作者</span>
									<input type="text" class="form-control" name="author">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">出版社</span>
									<input type="text" class="form-control" name="publisher">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">售价</span>
									<input type="text" class="form-control" name="price">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">简评</span>
									<input type="textarea" class="form-control" name="comment">
								</div>
							</div>


								<label class="control-file">浏览</label>
								<div class="form-group">
								<input type="file" class="file addimage" name="bookcover">
							</div>

							<button value="提交" type="submit" class="btn btn-primary" id="uploadsubmit">提交</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="uploadhistory">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">我发布的</h3>
				</div>
				<div class="panel-body">
					<table class="table table-striped">
						<thead>
						<tr>
						<th>书名</th>
						<th>作者</th>
						<th>出版社</th>
						<th>报价</th>
						<th></th>
						</tr>
						</thead>
						<tbody>

						<%
							mySQLDatabase=new MySQLDatabase();
							mySQLDatabase.Query("select * from tbl_book where " +
									"(ownerID=\""+currentstudentID+"\")");
							resultSet=mySQLDatabase.getResultSet();
							try {
								while(resultSet.next()){
                                    out.println("<tr>\n" +
                                            "\t\t\t\t\t\t<td>"+resultSet.getString("bookname")+"</td>\n" +
                                            "\t\t\t\t\t\t<td>"+resultSet.getString("author")+"</td>\n" +
                                            "\t\t\t\t\t\t<td>"+resultSet.getString("publisher")+"</td>\n" +
                                            "\t\t\t\t\t\t<td>"+resultSet.getDouble("price")+"</td>\n" +
											"<td><a href=\"process_remove_book.jsp?"+"ownerID="+currentstudentID+
											"&bookname="+resultSet.getString("bookname")+"\">移除</a></td>"+
                                            "\t\t\t\t\t\t</tr>");
                                }
							} catch (SQLException e) {
								e.printStackTrace();
							}
							mySQLDatabase.FreeDatabase();
						%>


						<%--<tr>--%>
						<%--<td>《浪潮之巅》</td>--%>
						<%--<td>Apple Macbook air</td>--%>
						<%--<td>Apple</td>--%>
						<%--<td>80</td>--%>
						<%--<td><a href="process_remove_book.jsp+?ownerID=">移除</a></td>--%>
						<%--</tr>--%>
						<%--<tr>--%>
						<%--<td>《数学之美》</td>--%>
						<%--<td>Apple iPad air</td>--%>
						<%--<td>匿名用户</td>--%>
						<%--<td>60</td>--%>
						<%--<td><a href="">移除</a></td>--%>
						<%--</tr>--%>
						<%--<tr>--%>
						<%--<td>《编程珠玑》</td>--%>
						<%--<td>Apple Macbook pro</td>--%>
						<%--<td>Huper</td>--%>
						<%--<td>50</td>--%>
						<%--<td><a href="">移除</a></td>--%>
						<%--</tr>--%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%--<div role="tabpanel" class="tab-pane" id="myorder">--%>
			<%--<div class="panel panel-default">--%>
				<%--<div class="panel-heading">--%>
					<%--<h3 class="panel-title">我的订单</h3>--%>
				<%--</div>--%>
				<%--<div class="panel-body">--%>
					<%--<table class="table table-striped">--%>
						<%--<thead>--%>
						<%--<tr>--%>
						<%--<th>书名</th>--%>
						<%--<th>作者</th>--%>
						<%--<th>卖书人</th>--%>
						<%--<!-- <th>出版社</th> -->--%>
						<%--<th>报价</th>--%>
						<%--<th>类别</th>--%>
						<%--<th>动作</th>--%>
						<%--<th>动作</th>--%>
						<%--</tr>--%>
						<%--</thead>--%>
						<%--<tbody>--%>
						<%--<tr>--%>
						<%--<td>《浪潮之巅》</td>--%>
						<%--<td>Apple Macbook air</td>--%>
						<%--<td>Apple</td>--%>
						<%--<td>80</td>--%>
						<%--<td>计算机</td>--%>
						<%--<td>--%>
							<%--<input type="submit" class="btn btn-success" value="确认订单">--%>
						<%--</td>--%>
							<%----%>
						<%--<td><input type="submit" class="btn btn-warning" value="取消订单"></td>--%>
						<%--</tr>--%>
						<%--<tr>--%>
						<%--<td>《数学之美》</td>--%>
						<%--<td>Apple iPad air</td>--%>
						<%--<td>匿名用户</td>--%>
						<%--<td>60</td>--%>
						<%--<td>文学</td>--%>
						<%--</tr>--%>
						<%--<tr>--%>
						<%--<td>《编程珠玑》</td>--%>
						<%--<td>Apple Macbook pro</td>--%>
						<%--<td>Huper</td>--%>
						<%--<td>50</td>--%>
						<%--<td>玄学</td>--%>
						<%--</tr>--%>
						<%--</tbody>--%>
					<%--</table>--%>
					<%--<p class="pull-right"><a class="btn btn-primary" href="#" role="button">查看详细&raquo;</a></p>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</div>--%>
	</div>
</div>
</div>
</div>
		<div id="overlay">
			<!-- 空 -->
		</div>
		<div id="overlay-sidebar">
			<div class="portrait"><!-- 头像 -->
				<img src="img/zcrPortrait.png" alt="晨风睿思头像">
			</div>
			<ul>
				<li><a href="#myprofile"></span><span class="icon fa fa-mortar-board"></span> 我的资料</a></li>
				<li><a href=""></span><span class="icon fa fa-shopping-cart"></span> 购物车</a></li>
				<li><a href=""></span><span class="icon fa fa-bell"></span> 待办事项</a></li>
				<li><a href=""></span><span class="icon fa fa-history"></span> 购书历史</a></li>
				<li><a href=""></span><span class="icon fa fa-comments"></span> 我的书评</a></li>
			</ul>
		</div>

		<div class="modal fade" id="aboutModal"><!-- "关于"模态框 -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">关于此交易系统</h4>
					</div>
					<div class="modal-body">
						<p>
							这是我大作业&hellip;<br>
							在这么密集的考试下完成这个大作业orz
						</p>
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
		<script src="js/zcrMain.js"></script>
</body>
</html>
<%}else{
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    response.sendRedirect(basePath+"login.jsp");
	}
%>


