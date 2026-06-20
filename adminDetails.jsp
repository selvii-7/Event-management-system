<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Panel</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:#000;
    color:#fff;
}

.container{
    padding:40px;
}

h2{
    color:#ff9f1c;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

th, td{
    padding:10px;
    border:1px solid #444;
    text-align:center;
}

th{
    background:#ff9f1c;
    color:#000;
}

tr:hover{
    background:#111;
}
</style>

</head>

<body>

<div class="container">

<h2>Admin Dashboard - Booked Events</h2>

<%
HttpSession session1 = request.getSession(false);

if(session1 == null || session1.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<table>
<tr>
<th>User</th>
<th>Event</th>
<th>Type</th>
<th>Date</th>
<th>Location</th>
<th>Guests</th>
</tr>

<%
try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/userdbs1","app","app"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM EVENTS");

    while(rs.next()){
%>

<tr>
<td><%= rs.getString("USERNAME") %></td>
<td><%= rs.getString("EVENT_NAME") %></td>
<td><%= rs.getString("EVENT_TYPE") %></td>
<td><%= rs.getString("EVENT_DATE") %></td>
<td><%= rs.getString("EVENT_LOCATION") %></td>
<td><%= rs.getInt("GUEST_COUNT") %></td>
</tr>

<%
    }

    con.close();

}catch(Exception e){
%>
<tr><td colspan="6">Error: <%= e.getMessage() %></td></tr>
<%
}
%>

</table>

<br>
<a href="index.jsp" style="color:#ff9f1c;"><u>Back to Home</u></a>

</div>

</body>
</html>