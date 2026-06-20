<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:#000;
    color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.box{
    background:#111;
    padding:40px;
    border-radius:15px;
    width:350px;
    text-align:center;
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:none;
    border-radius:8px;
}

button{
    padding:10px 20px;
    background:#ff9f1c;
    border:none;
    border-radius:20px;
    cursor:pointer;
}
</style>

</head>

<body>

<div class="box">

<h2>Admin Login</h2>

<form action="AdminServlet" method="post">

<input type="password" name="adminPassword" placeholder="Enter Admin Password" required>

<button type="submit">Login</button>

</form>

<p style="color:red;">
<%= request.getParameter("error") != null ? "Wrong Password!" : "" %>
</p>

</div>

</body>
</html>