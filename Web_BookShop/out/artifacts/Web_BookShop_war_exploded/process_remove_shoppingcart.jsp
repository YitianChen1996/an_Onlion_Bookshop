<%@ page import="Database.MySQLDatabase" %><%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-20
  Time: 下午11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentID=request.getParameter("studentID");
    String bookname=request.getParameter("bookname");
    MySQLDatabase mySQLDatabase=new MySQLDatabase();
    mySQLDatabase.delete_from_shoppingcart(studentID,bookname);
    mySQLDatabase.FreeDatabase();
    response.sendRedirect("detailInfo.jsp?bookname="+java.net.URLEncoder.encode(bookname,"utf-8"));
%>
