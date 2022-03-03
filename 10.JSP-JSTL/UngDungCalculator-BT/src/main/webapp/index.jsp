<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 28/02/2022
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Calculator</title>

  </head>
  <body>
  <form method="post" action="/CalculatorServlet" >
          <h4>Calculator</h4>
    <table border="1">
      <tr>
        <td>First Operand</td>
        <td><input type="text" name="firstNumber"></td>
      </tr>
      <tr>
        <td>Operator</td>
        <td><select name="operators" id="">
          <option value="+">+</option>
          <option value="-">-</option>
          <option value="*">x</option>
          <option value="/">/</option>
        </select></td>
      </tr>
      <tr>
        <td>Second Operand</td>
        <td><input type="text" name="secondNumber"></td>
      </tr>
      <tr>
        <td></td>
        <td><button>Calculate</button></td>
      </tr>
    </table>

  </form>
  </body>
</html>
