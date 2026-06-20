<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Event Budget</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:linear-gradient(rgba(0,0,0,0.85),rgba(0,0,0,0.95)),
    url('https://images.unsplash.com/photo-1556742049-0cfed4f6a45d');
    background-size:cover;
    color:#fff;
}

.container{
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.form-box{
    background:#111;
    padding:40px;
    border-radius:15px;
    width:400px;
    box-shadow:0 0 25px rgba(0,0,0,0.7);
}

h2{
    text-align:center;
    color:#ff9f1c;
    margin-bottom:20px;
}

label{
    display:block;
    margin-top:10px;
    font-size:14px;
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

a{
    display:block;
    text-align:center;
    margin-top:15px;
    color:#ff9f1c;
    text-decoration:none;
}
</style>

<script>
function calculateTotal(){
    let v = parseInt(document.getElementById("venue").value) || 0;
    let f = parseInt(document.getElementById("food").value) || 0;
    let d = parseInt(document.getElementById("decoration").value) || 0;
    let e = parseInt(document.getElementById("entertainment").value) || 0;

    let total = v + f + d + e;

    document.getElementById("total").innerText = "Total: ₹" + total;
}
</script>

</head>

<body>

<div class="container">
<div class="form-box">

<h2>Event Budget</h2>

<%
String eventName = (String) session.getAttribute("eventName");

if(eventName == null){
    eventName = "My Event";
}
%>

<p style="text-align:center;color:#ccc;">Event: <b><%=eventName%></b></p>

<form action="BudgetServlet" method="post">

<input type="hidden" name="eventName" value="<%=eventName%>">

<label>Venue Cost</label>
<input type="number" id="venue" name="venue" onkeyup="calculateTotal()" required>

<label>Food Cost</label>
<input type="number" id="food" name="food" onkeyup="calculateTotal()" required>

<label>Decoration Cost</label>
<input type="number" id="decoration" name="decoration" onkeyup="calculateTotal()" required>

<label>Entertainment Cost</label>
<input type="number" id="entertainment" name="entertainment" onkeyup="calculateTotal()" required>

<p id="total" style="margin-top:10px;text-align:center;color:#ff9f1c;">
Total: ₹0
</p>

<button type="submit">Calculate Budget</button>

</form>

<a href="event.jsp">Back to Events</a>


</div>
</div>

</body>
</html>