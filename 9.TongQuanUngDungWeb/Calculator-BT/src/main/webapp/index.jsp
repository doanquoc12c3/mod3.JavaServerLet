<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 02/03/2022
  Time: 09:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <form action="/calculate" method="post">
    <p>Product Description</p>
    <input type="text" name = 'productDescription' >
    <p>List Price</p>
    <input type="number" name="listPrice">
    <p>Discount Percent</p>
    <input type="number" name = "discountPercent">
    <button type="submit">Calculate</button>
  </form>
  </body>
</html>
