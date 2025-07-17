<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="../connection.jsp"%>

<head>
    <style>
        /* Container for the table and alignment */
.row {
    display: flex;
    justify-content: center;
    margin: 20px;
}

/* Table styling */
.table {
    width: 90%;
    max-width: 1200px;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin: 20px 0;
    border-radius: 10px;
    overflow: hidden;
}

/* Table header */
.table thead {
    background-color: #007bff;
    color: white;
    text-align: center;
    font-weight: bold;
}

.table thead th {
    padding: 15px;
}

/* Table body */
.table tbody td {
    padding: 15px;
    text-align: center;
    vertical-align: middle;
    border-bottom: 1px solid #ddd;
}

/* Image styling */
.table tbody img {
    border-radius: 5px;
    object-fit: cover;
    transition: transform 0.3s ease-in-out;
}

.table tbody img:hover {
    transform: scale(1.05);
}

/* Delete button styling */
.table tbody a {
    color: red;
    text-decoration: none;
    font-weight: bold;
}

.table tbody a:hover {
    color: darkred;
    text-decoration: underline;
}

/* Total row styling */
.table tbody tr:last-child {
    background-color: #f8f9fa;
    font-weight: bold;
}

.table tbody tr:last-child td {
    border-bottom: none;
}

/* Confirm order button */
.btn-primary {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    display: inline-block;
    margin: 20px 0;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
    text-decoration: none;
}

/* Center the footer content */
footer {
    text-align: center;
    padding: 20px;
    background-color: #f8f9fa;
}

    </style>
</head>


<h1 align="center">Your Cart</h1>
<div align="center">
    <img src="images/18.webp"  width="1000" height="300" alt="Cart Image">
</div>
<div class="row">
<table class="table">
<thead>
<tr>
    <th>Id</th>
    <th>Image</th>
    <th>Name</th>
    <th>Brand</th>
    <th>Color</th>
    <th>Category</th>
    <th>Dimensions</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Total Amount</th>
    <th>Actions</th>
</tr>
</thead>
<tbody>
<%! String id, productimg, name, price, category, quantity, amount; %>
<%
String u;
int total = 0;
try {
    u = (String) session.getAttribute("email");
    if (cn == null) {
        out.println("Database connection not established.");
    }

    PreparedStatement pst = cn.prepareStatement(
        "SELECT cart.id, cart.price, cart.quantity, cart.amount, cart.productimg, cart.name, cart.category, cart.brand, cart.color, cart.dimensions " + 
        "FROM cart WHERE cart.email = ?"
    );
    pst.setString(1, u);
    ResultSet rs = pst.executeQuery();

    while (rs.next()) {
        id = rs.getString("id");
        price = rs.getString("price");
        quantity = rs.getString("quantity");
        amount = rs.getString("amount");
        productimg = rs.getString("productimg");
        name = rs.getString("name");
        category = rs.getString("category");
        String brand = rs.getString("brand");
        String color = rs.getString("color");
        String dimensions = rs.getString("dimensions");
%>
<tr>
    <td><%= id %></td>
    <td><img src="<%= request.getContextPath() %>/images/<%= productimg %>" width="150" height="150"></td>
    <td><%= name %></td>
    <td><%= brand %></td>
    <td><%= color %></td>
    <td><%= category %></td>
    <td><%= dimensions %></td>
    <td><%= price %></td>
    <td><%= quantity %></td>
    <td><%= amount %></td>
    <td><a href="delete.jsp?email=<%= u %>&id=<%= id %>">Delete</a></td>
</tr>
<%
    }

    PreparedStatement pst1 = cn.prepareStatement("SELECT SUM(amount) FROM cart WHERE email = ?");
    pst1.setString(1, u);
    ResultSet rs1 = pst1.executeQuery();
    if (rs1.next()) {
        total = rs1.getInt(1);
    }
%>
<tr>
    <td colspan="8"></td>
    <td><b>Total Amount</b></td>
    <td colspan="2"><b><%= total %></b></td>
</tr>
<%
} catch (Exception ex) {
    out.println("Error: " + ex.getMessage());
}
%>

</tbody>
</table>
<center><a class="btn btn-primary" href="payment.jsp?amount=<%= total %>">Confirm Order and Proceed to payment</a></center>
</div>