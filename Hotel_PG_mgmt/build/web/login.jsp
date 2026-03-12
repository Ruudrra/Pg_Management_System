<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Umiyaji PG Admin Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

/* Background */

body{
    min-height:100vh;
    background:linear-gradient(145deg,#f9f3e7,#f0e6d8);
    display:flex;
    align-items:center;
    justify-content:center;
}

/* Login Box */

.login-box{
    width:100%;
    max-width:420px;
    min-height:500px;
    background:rgba(255,255,255,0.92);
    padding:50px 40px;
    border-radius:35px;
    text-align:center;
    box-shadow:0 25px 45px rgba(0,0,0,0.15);
    border:1px solid #eee;

    display:flex;
    flex-direction:column;
    justify-content:center;
}

/* Brand */

.brand{
    margin-bottom:30px;
}

.brand span{
    display:block;
}

.welcome{
    letter-spacing:4px;
    font-size:13px;
    color:#8b6e4f;
}

.title{
    font-size:38px;
    font-weight:700;
    color:#3f2e1e;
    letter-spacing:2px;
}

/* Login Heading */

.login-title{
    font-size:22px;
    margin-bottom:30px;
    padding-bottom:12px;
    border-bottom:2px dashed #d9c8b8;
    color:#2d241b;
}

/* Form */

form{
    display:flex;
    flex-direction:column;
    gap:20px;
}

/* Inputs */

input{
    width:100%;
    padding:14px 18px;
    border-radius:30px;
    border:1.5px solid #e5d5c5;
    background:#fffaf5;
    font-size:15px;
    outline:none;
    transition:0.2s;
}

input::placeholder{
    color:#9c8a79;
}

input:focus{
    border-color:#c8a77b;
    background:white;
    box-shadow:0 0 0 3px rgba(200,167,123,0.2);
}

/* Button */

button{
    margin-top:10px;
    background:#8f6e4f;
    border:none;
    padding:14px;
    border-radius:35px;
    font-size:18px;
    color:white;
    font-weight:600;
    letter-spacing:1px;
    cursor:pointer;
    transition:0.2s;
}

button:hover{
    background:#7b5b3e;
    transform:translateY(-2px);
}

button:active{
    transform:scale(0.97);
}

/* Error Message */

.error{
    background:#fee9e0;
    color:#a1442b;
    padding:10px;
    border-radius:25px;
    margin-bottom:15px;
    font-size:14px;
}

/* Mobile Responsive */

@media(max-width:480px){

.login-box{
    padding:40px 25px;
}

.title{
    font-size:32px;
}

.login-title{
    font-size:20px;
}

}

</style>

</head>

<body>

<div class="login-box">

    <div class="brand">
        <span class="welcome">WELCOME TO</span>
        <span class="title">UMIYAJI PG</span>
    </div>

    <div class="login-title">ADMIN LOGIN</div>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p class="error"><%=error%></p>
    <%
        }
    %>

    <form action="LoginServlet" method="post">

        <input type="text" name="username" placeholder="Username" required>

        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>

    </form>

</div>

</body>
</html>