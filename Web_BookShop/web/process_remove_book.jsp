<%@ page import="Database.MySQLDatabase" %><%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-20
  Time: 下午3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ownerID=request.getParameter("ownerID");
    String bookname=request.getParameter("bookname");
    System.out.println(ownerID);
    System.out.println(bookname);
    MySQLDatabase mySQLDatabase=new MySQLDatabase();
    mySQLDatabase.excuteSQL("delete from tbl_book where (" +
            "bookname=\""+bookname+"\" and " +
            "ownerID=\""+ownerID+"\")");
    mySQLDatabase.FreeDatabase();
    response.sendRedirect("manage.jsp");
%>
