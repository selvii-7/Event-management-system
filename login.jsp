<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:linear-gradient(rgba(0,0,0,0.85),rgba(0,0,0,0.95)),
    url('https://images.unsplash.com/photo-1492684223066-81342ee5ff30');
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
    width:380px;
    box-shadow:0 0 25px rgba(0,0,0,0.7);
}

h2{
    text-align:center;
    color:#ff9f1c;
    margin-bottom:20px;
}

/* LABEL */
label{
    display:block;
    margin-top:10px;
    font-size:14px;
    color:#ccc;
}

/* INPUT */
input{
    width:100%;
    padding:12px;
    margin-top:5px;
    border:none;
    border-radius:8px;
    background:#222;
    color:#fff;
    transition:0.3s;
}

/* 🔴 ERROR */
input.error{
    border:2px solid red !important;
    background-color:#5c1a1a;
}

input.valid{
    border:2px solid #00ff88;
    background-color:#0d2b1a;
}

input:focus{
    outline:none;
    border:1px solid #ff9f1c;
    box-shadow:0 0 8px #ff9f1c;
}

/* BUTTON */
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
    transition:0.3s;
}

button:hover{
    transform:scale(1.05);
}

/* LINKS */
a{
    color:#ff9f1c;
    text-decoration:none;
}

.footer-text{
    text-align:center;
    margin-top:15px;
}

.error{
    color:red;
    text-align:center;
    margin-top:10px;
}
</style>

<script>
function validateForm(){

    let username = document.getElementById("username");
    let email = document.getElementById("email");

    let valid = true;

    let namePattern = /^[A-Za-z]+$/;
    let emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

    // Username
    if(!namePattern.test(username.value)){
        username.classList.add("error");
        username.classList.remove("valid");
        valid = false;
    } else {
        username.classList.remove("error");
        username.classList.add("valid");
    }

    // Email
    if(!emailPattern.test(email.value)){
        email.classList.add("error");
        email.classList.remove("valid");
        valid = false;
    } else {
        email.classList.remove("error");
        email.classList.add("valid");
    }

    return valid;
}

function liveValidate(){

    let username = document.getElementById("username");
    let email = document.getElementById("email");

    let namePattern = /^[A-Za-z]+$/;
    let emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

    if(!namePattern.test(username.value)){
        username.classList.add("error");
        username.classList.remove("valid");
    } else {
        username.classList.remove("error");
        username.classList.add("valid");
    }

    if(!emailPattern.test(email.value)){
        email.classList.add("error");
        email.classList.remove("valid");
    } else {
        email.classList.remove("error");
        email.classList.add("valid");
    }
}
</script>

</head>

<body>

<div class="container">
<div class="form-box">

<h2>🔐 Login</h2>

<form action="login" method="post" onsubmit="return validateForm()" novalidate>

<label>Username</label>
<input type="text" id="username" name="username" placeholder="Enter your username" onkeyup="liveValidate()" required>

<label>Email Address</label>
<input type="text" id="email" name="email" placeholder="Enter your email" onkeyup="liveValidate()" required>

<label>Password</label>
<input type="password" name="password" placeholder="Enter your password" required>

<button type="submit">Login</button>

</form>

<%
String error = request.getParameter("error");
if(error != null){
%>
<p class="error"><%=error%></p>
<% } %>

<p class="footer-text">
Don't have account? <a href="register.jsp">Register Here</a>
</p>

</div>
</div>

</body>
</html>