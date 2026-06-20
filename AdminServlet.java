import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("adminPassword");

        if("admin123".equals(password)){

            HttpSession session = request.getSession();
            session.setAttribute("admin", "true");

            response.sendRedirect("adminDetails.jsp");

        } else {
            response.sendRedirect("adminLogin.jsp?error=1");
        }
    }
}