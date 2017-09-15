<%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-12
  Time: 下午3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="Database.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String studentID = request.getParameter("studentID");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
//    System.out.println(studentID);
//    System.out.println(username);
//    System.out.println(email);
//    System.out.println(password);
    MySQLDatabase mySQLDatabase = new MySQLDatabase();
    mySQLDatabase.insert_tbl_User(studentID, password, username, email);
    mySQLDatabase.FreeDatabase();
    response.sendRedirect(basePath + "login.jsp");
%>