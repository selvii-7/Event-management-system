import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");

        String eventName = request.getParameter("eventName");
        String eventType = request.getParameter("eventType");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String guestCountStr = request.getParameter("guestCount");

        int guestCount = 0;
        try {
            guestCount = Integer.parseInt(guestCountStr);
        } catch (Exception e) {
            guestCount = 0;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/userdbs1", "app", "app"
            );

            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT * FROM EVENTS WHERE username=? AND event_name=? AND event_date=?"
            );

            checkStmt.setString(1, username);
            checkStmt.setString(2, eventName);
            checkStmt.setString(3, eventDate);

            ResultSet checkRs = checkStmt.executeQuery();

            if (checkRs.next()) {

                response.setContentType("text/html");
                response.getWriter().println(
                    "<script>alert('This event is already booked on this date. Please choose another event or date.'); window.location='event.jsp';</script>"
                );
                return;
            }

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT MAX(id) FROM EVENTS");

            int newId = 1;
            if (rs.next()) {
                newId = rs.getInt(1) + 1;
            }

            String query = "INSERT INTO EVENTS (id, event_name, username, event_type, event_date, event_location, guest_count) VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setInt(1, newId);
            stmt.setString(2, eventName);
            stmt.setString(3, username);
            stmt.setString(4, eventType);
            stmt.setString(5, eventDate);
            stmt.setString(6, eventLocation);
            stmt.setInt(7, guestCount);

            stmt.executeUpdate();

            stmt.close();
            conn.close();

session.setAttribute("eventName", eventName);
response.sendRedirect("budget.jsp");

        } catch (Exception e) {
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}