<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codegym.User" %><%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 28/02/2022
  Time: 09:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Hien Thị Danh Sách Khach Hàng</title>
  <style>
    h1{
      text-align: center;
    }
    table{
      margin-left:auto;
      margin-right: auto;
      border: solid 1px black;
      text-align: center;

    }
    td{
      width:150px;
      height:150px;
      border: solid 1px black;
    }
  </style>
</head>
<body>
<%
  List<User> userList = new ArrayList<>();
  userList.add(new User("quoc","10-10-98","ha noi","/img/new.png"));
  userList.add(new User("quoc","10-10-98","ha noi","/img/new.png"));
  userList.add(new User("quoc","10-10-98","ha noi","/img/new.png"));
  pageContext.setAttribute("userList",userList);
%>
<h1>Hiển Thị DS Khách Hàng</h1>
<table>
  <tr>
  <td>Tên</td>
  <td>Ngày sinh</td>
  <td>Địa chỉ</td>
  <td>Ảnh</td>
  </tr>
  <c:forEach var="user" items="${userList}">
    <tr>
      <td>${user.name}</td>
      <td>${user.birthday}</td>
      <td>${user.address}</td>
      <td><img src="${user.img}"width=100 height=100></td>
    </tr>
  </c:forEach>


</table>
</body>
</html>

