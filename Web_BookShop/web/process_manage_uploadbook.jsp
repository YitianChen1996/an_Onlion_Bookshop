<%@ page import="Database.*" %><%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-17
  Time: 下午1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String bookname=request.getParameter("bookname");
    String author=request.getParameter("author");
    String ownerID=(String) session.getAttribute("studentID");
    String publisher=request.getParameter("publisher");
    double price=Double.valueOf(request.getParameter("price"));
    String comment=request.getParameter("comment");

    

    MySQLDatabase mySQLDatabase=new MySQLDatabase();
    mySQLDatabase.insert_tbl_book(bookname,author,ownerID,publisher,price,comment,
            "http://localhost:8080/index/imgs/imgsb.png");
mySQLDatabase.FreeDatabase();
response.sendRedirect("manage.jsp");
%>