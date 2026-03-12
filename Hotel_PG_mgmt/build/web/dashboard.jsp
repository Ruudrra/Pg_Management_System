<%@ page session="true" %>

<%
String admin = (String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Umiyaji PG Dashboard</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

/* Background same as login */

body{
background:linear-gradient(145deg,#f9f3e7,#f0e6d8);
height:100vh;
display:flex;
}

/* Sidebar */

.sidebar{
width:230px;
background:white;
padding:25px 20px;
border-radius:0 20px 20px 0;
box-shadow:5px 0 20px rgba(0,0,0,0.1);
}

.sidebar h2{
margin-bottom:30px;
font-size:20px;
color:#3f2e1e;
}

.sidebar a{
display:block;
padding:12px 15px;
margin-bottom:10px;
text-decoration:none;
color:#444;
border-radius:8px;
transition:.3s;
}

.sidebar a:hover{
background:#8f6e4f;
color:white;
}

.sidebar i{
margin-right:10px;
}

/* Main */

.main{
flex:1;
padding:30px;
}

/* Header */

.header{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:25px;
color:#3f2e1e;
}

.logout{
background:#8f6e4f;
padding:8px 14px;
color:white;
text-decoration:none;
border-radius:6px;
}

.logout:hover{
background:#7b5b3e;
}

/* Cards */

.stats{
display:flex;
gap:20px;
margin-bottom:25px;
flex-wrap:wrap;
}

.card{
flex:1;
min-width:220px;
background:white;
padding:20px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
display:flex;
align-items:center;
gap:15px;
}

.card i{
font-size:28px;
color:#8f6e4f;
}

.card h3{
margin:0;
color:#3f2e1e;
}

/* Table */

.table-box{
background:white;
padding:20px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

.table-box h3{
margin-bottom:15px;
color:#3f2e1e;
}

table{
width:100%;
border-collapse:collapse;
}

table th{
text-align:left;
padding:12px;
background:#8f6e4f;
color:white;
}

table td{
padding:12px;
border-bottom:1px solid #eee;
}

/* Status */

.status-active{
background:#e6fff3;
color:#00a86b;
padding:5px 10px;
border-radius:20px;
font-size:12px;
}

.status-inactive{
background:#ffe8e8;
color:#ff4d4d;
padding:5px 10px;
border-radius:20px;
font-size:12px;
}

/* Responsive */

@media(max-width:900px){

.sidebar{
display:none;
}

.main{
padding:20px;
}

}

</style>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h2><i class="fa-solid fa-gauge"></i> Dashboard</h2>

<a href="dashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a>
<a href="rooms.jsp"><i class="fa-solid fa-bed"></i> Rooms</a>
<a href="tenants.jsp"><i class="fa-solid fa-users"></i> Tenants</a>
<a href="payments.jsp"><i class="fa-solid fa-money-bill"></i> Payments</a>
<a href="complaints.jsp"><i class="fa-solid fa-triangle-exclamation"></i> Complaints</a>

</div>

<!-- Main -->

<div class="main">

<div class="header">
<h2>Hello <%=admin%></h2>
<a class="logout" href="LogoutServlet">Logout</a>
</div>

<!-- Stats -->

<div class="stats">

<div class="card">
<i class="fa-solid fa-bed"></i>
<div>
<h3>50</h3>
<p>Total Rooms</p>
</div>
</div>

<div class="card">
<i class="fa-solid fa-users"></i>
<div>
<h3>120</h3>
<p>Total Tenants</p>
</div>
</div>

<div class="card">
<i class="fa-solid fa-indian-rupee-sign"></i>
<div>
<h3>1,20,000</h3>
<p>Total Payments</p>
</div>
</div>

</div>

<!-- Table -->

<div class="table-box">

<h3>Recent Activity</h3>

<table>

<tr>
<th>Name</th>
<th>Room</th>
<th>Payment</th>
<th>Status</th>
</tr>

<tr>
<td>Rahul Patel</td>
<td>Room 101</td>
<td>5000</td>
<td><span class="status-active">Paid</span></td>
</tr>

<tr>
<td>Jay Shah</td>
<td>Room 203</td>
<td>5000</td>
<td><span class="status-inactive">Pending</span></td>
</tr>

<tr>
<td>Amit Kumar</td>
<td>Room 305</td>
<td>5000</td>
<td><span class="status-active">Paid</span></td>
</tr>

</table>

</div>

</div>

</body>
</html>