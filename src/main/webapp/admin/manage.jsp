<%@page import="java.sql.*" %>
<%@include file="../connection.jsp"%>
<%@include file="header.jsp"%>
<style>
* {
    margin: 0;
    padding: 0;
}
form {
    padding: 10px;
    align-items: center;
    justify-content: center;
    background-color: rgba(104, 99, 99, 0.5);
    width: 700px;
    border-radius: 9.5px;
    box-shadow: inset -5px -5px rgba(44,43,43,0.5);
}
h1 {
    color: black;
    font-size: 3rem;
    border-bottom: 4px solid rgba(255, 255, 255, 0.5);
}
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
.table th, .table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}
.table th {
    background-color: #f2f2f2;
    color: black;
}
.table img {
    border: 2px solid black;
    padding: 5px;
    border-radius: 5px;
}
</style>
<center>
<br>
<div class="col-sm-12">
<h1 align="center">Manage Available Furniture</h1>
<table class="table">
<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Brand</th>
<th>Color</th>
<th>Dimensions</th>
<th>Category</th>
<th>Price</th>
<th>Image</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
try {
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM product");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String brand = rs.getString("brand");
        String color = rs.getString("color");
        String dimensions = rs.getString("dimensions");
        String price = rs.getString("price");
        String cat = rs.getString("category");
        String image = rs.getString("productimg");
%>
<tr>
<td><%= id %></td>
<td><%= name %></td>
<td><%= brand %></td>
<td><%= color %></td>
<td><%= dimensions %></td>
<td><%= cat %></td>
<td><%= price %></td>
<td><img src="http://localhost:9090/TrendFurnish/images/<%= image %>" width="100" height="100"></td>
<td>
    <a href="delete.jsp?id=<%= id %>">Delete</a> | 
    <a href="up.jsp?id=<%= id %>">Update</a>
</td>
</tr>
<%
    }
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
</tbody>
</table>
</div>
</center>

