<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Tracking Info</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
            padding: 2rem 0;
        }

        .page-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: #4e54c8;
            margin-bottom: 3rem;
            position: relative;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background-color: #4e54c8;
        }

        .tracking-form-card {
            background-color: #fff;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: 2px solid #4e54c8;
            max-width: 700px;
            margin: auto;
        }

        .form-group label {
            font-weight: 600;
            color: #4e54c8;
        }

        .track-btn {
            background-color: #4e54c8;
            color: white;
            border: none;
            padding: 0.75rem 2rem;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .track-btn:hover {
            background-color: #a85a1a;
        }

        .alert-custom {
            max-width: 700px;
            margin: 2rem auto;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            font-weight: 500;
            color: white;
        }

        .alert-success {
            background: linear-gradient(135deg, #28a745, #20c997);
        }

        .alert-danger {
            background: linear-gradient(135deg, #dc3545, #e85a4f);
        }

        @media (max-width: 768px) {
            .page-title {
                font-size: 2rem;
            }

            .tracking-form-card {
                padding: 1.5rem;
                margin: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="page-title">Update Tracking Info</h1>

        <div class="tracking-form-card">
            <form method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="order_id">Order ID:</label>
                        <input type="number" id="order_id" name="order_id" class="form-control" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="user_email">User Email:</label>
                        <input type="email" id="user_email" name="user_email" class="form-control" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="product_name">Product Name:</label>
                        <input type="text" id="product_name" name="product_name" class="form-control" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="order_date">Order Date:</label>
                        <input type="date" id="order_date" name="order_date" class="form-control" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="location">Location:</label>
                        <input type="text" id="location" name="location" class="form-control" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="status_title">Status Title:</label>
                        <select id="status_title" name="status_title" class="form-control" required>
                            <option value="" disabled selected>Select Status</option>
                            <option value="Order Placed">Order Placed</option>
                            <option value="Processing">Processing</option>
                            <option value="Shipped">Shipped</option>
                            <option value="In Transit">In Transit</option>
                            <option value="Out for Delivery">Out for Delivery</option>
                            <option value="Delivered">Delivered</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" class="form-control" rows="4" required></textarea>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn track-btn">Update Tracking</button>
                </div>
            </form>
        </div>

        <%
            String orderId = request.getParameter("order_id");
            String userEmail = request.getParameter("user_email");
            String productName = request.getParameter("product_name");
            String orderDate = request.getParameter("order_date");
            String location = request.getParameter("location");
            String statusTitle = request.getParameter("status_title");
            String description = request.getParameter("description");

            if (orderId != null && userEmail != null && productName != null && orderDate != null && location != null && statusTitle != null && description != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendfurnish", "root", "root");

                    PreparedStatement check = con.prepareStatement("SELECT * FROM tracking WHERE order_id=? AND user_email=?");
                    check.setInt(1, Integer.parseInt(orderId));
                    check.setString(2, userEmail);
                    ResultSet rs = check.executeQuery();

                    if (rs.next()) {
                        PreparedStatement update = con.prepareStatement(
                            "UPDATE tracking SET product_name=?, order_date=?, location=?, status_title=?, description=? WHERE order_id=? AND user_email=?"
                        );
                        update.setString(1, productName);
                        update.setString(2, orderDate);
                        update.setString(3, location);
                        update.setString(4, statusTitle);
                        update.setString(5, description);
                        update.setInt(6, Integer.parseInt(orderId));
                        update.setString(7, userEmail);
                        update.executeUpdate();
                        out.println("<div class='alert alert-success alert-custom'>Tracking info updated successfully!</div>");
                    } else {
                        PreparedStatement insert = con.prepareStatement(
                            "INSERT INTO tracking(order_id, user_email, product_name, order_date, location, status_title, description) VALUES (?, ?, ?, ?, ?, ?, ?)"
                        );
                        insert.setInt(1, Integer.parseInt(orderId));
                        insert.setString(2, userEmail);
                        insert.setString(3, productName);
                        insert.setString(4, orderDate);
                        insert.setString(5, location);
                        insert.setString(6, statusTitle);
                        insert.setString(7, description);
                        insert.executeUpdate();
                        out.println("<div class='alert alert-success alert-custom'>Tracking info added successfully!</div>");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger alert-custom'>Error: " + e.getMessage() + "</div>");
                }
            }
        %>
    </div>
</body>
</html>
