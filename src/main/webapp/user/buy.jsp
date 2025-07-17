<%@ page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>

<%
int id = 0;
int price = 0;
String name = "", cat = "", brand = "", color = "", dimensions = "", image = "";

if (request.getParameter("id") != null) {
    id = Integer.parseInt(request.getParameter("id"));
    price = Integer.parseInt(request.getParameter("price"));
    name = request.getParameter("name");
    cat = request.getParameter("category");
    brand = request.getParameter("brand");
    color = request.getParameter("color");
    dimensions = request.getParameter("dimensions");

    try {
        PreparedStatement pst = cn.prepareStatement("SELECT productimg FROM product WHERE id = ?");
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            image = rs.getString("productimg");
        }
    } catch (Exception ex) {
        out.println("Image Load Error: " + ex);
    }
}

// --- Handle form submission ---
if (request.getParameter("btnBuy") != null) {
    String email = (String) session.getAttribute("email");

    if (email == null) {
        out.println("<script>alert('Please login first.'); window.location='login.jsp';</script>");
    } else {
        try {
            int qty = Integer.parseInt(request.getParameter("quantity"));
            int amt = Integer.parseInt(request.getParameter("amount"));

            String query = "INSERT INTO cart (email, name, brand, color, category, dimensions, price, quantity, amount, productimg) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, name);
            pst.setString(3, brand);
            pst.setString(4, color);
            pst.setString(5, cat);
            pst.setString(6, dimensions);
            pst.setInt(7, price);
            pst.setInt(8, qty);
            pst.setInt(9, amt);
            pst.setString(10, image);

            pst.executeUpdate();
            out.println("<script>alert('Product added to cart successfully'); window.location='viewcart.jsp';</script>");
        } catch (Exception ex) {
            out.println("<script>alert('Error: " + ex.getMessage() + "');</script>");
        }
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .order-container {
            max-width: 700px; margin: 50px auto; background: white;
            padding: 20px; border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="order-container">
    <h1 class="text-center">Order Details</h1>
    <form method="post" name="myform">
        <div class="text-center">
            <img src="http://localhost:9090/TrendFurnish/images/<%= image %>" width="250" height="300" class="img-fluid">
        </div><br>
        <b>Name:</b>
        <input type="text" class="form-control" name="name" value="<%= name %>" readonly>

        <b>Brand:</b>
        <input type="text" class="form-control" name="brand" value="<%= brand %>" readonly>

        <b>Color:</b>
        <input type="text" class="form-control" name="color" value="<%= color %>" readonly>

        <b>Category:</b>
        <input type="text" class="form-control" name="category" value="<%= cat %>" readonly>

        <b>Dimensions:</b>
        <input type="text" class="form-control" name="dimensions" value="<%= dimensions %>" readonly>

        <b>Price (per unit):</b>
        <input type="text" class="form-control" id="price" name="price" value="<%= price %>" readonly>

        <b>Quantity:</b>
        <input type="number" class="form-control" id="quantity" name="quantity" onchange="cal()" min="1" required>

        <b>Total Amount:</b>
        <input type="text" class="form-control" id="amt" name="amount" value="0" readonly><br>

        <div class="text-center">
            <button type="submit" class="btn btn-primary" name="btnBuy">Add to Cart</button>
        </div>
    </form>
</div>

<script>
function cal() {
    var price = parseFloat(document.getElementById("price").value);
    var qty = parseInt(document.getElementById("quantity").value);
    document.getElementById("amt").value = price * qty;
}
</script>

</body>
</html>
