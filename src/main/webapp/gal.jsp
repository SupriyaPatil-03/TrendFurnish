<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>

<style>
    .product-box {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 10px;
        margin: 15px;
        background: #fff;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        transition: 0.3s;
    }

    .product-box:hover {
        transform: scale(1.03);
    }

    .product-box img {
        width: 100%;
        height: 250px;
        object-fit: cover;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    .product-info {
        font-size: 14px;
        color: #333;
        margin: 5px 0;
    }

    .product-name {
        font-weight: bold;
        font-size: 16px;
    }

    .product-price {
        color: green;
        font-weight: bold;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .col-sm-3 {
        width: 23%;
        margin: 1%;
    }
</style>

<h1 style="text-align: center;">Furniture Gallery</h1>
<div class="row">
<%
try {
    String id, name, brand, price, color, cat, dimensions, image;
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM product");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        id = rs.getString("id");
        name = rs.getString("name");
        brand = rs.getString("brand");
        price = rs.getString("price");
        color = rs.getString("color");
        cat = rs.getString("category");
        dimensions = rs.getString("dimensions");
        image = rs.getString("productimg");
%>
    <div class="col-sm-3">
        <div class="product-box">
            <img src="http://localhost:9090/TrendFurnish/images/<%= image %>" alt="<%= name %>">
            <div class="product-name"><%= name %></div>
            <div class="product-info">Brand: <%= brand %></div>
            <div class="product-info">Color: <%= color %></div>
            <div class="product-info">Category: <%= cat %></div>
            <div class="product-info">Dimensions: <%= dimensions %></div>
            <div class="product-price">Price: Rs. <%= price %></div>
        </div>
    </div>
<%
    }
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
</div>


