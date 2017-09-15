<%--
  Created by IntelliJ IDEA.
  User: chenyitian
  Date: 17-5-13
  Time: 上午11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%

    session.invalidate();
    response.sendRedirect("index.jsp");
%>
