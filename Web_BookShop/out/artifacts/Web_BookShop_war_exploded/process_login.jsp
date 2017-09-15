<%@ page import="Database.MySQLDatabase" %>
<%@ page import="javafx.scene.control.Alert" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-12
  Time: 下午7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    MySQLDatabase mySQLDatabase=new MySQLDatabase();
    mySQLDatabase.Query("select * from user where (studentID="+ "\"" + username+ "\""+ ")");
    boolean b=false;
    try {
        b=mySQLDatabase.getResultSet().next();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if (!b){
        request.setAttribute("errCode",1);//未找到学号
        pageContext.forward("/login.jsp");
//        response.sendRedirect(basePath+"/login.jsp");
    }else{
        try {
            b=password.equals(mySQLDatabase.getResultSet().getString("password"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (b){
            try {
                session.setAttribute("studentID",mySQLDatabase.getResultSet().getString("studentID"));
                session.setAttribute("username",mySQLDatabase.getResultSet().getString("username"));
                session.setAttribute("email",mySQLDatabase.getResultSet().getString("emailaddr"));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect(basePath+"index.jsp");
        }else{
            request.setAttribute("errCode",2);//
            pageContext.forward("/login.jsp");
//            response.sendRedirect(basePath+"/login.jsp");
        }
    }
    mySQLDatabase.FreeDatabase();
%>
