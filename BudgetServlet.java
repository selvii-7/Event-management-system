import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/BudgetServlet")
public class BudgetServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

HttpSession session = request.getSession(false);
String username = (String) session.getAttribute("username");

String eventName = request.getParameter("eventName");

int venue = Integer.parseInt(request.getParameter("venue"));
int food = Integer.parseInt(request.getParameter("food"));
int decoration = Integer.parseInt(request.getParameter("decoration"));
int entertainment = Integer.parseInt(request.getParameter("entertainment"));

int total = venue + food + decoration + entertainment;

String status;

if(total < 20000){
    status = "Low Budget Event";
}
else if(total < 50000){
    status = "Medium Budget Event";
}
else{
    status = "High Budget Event";
}

try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/userdbs1","app","app"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT MAX(ID) FROM BUDGET");

    int id = 1;
    if(rs.next()){
        id = rs.getInt(1) + 1;
    }

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO BUDGET VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );

    ps.setInt(1, id);
    ps.setString(2, eventName);
    ps.setString(3, username);
    ps.setInt(4, venue);
    ps.setInt(5, food);
    ps.setInt(6, decoration);
    ps.setInt(7, entertainment);
    ps.setInt(8, total);
    ps.setString(9, status);

    ps.executeUpdate();

    con.close();

}catch(Exception e){
    e.printStackTrace();

    response.setContentType("text/html");
    response.getWriter().println("<h2>ERROR: " + e.getMessage() + "</h2>");
}

request.setAttribute("venue", venue);
request.setAttribute("food", food);
request.setAttribute("decoration", decoration);
request.setAttribute("entertainment", entertainment);
request.setAttribute("total", total);
request.setAttribute("status", status);

RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
rd.forward(request, response);

}
}