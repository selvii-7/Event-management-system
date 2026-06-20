<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Budget Result</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:linear-gradient(rgba(0,0,0,0.85),rgba(0,0,0,0.95)),
    url('https://images.unsplash.com/photo-1511795409834-ef04bbd61622');
    background-size:cover;
    color:#fff;
}

.container{
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.card{
    background:#111;
    padding:40px;
    border-radius:15px;
    width:420px;
    text-align:center;
    box-shadow:0 0 25px rgba(0,0,0,0.7);
}

h2{
    color:#ff9f1c;
    margin-bottom:20px;
}

p{
    margin:8px 0;
    color:#ccc;
    font-size:16px;
}

.total{
    font-size:20px;
    color:#ff9f1c;
    margin-top:15px;
}

.status{
    margin-top:10px;
    font-weight:bold;
    font-size:18px;
}

/* COLORS FOR STATUS */
.low{ color:#00ff99; }
.medium{ color:#ffc107; }
.high{ color:#ff4d4d; }

img{
    width:100%;
    border-radius:10px;
    margin-bottom:15px;
}

button{
    margin-top:20px;
    padding:10px 25px;
    border:none;
    border-radius:25px;
    background:#ff9f1c;
    color:#000;
    font-weight:bold;
    cursor:pointer;
}
</style>

</head>

<body>

<div class="container">
<div class="card">

<!-- 🎉 IMAGE -->
<img src="https://images.unsplash.com/photo-1505236858219-8359eb29e329">

<h2>💰 Budget Summary</h2>

<%
Integer venue = (Integer) request.getAttribute("venue");
Integer food = (Integer) request.getAttribute("food");
Integer decoration = (Integer) request.getAttribute("decoration");
Integer entertainment = (Integer) request.getAttribute("entertainment");
Integer total = (Integer) request.getAttribute("total");
String status = (String) request.getAttribute("status");

// safety check
if(total == null){
%>
<p style="color:red;">No data found</p>
<%
}else{
%>

<p>🏛 Venue: ₹<%=venue%></p>
<p>🍽 Food: ₹<%=food%></p>
<p>🎀 Decoration: ₹<%=decoration%></p>
<p>🎵 Entertainment: ₹<%=entertainment%></p>

<p class="total">Total: ₹<%=total%></p>

<!-- 🔥 STATUS COLOR -->
<p class="status 
<%= status.contains("Low") ? "low" : 
    status.contains("Medium") ? "medium" : "high" %>">

<%=status%>

</p>

<% } %>

<button onclick="window.location.href='event.jsp'">⬅ Back</button>

</div>
</div>

</body>
</html>