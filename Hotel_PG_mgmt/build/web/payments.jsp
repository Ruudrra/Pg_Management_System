<%@ page import="dao.PaymentDAO,java.util.*,model.PaymentBean" %>

<%
ArrayList<PaymentBean> list = PaymentDAO.getAllPayments();

int total = list.size();
int paid = 0;
int pending = 0;

for(PaymentBean p : list){
    if("paid".equalsIgnoreCase(p.getStatus())){
        paid++;
    }else{
        pending++;
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Payments</title>

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
<h2>Payments</h2>
</div>

<!-- Payment Cards -->

<div class="stats">

<div class="card">
<h3><%=total%></h3>
<p>Total Payments</p>
</div>

<div class="card">
<h3><%=paid%></h3>
<p>Paid Payments</p>
</div>

<div class="card">
<h3><%=pending%></h3>
<p>Pending Payments</p>
</div>

</div>

<!-- Add Payment -->

<div class="form-card">

<h3>Add Payment</h3>

<form action="PaymentServlet" method="post">

Tenant ID
<input type="text" name="tenant_id" required>

Amount
<input type="text" name="amount" required>

Month
<input type="text" name="month" required>

Status
<input type="text" name="status" required>

Payment Date
<input type="date" name="payment_date" required>

<button type="submit">Add Payment</button>

</form>

</div>

<!-- Payment Table -->

<div class="table-card">

<h3>Payment History</h3>

<table>

<tr>
<th>ID</th>
<th>Tenant ID</th>
<th>Amount</th>
<th>Month</th>
<th>Status</th>
<th>Date</th>
</tr>

<%
for(PaymentBean p : list){
%>

<tr>

<td><%=p.getPaymentId()%></td>
<td><%=p.getTenantId()%></td>
<td><%=p.getAmount()%></td>
<td><%=p.getMonth()%></td>
<td><%=p.getStatus()%></td>
<td><%=p.getPaymentDate()%></td>

</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>