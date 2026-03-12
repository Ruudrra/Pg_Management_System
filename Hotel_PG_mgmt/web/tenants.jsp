<%@ page import="dao.TenantDAO,java.util.*,model.TenantBean" %>

<%
ArrayList<TenantBean> list = TenantDAO.getAllTenants();

int total = list.size();
int active = 0;
int left = 0;

for(TenantBean t : list){
    if("active".equalsIgnoreCase(t.getStatus())){
        active++;
    }else{
        left++;
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Tenants</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

/* Background */

body{
display:flex;
background:linear-gradient(145deg,#f9f3e7,#f0e6d8);
}

/* Sidebar */

.sidebar{
width:230px;
background:white;
height:100vh;
padding:25px;
box-shadow:0 0 15px rgba(0,0,0,0.1);
}

.sidebar h2{
margin-bottom:30px;
color:#3f2e1e;
}

.sidebar a{
display:block;
padding:12px;
text-decoration:none;
color:#444;
border-radius:8px;
margin-bottom:10px;
}

.sidebar a:hover{
background:#8f6e4f;
color:white;
}

/* Main */

.main{
flex:1;
padding:30px;
}

/* Header */

.header{
margin-bottom:25px;
}

.header h2{
color:#3f2e1e;
}

/* Cards */

.stats{
display:flex;
gap:20px;
margin-bottom:30px;
flex-wrap:wrap;
}

.card{
flex:1;
min-width:200px;
background:white;
padding:20px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.08);
text-align:center;
}

.card h3{
font-size:28px;
color:#3f2e1e;
}

.card p{
color:#777;
}

/* Form */

.form-card{
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.08);
margin-bottom:30px;
}

.form-card h3{
margin-bottom:15px;
color:#3f2e1e;
}

input{
width:100%;
padding:12px;
margin:8px 0 18px;
border:1px solid #ddd;
border-radius:6px;
}

/* Button */

button{
padding:12px 18px;
border:none;
background:#8f6e4f;
color:white;
border-radius:8px;
cursor:pointer;
}

button:hover{
background:#7b5b3e;
}

/* Table */

.table-card{
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.08);
}

table{
width:100%;
border-collapse:collapse;
}

table th{
background:#8f6e4f;
color:white;
padding:12px;
text-align:center;
}

table td{
padding:12px;
border-bottom:1px solid #eee;
text-align:center;
}

table tr:hover{
background:#f9f4ef;
}

</style>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h2>PG Admin</h2>

<a href="dashboard.jsp"><i class="fa fa-home"></i> Dashboard</a>
<a href="rooms.jsp"><i class="fa fa-bed"></i> Rooms</a>
<a href="tenants.jsp"><i class="fa fa-users"></i> Tenants</a>
<a href="payments.jsp"><i class="fa fa-money-bill"></i> Payments</a>
<a href="complaints.jsp"><i class="fa fa-exclamation-triangle"></i> Complaints</a>

</div>

<!-- Main -->

<div class="main">

<div class="header">
<h2>Tenants</h2>
</div>

<!-- Stats Cards -->

<div class="stats">

<div class="card">
<h3><%=total%></h3>
<p>Total Tenants</p>
</div>

<div class="card">
<h3><%=active%></h3>
<p>Active Tenants</p>
</div>

<div class="card">
<h3><%=left%></h3>
<p>Left Tenants</p>
</div>

</div>

<!-- Add Tenant -->

<div class="form-card">

<h3>Add Tenant</h3>

<form action="TenantServlet" method="post">

Name
<input type="text" name="name" required>

Phone
<input type="text" name="phone" required>

Room ID
<input type="text" name="room_id" required>

Join Date
<input type="date" name="join_date" required>

Status
<input type="text" name="status" required>

<button type="submit">Add Tenant</button>

</form>

</div>

<!-- Tenant Table -->

<div class="table-card">

<h3>Tenant List</h3>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Phone</th>
<th>Room ID</th>
<th>Join Date</th>
<th>Status</th>
</tr>

<%
for(TenantBean t : list){
%>

<tr>

<td><%=t.getTenantId()%></td>
<td><%=t.getName()%></td>
<td><%=t.getPhone()%></td>
<td><%=t.getRoomId()%></td>
<td><%=t.getJoinDate()%></td>
<td><%=t.getStatus()%></td>

</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>