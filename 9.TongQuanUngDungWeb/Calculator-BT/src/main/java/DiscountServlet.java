import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


import static java.lang.Float.parseFloat;


@WebServlet(name = "DiscountServlet",  urlPatterns = "/calculate")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float productPrice = parseFloat(request.getParameter("listPrice"));
        String productDescription = request.getParameter("productDescription");
        float discountPercent = parseFloat(request.getParameter("discountPercent"));
        float discountAmount = discountPercent * productPrice/100;

        PrintWriter writer = response.getWriter();

        writer.println("Product: "+ productDescription);
        writer.println("Discount Amount: "+ discountAmount);


    }
}
