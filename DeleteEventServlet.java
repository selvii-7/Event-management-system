import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int eventId = Integer.parseInt(request.getParameter("eventId"));

            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/userdbs1","app","app"
            );

            String query = "DELETE FROM EVENTS WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, eventId);

            ps.executeUpdate();

            conn.close();

            response.sendRedirect("event.jsp");

        } catch (Exception e) {
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}