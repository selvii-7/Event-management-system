import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            // 🔗 Load Driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection con = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/userdbs1", "app", "app"
            );

            // 🔥 STEP 1: Generate ID manually
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT MAX(ID) FROM USERS");

            int newId = 1;
            if (rs.next()) {
                newId = rs.getInt(1) + 1;
            }

            // 🔥 STEP 2: Insert user with ID
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO USERS VALUES (?, ?, ?, ?, ?)"
            );

            ps.setInt(1, newId);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, role);

            ps.executeUpdate();

            // ✅ Redirect to login page
            response.sendRedirect("login.jsp");

            con.close();

        } catch (Exception e) {
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}