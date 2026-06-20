<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Event Manager - Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:'Segoe UI';background:#000;color:#fff;}

nav{
    background:rgba(0,0,0,0.8);
    padding:20px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:2px solid #ff9f1c;
}
.logo{font-size:26px;color:#ff9f1c;font-weight:bold;}
.nav-links{display:flex;gap:30px;list-style:none;}
.nav-links a{color:#fff;text-decoration:none;}
.btn{padding:10px 20px;border-radius:25px;border:2px solid #ff9f1c;color:#ff9f1c;text-decoration:none;}
.btn:hover{background:#ff9f1c;color:#000;}

.hero{
    display:grid;
    grid-template-columns:1fr 1fr;
    padding:80px;
    align-items:center;
    background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1505236858219-8359eb29e329');
    background-size:cover;
}

.hero h1{font-size:45px;color:#ff9f1c;}
.hero p{margin:20px 0;color:#ccc;}
.hero-btn{background:#ff9f1c;color:#000;padding:12px 30px;border-radius:30px;text-decoration:none;}

.hero img{
    width:400px;
    height:400px;
    border-radius:15px;
    object-fit:cover;
    border:3px solid #ff9f1c;
}

.features{padding:80px;display:flex;gap:30px;justify-content:center;}
.card{
    width:300px;
    padding:30px;
    background:#111;
    border-radius:10px;
    text-align:center;
}
.card h3{color:#ff9f1c;margin:10px 0;}

.about{
    display:grid;
    grid-template-columns:1fr 1fr;
    padding:80px;
    gap:40px;
}
.about img{
    width:400px;
    height:400px;
    border-radius:15px;
    border:3px solid #ff9f1c;
}

.stats{
    background:#ff9f1c;
    color:#000;
    padding:60px;
    display:flex;
    justify-content:space-around;
}
.stats div{text-align:center;}

.reviews{padding:80px;text-align:center;}
.review-container{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
    justify-content:center;
}
.review{
    width:300px;
    padding:20px;
    border:2px solid #ff9f1c;
    border-radius:10px;
}

footer{
    background:#111;
    padding:40px;
    text-align:center;
}
</style>
</head>

<body>

<nav>
<div class="logo">EVENT MANAGER</div>

<ul class="nav-links">
<li><a href="index.jsp">Home</a></li>
<li><a href="#features">Features</a></li>
<li><a href="#reviews">Reviews</a></li>
</ul>

<% String username = (String) session.getAttribute("username"); %>
<% if(username!=null){ %>
<span>Welcome <%=username%></span>
<a href="event.jsp" class="btn">My Events</a>
<% } else { %>
<a href="login.jsp" class="btn">Login</a>
<% } %>

</nav>

<section class="hero">

<div>
<h1>Plan Your Dream Event With Us</h1>
<h4>From weddings to corporate events, our platform manages everything easily. Create events, track your budget and collaborate
    with others to make your special moments unforgettable</h4><br><br>

<% if(username==null){ %>
<a href="login.jsp" class="hero-btn">Get Started</a>
<% } else { %>
<a href="event.jsp" class="hero-btn">Create Event</a>
<% } %>
</div>

<div>
<img src="https://images.unsplash.com/photo-1511795409834-ef04bbd61622">
</div>

</section>

<section class="features" id="features">

<div class="card">
<h3>Event Planning</h3>
<p>Plan events easily</p>
</div>

<div class="card">
<h3> Budget</h3>
<p>Track expenses</p>
</div>

<div class="card">
<h3> Celebration</h3>
<p>Make moments special</p>
</div>

</section>

<section class="about">

<div>
<h2 style="color:#ff9f1c;">About Us</h2>
<h4>*We help you organize perfect events with ease.</h4>
<h4>*Save your time and energy by our smart event organization</h4>
<h4>*Reduce errors and tension and leave all you perfection to us</h4><br><br>

<h2 style="color:#ff9f1c;"> Future Enhancements</h2>
        <h4>*Add online booking system</h4>
<h4>*Payment integration</h4>
<h4>*Notification and reminders</h4>
<h4>*Mobile app version</h4>
</div>

<div>
    <img src="https://images.unsplash.com/photo-1464366400600-7168b8af9bc3">
</div>
   
</section>

<section class="stats">
<div><h2>10K+</h2><p>Users</p></div>
<div><h2>25K+</h2><p>Events</p></div>
<div><h2>4.8⭐</h2><p>Rating</p></div>
</section>

<!-- REVIEWS -->
<section class="reviews" id="reviews">
    <h2><u>⭐ Customer Reviews (4.8/5)</u></h2><br>

<div class="review-container">

<div class="review">
⭐⭐⭐⭐⭐
<p>Amazing platform!</p>
</div>

<div class="review">
⭐⭐⭐⭐⭐
<p>Very easy to use</p>
</div>

<div class="review">
⭐⭐⭐⭐⭐
<p>Best event planner</p>
</div>

</div>
</section>

<footer>
    <h3><u>contact us</u> </h3><br>
    <p>No:10, Cathedral Road   +6755766576  / +5345646545</p><br>
<p>© 2026 Event Manager</p>
</footer>

</body>
</html>