<%@ page import="java.util.SplittableRandom" %>
<%@ page import="Database.MySQLDatabase" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.awt.*" %><%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-20
  Time: 下午4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean alreadyInShoppingcart=false;
    String studentID=request.getParameter("studentID");
    String bookname=request.getParameter("bookname");
    System.out.println(studentID);
    System.out.println(bookname);
    MySQLDatabase mySQLDatabase=new MySQLDatabase();
    mySQLDatabase.insert_tbl_shoppingcart(studentID,bookname);
    mySQLDatabase.FreeDatabase();
    response.sendRedirect("detailInfo.jsp?bookname="+java.net.URLEncoder.encode(bookname,"utf-8"));
%>
