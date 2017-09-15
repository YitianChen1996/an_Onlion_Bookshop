<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
        <%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
            String bootstraploc=basePath+"css/bootstrap.css";
            String __zcrMainloc=basePath+"css/__zcrMain.css";
            String zcrMainloc=basePath+"css/zcrMain.css";

        %>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录</title>
		<link rel="icon" href="img/yumaoicon.png">

		<!-- Bootstrap -->
		<link href=<%= bootstraploc%> rel="stylesheet">
		<link href=<%= __zcrMainloc%> rel="stylesheet"><!-- 自定义less文件编译之后生成的css文件 -->
		<link href=<%= zcrMainloc%> rel="stylesheet"><!-- zcr写CSS的地方 -->

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.min.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
	<body id="login-page">
	<div class="container main">
    <div class="col-md-6 col-md-offset-3">
        <h2 class="text-center"><span class="icon fa fa-paper-plane"></span>欢迎登录</h2>

        <form id="login-form" action="process_login.jsp" accept-charset="UTF-8">
            <div class="form-group">
                <label for="username"><span class="icon fa fa-leaf"></span> 学号</label>
                <input type="text" class="form-control input-lg" id="username" name="username" maxlength="30"
                       data-error="请填写学号" placeholder="学号" autofocus required autocomplete="off">

                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label for="password"><span class="icon fa fa-lock"></span> 密码</label>
                <input type="password" class="form-control input-lg" id="password" name="password" maxlength="30"
                       data-error="请填写密码" placeholder="密码" required autocomplete="off">

                <div class="help-block with-errors"></div>
            </div>
            <!-- <div class="form-group" id="tfa-area">
                <label for="captcha">两步验证</label>
               <input type="text" class="form-control input-lg" id="tfa-code" name="tfa-code"
                      placeholder="两步验证验证码" maxlength="6" data-error="请填写两步验证验证码" required autocomplete="off">
                <div class="help-block with-errors"></div>
            </div> -->
			<!--<div class="form-group">-->
			    <!--<label for="captcha"><span class="icon fa fa-tag"></span> 验证码</label>-->
			    <!--&nbsp;&nbsp;<img src="/captcha/" id="captcha-img"><small><p></p></small>-->
			    <!--<input type="text" class="form-control input-lg" id="captcha" name="captcha" placeholder="验证码" maxlength="4" data-error="请填写验证码" required>-->
			    <!--<div class="help-block with-errors"></div>-->
			<!--</div>-->
			<div class="form-group">
                <button type="submit" class="btn btn-primary pull-right">提交</button>
            </div>
            <!-- <a href="/reset_password/">忘记用户名/密码</a><br> -->
            <a href="register.html">还没有帐号?点击注册</a><br>
            <a href="index.jsp">返回首页</a>
            <%
                if (request.getAttribute("errCode")!=null) {
                    if ((Integer)(request.getAttribute("errCode"))==1){
                        out.println("<h3>此学号还未注册</h3>");
                    }else if ((Integer)(request.getAttribute("errCode"))==2){
                        out.println("<h3>密码错误</h3>");
                    }
                }
            %>

        </form>
    </div>
</div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-3.1.0.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
