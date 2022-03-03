import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.Double.parseDouble;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         Double firstNumber = parseDouble(request.getParameter("firstNumber"));
         Double secondNumber = parseDouble(request.getParameter("secondNumber"));

         Double result=null;

         String operator = request.getParameter("operators");
         switch (operator){
             case "+":
                 result = firstNumber+secondNumber;
                 break;
             case "-":
                 result = firstNumber-secondNumber;
                 break;
             case "*":
                 result = firstNumber*secondNumber;
                 break;
             case "/":
                 result = firstNumber/secondNumber;
                 break;
         };
         PrintWriter out = response.getWriter();

         out.println("<html>");
         out.println("Result:"+ result);
         out.println("</html>");






    }
}
