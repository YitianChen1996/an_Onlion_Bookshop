<%@ page import="Database.MySQLDatabase" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Utilities.Utilities" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!-- 书籍详细信息页 -->
<%!
	String bookname,author,publisher,comment,ownerID,ownerName,ownerEmail,studentID,pictureURL;
	double price;
	MySQLDatabase mySQLDatabase;
%>
<%
	bookname=request.getParameter("bookname");
	mySQLDatabase=new MySQLDatabase();
	mySQLDatabase.Query("SELECT * FROM tbl_book where " +
			"bookname=\""+bookname+"\"");
	ResultSet resultSet=mySQLDatabase.getResultSet();
	try {
	    while(resultSet.next()){
			author=resultSet.getString("author");
			publisher=resultSet.getString("publisher");
			comment=resultSet.getString("comment");
			price=resultSet.getDouble("price");
			ownerID=resultSet.getString("ownerID");
			pictureURL=resultSet.getString("pictureURL");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	mySQLDatabase.Query("SELECT * FROM user where " +
			"studentID=\""+ownerID+"\"");
	resultSet=mySQLDatabase.getResultSet();
	try {
	    while(resultSet.next()){
			ownerName=resultSet.getString("username");
			ownerEmail=resultSet.getString("emailaddr");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	mySQLDatabase.FreeDatabase();
%>

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
<body id="detailInfoPage">
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
								    studentID=(String) session.getAttribute("studentID");
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

		<main role="main">
			<div class="container">
				
				<!-- 面包屑导航 -->
				<ul class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li class="active">书籍详细信息</a></li>
				</ul>

				<div class="bookdetails">
					<div class="row">
						<div class="col-md-4">
							<div class="book">
								<img src="<%=pictureURL%>" alt="sample product" />
							</div>

							<table id="buy-or-add">
								<!-- <th><button type="button" class="btn btn-primary pull-right" data-dismiss="modal" id="buybutton" href="www.baidu.com">立即购买 <span class="icon fa fa-arrow-circle-right"></span></button></th>
								<th><button type="button" class="btn btn-primary  pull-right" data-dismiss="modal">加入购物车 <span class="icon fa fa-arrow-circle-right"></span></button></th> -->
								<%if (session.getAttribute("studentID")!=null){%>
								<th>
									<a onclick="openpayment()" href="#" class="btn btn-primary pull-right">立即购买 <span class="icon fa fa-arrow-circle-right"></span></a>
								</th>

								<script>
                                    function openpayment() {
                                        window.open("pay.html", "newwindow","height=520, width=520, top=200,left=500,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no,status=no")
                                    }
								</script>

								<th>
									<% String addto_shoppingcart="process_addto_shoppingcart.jsp?studentID="+studentID+"&bookname="+bookname; %>
									<% String deletefrom_shoppintcart="process_remove_shoppingcart.jsp?studentID="+studentID+"&bookname="+bookname; %>
									<%
										if (!Utilities.alreadyInShoppingcart(studentID,bookname)){%>
										    <a href=<%= addto_shoppingcart%> data-toggle="modal" class="btn btn-primary">加入购物车 <span class="icon fa fa-arrow-circle-right"></span></a>
										<%}else{%>
									<a href=<%= deletefrom_shoppintcart%> data-toggle="modal" class="btn btn-primary">从购物车中移除 <span class="icon fa fa-arrow-circle-right"></span></a>
									<%}%>
								</th>
								<%}else{%>
								<th>登录以后才能购买哦</th>
								<%}%>
							</table><!-- <input type="button" value="提交" class="btn btn-primary"> -->
						</div>
						<div class="col-md-8">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title"><%= bookname%></h3>
								</div>
								<div class="panel-body">
									<ul class="list-group">
										<li class="list-group-item">
											作者: <%= author%>
										</li>
										<li class="list-group-item">
											出版社: <%= publisher%>
										</li>
										<li class="list-group-item">售价: <%= price%></li>
										<li class="list-group-item">卖家：<%= ownerName%>&nbsp&nbsp&nbsp邮箱：<%= ownerEmail%></li>
										<li class="list-group-item">
											<h4>描述</h4>
											<p>
												<%= comment%>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

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
        		<p>CopyRight &copy 2016</p>
        		<p>西北工业大学 ARC</p>
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
		
		<%--<div class="modal fade" id="buyit"><!-- "关于"模态框 -->--%>
			<%--<div class="modal-dialog">--%>
				<%--<div class="modal-content">--%>
					<%--<div class="modal-header">--%>
						<%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
						<%--<h4 class="modal-title">下单成功！</h4>--%>
					<%--</div>--%>
					<%--<div class="modal-body">--%>
						<%--<p>您想要的书已被成功锁定，请尽快联系卖书的同学~</p>--%>
					<%--</div>--%>
					<%--<div class="modal-footer">--%>
						<%--<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->--%>
						<%--<button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>--%>
					<%--</div>--%>
				<%--</div><!-- /.modal-content -->--%>
			<%--</div><!-- /.modal-dialog -->--%>
		<%--</div><!-- /.modal -->--%>

		<div class="modal fade" id="addit_toshoppingcart"><!-- "关于"模态框 -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">成功加入购物车！</h4>
					</div>
					<div class="modal-body">
						<p>您想要的书已经加入购物车，您可以继续浏览其他书籍:-)</p>
					</div>
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
						<button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
						<!-- <a href="" class="btn btn-primary" data-dismiss="modal">我知道了</a> -->
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

