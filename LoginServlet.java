import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection con = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/userdbs1", "app", "app"
            );

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM USERS WHERE EMAIL=? AND PASSWORD=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String role = rs.getString("ROLE");

                HttpSession session = request.getSession();
                session.setAttribute("username", rs.getString("USERNAME"));
                session.setAttribute("userId", rs.getInt("ID"));

                if (role != null && role.equalsIgnoreCase("admin")) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }

            } else {
                response.sendRedirect("login.jsp?error=Invalid Email or Password");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>ERROR: " + e.getMessage() + "</h2>");
        }
    }
}