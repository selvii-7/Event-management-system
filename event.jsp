<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<title>My Events</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;}

body{
    font-family:'Segoe UI';
    background:#0a0a0a;
    color:#fff;
}

nav{
    background:rgba(0,0,0,0.85);
    padding:20px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:1px solid rgba(255,159,28,0.3);
}

.logo{
    font-size:26px;
    color:#ff9f1c;
    font-weight:bold;
}

.btn{
    padding:8px 20px;
    border-radius:25px;
    border:2px solid #ff9f1c;
    color:#ff9f1c;
    text-decoration:none;
}

.btn:hover{
    background:#ff9f1c;
    color:#000;
}

.container{
    padding:50px;
}

.form-box{
    background:#111;
    padding:30px;
    border-radius:15px;
    width:100%;
    max-width:700px;
    margin:auto;
    box-shadow:0 0 20px rgba(0,0,0,0.6);
}

.form-box h2{
    color:#ff9f1c;
    margin-bottom:20px;
    text-align:center;
}

label{
    display:block;
    margin-top:15px;
    color:#ccc;
}

input{
    width:100%;
    padding:12px;
    margin-top:5px;
    border:none;
    border-radius:8px;
    background:#222;
    color:#fff;
}

input:focus{
    outline:none;
    border:1px solid #ff9f1c;
    box-shadow:0 0 8px #ff9f1c;
}

button{
    width:100%;
    padding:12px;
    margin-top:20px;
    background:#ff9f1c;
    border:none;
    border-radius:25px;
    color:#000;
    font-weight:bold;
    cursor:pointer;
}

button:hover{
    transform:scale(1.05);
}

/* EVENTS */
.events{
    margin-top:60px;
}

.events h2{
    color:#ff9f1c;
    margin-bottom:20px;
}

.event-grid{
    display:flex;
    flex-wrap:wrap;
    gap:20px;
}

.card{
    background:#111;
    padding:20px;
    border-radius:15px;
    width:300px;
    box-shadow:0 0 15px rgba(0,0,0,0.5);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-8px);
}

.card h3{
    color:#ff9f1c;
}

.card p{
    margin:5px 0;
    color:#ccc;
}
</style>

<script>
function validateEventDate(){

    let selectedDate = document.getElementById("eventDate").value;

    if(selectedDate === ""){
        return true;
    }

    let today = new Date();
    let yyyy = today.getFullYear();
    let mm = String(today.getMonth() + 1).padStart(2, '0');
    let dd = String(today.getDate()).padStart(2, '0');

    let todayDate = yyyy + "-" + mm + "-" + dd;

    if(selectedDate <= todayDate){
        alert("Please select a future date. Past and today dates are not allowed.");
        return false;
    }

    return true;
}
</script>

</head>

<body>

<nav>
<div class="logo">EVENT MANAGER</div>
<a href="index.jsp" class="btn">Home</a>
</nav>

<div class="container">

<%
HttpSession session1 = request.getSession(false);

if(session1 == null || session1.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
    return;
}

String username = (String) session1.getAttribute("username");
%>

<div class="form-box">

<h2>Create Event</h2>

<form action="EventServlet" method="post" onsubmit="return validateEventDate()">

<label>Event Name</label>
<input type="text" name="eventName" required>

<label>Event Type</label>
<input type="text" name="eventType" required>

<label>Date</label>
<input type="date" id="eventDate" name="eventDate" required>

<label>Location</label>
<input type="text" name="eventLocation" required>

<label>Guests</label>
<input type="number" name="guestCount" required>

<button type="submit">Create Event</button>

</form>

</div>

<div class="events">

<h2>Your Events</h2>

<div class="event-grid">

<%
try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/userdbs1","app","app"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM EVENTS WHERE username=?"
    );

    ps.setString(1, username);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<div class="card">

<h3><%= rs.getString("event_name") %></h3>
<p>Type: <%= rs.getString("event_type") %></p>
<p>Date: <%= rs.getString("event_date") %></p>
<p>Location: <%= rs.getString("event_location") %></p>
<p>Guests: <%= rs.getInt("guest_count") %></p>

<form action="DeleteEventServlet" method="post">
    <input type="hidden" name="eventId" value="<%= rs.getInt("id") %>">
    <button type="submit" style="margin-top:10px;background:red;color:white;">
        Delete
    </button>
</form>

</div>

<%
    }

    con.close();

}catch(Exception e){
%>
<p style="color:red;">Error: <%= e.getMessage() %></p>
<%
}
%>

</div>
</div>

</div>

</body>
</html>