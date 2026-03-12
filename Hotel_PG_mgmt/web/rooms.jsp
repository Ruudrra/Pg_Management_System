<%@ page import="dao.RoomDAO,java.util.*,model.RoomBean" %>

<%
ArrayList<RoomBean> list = RoomDAO.getAllRooms();

int total = list.size();
int available = 0;
int full = 0;

for(RoomBean r : list){
    if("available".equalsIgnoreCase(r.getStatus())){
        available++;
    }else{
        full++;
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Rooms</title>

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
<h2>Rooms</h2>
</div>

<!-- Room Stats -->

<div class="stats">

<div class="card">
<h3><%=total%></h3>
<p>Total Rooms</p>
</div>

<div class="card">
<h3><%=available%></h3>
<p>Available Rooms</p>
</div>

<div class="card">
<h3><%=full%></h3>
<p>Full Rooms</p>
</div>

</div>

<!-- Add Room -->

<div class="form-card">

<h3>Add Room</h3>

<form action="RoomServlet" method="post">

Room Number
<input type="text" name="room_number" required>

Room Type
<input type="text" name="room_type" required>

Total Beds
<input type="text" name="total_beds" required>

Occupied Beds
<input type="text" name="occupied_beds" required>

Status
<input type="text" name="status" required>

<button type="submit">Add Room</button>

</form>

</div>

<!-- Room Table -->

<div class="table-card">

<h3>Room List</h3>

<table>

<tr>
<th>ID</th>
<th>Room Number</th>
<th>Type</th>
<th>Total Beds</th>
<th>Occupied Beds</th>
<th>Status</th>
</tr>

<%
for(RoomBean r : list){
%>

<tr>

<td><%=r.getRoomId()%></td>
<td><%=r.getRoomNumber()%></td>
<td><%=r.getRoomType()%></td>
<td><%=r.getTotalBeds()%></td>
<td><%=r.getOccupiedBeds()%></td>
<td><%=r.getStatus()%></td>

</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>