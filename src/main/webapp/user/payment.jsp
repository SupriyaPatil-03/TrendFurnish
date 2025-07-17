<%@page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>

<%
int amt = 0;
if (request.getParameter("amount") != null) {
    try {
        amt = Integer.parseInt(request.getParameter("amount"));
    } catch (NumberFormatException e) {
        // Handle parsing error
        out.println("<script>alert('Invalid amount format');</script>");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #5068a9;
            --secondary-color: #f8f9fa;
            --accent-color: #28a745;
            --danger-color: #dc3545;
            --text-color: #212529;
            --light-grey: #e9ecef;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: var(--text-color);
            line-height: 1.6;
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            color: var(--primary-color);
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .header p {
            color: #6c757d;
        }
        
        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--box-shadow);
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 15px 20px;
            font-size: 1.2rem;
            font-weight: 600;
        }
        
        .card-body {
            padding: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #495057;
        }
        
        .input-group {
            display: flex;
            border: 1px solid #ced4da;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .input-group-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--light-grey);
            padding: 0 15px;
            color: #6c757d;
        }
        
        .form-control {
            flex: 1;
            padding: 12px 15px;
            border: none;
            font-size: 1rem;
            outline: none;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 2px rgba(80, 104, 169, 0.25);
        }
        
        .form-control.readonly {
            background-color: var(--light-grey);
        }
        
        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }
        
        .delivery-method {
            display: flex;
            align-items: center;
            padding: 15px;
            background-color: var(--secondary-color);
            border-radius: 5px;
            margin-bottom: 20px;
        }
        
        .delivery-method i {
            color: var(--primary-color);
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .delivery-method h5 {
            margin: 0;
            font-size: 1rem;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            flex: 1;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #405694;
        }
        
        .btn-danger {
            background-color: var(--danger-color);
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #c82333;
        }
        
        .order-summary {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .order-summary h3 {
            margin-bottom: 10px;
            color: var(--primary-color);
        }
        
        .order-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #e9ecef;
            padding: 10px 0;
        }
        
        .order-total {
            display: flex;
            justify-content: space-between;
            font-weight: 700;
            font-size: 1.1rem;
            padding-top: 10px;
            color: var(--primary-color);
        }
        
        .badge {
            background-color: #5068a9;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            margin-left: 10px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .header h1 {
                font-size: 1.8rem;
            }
            
            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Complete Your Order</h1>
        <p>Please review and confirm your order details</p>
    </div>

    <div class="card">
        <div class="card-header">
            Payment Details
        </div>
        <div class="card-body">
            <form id="paymentForm" method="post" name="myForm" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="amount">Total Amount</label>
                    <div class="input-group">
                        <div class="input-group-icon">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <input id="amount" type="text" class="form-control readonly" name="amount" value="<%= amt %>" required readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="address">Delivery Address</label>
                    <div class="input-group">
                        <div class="input-group-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <textarea id="address" name="address" class="form-control" placeholder="Enter complete delivery address including city, state and ZIP code" required></textarea>
                    </div>
                </div>
                
                <div class="delivery-method">
                    <i class="fas fa-truck"></i>
                    <h5>Cash On Delivery <span class="badge">Only available payment method</span></h5>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">
                        <i class="fas fa-check"></i> Place Order
                    </button>
                    <button type="reset" class="btn btn-danger" id="btnres">
                        <i class="fas fa-times"></i> Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function validateForm() {
    const addressField = document.getElementById('address');
    if (addressField.value.trim().length < 10) {
        alert("Please enter a complete delivery address (at least 10 characters)");
        addressField.focus();
        return false;
    }
    return true;
}
</script>

<%
if (request.getParameter("btnsub") != null) {
    String u = (String) session.getAttribute("email");

    // Check if user is logged in
    if (u == null) {
        out.println("<script>alert('User not logged in. Please log in first.');window.location='login.jsp'</script>");
        return;
    }

    String paymentMethod = "Cash on Delivery";
    int amount = Integer.parseInt(request.getParameter("amount"));
    String address = request.getParameter("address").trim();

    // Get current date
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String orderDate = formatter.format(date);

    try {
        // Start database transaction
        cn.setAutoCommit(false);

        // Insert into ordermst table
        PreparedStatement pst = cn.prepareStatement("INSERT INTO ordermst (odt, email, amount) VALUES (?, ?, ?)");
        pst.setString(1, orderDate);
        pst.setString(2, u);
        pst.setInt(3, amount);
        pst.executeUpdate();

        // Retrieve the last inserted order number (ordno)
        int ono = 0;
        PreparedStatement pst1 = cn.prepareStatement("SELECT max(ordno) from ordermst");
        ResultSet rs = pst1.executeQuery();
        if (rs.next()) {
            ono = rs.getInt(1);
        }

        // Insert order details for each item in the cart (buy table)
        PreparedStatement pst2 = cn.prepareStatement("SELECT * FROM cart WHERE email=?");
        pst2.setString(1, u);
        ResultSet rs1 = pst2.executeQuery();
        while (rs1.next()) {
            String id = rs1.getString("id");
            String quantity = rs1.getString("quantity");
            PreparedStatement pst3 = cn.prepareStatement("INSERT INTO orderdet (ordno, id, quantity) VALUES (?, ?, ?)");
            pst3.setInt(1, ono);
            pst3.setString(2, id);
            pst3.setInt(3, Integer.parseInt(quantity));
            pst3.executeUpdate();
        }

        // Clear the cart after placing the order
        PreparedStatement pst4 = cn.prepareStatement("DELETE FROM cart WHERE email=?");
        pst4.setString(1, u);
        pst4.executeUpdate();
     // Insert into payment table
        PreparedStatement pst5 = cn.prepareStatement("INSERT INTO payment (amount, method, address, email, ordno, payment_date) VALUES (?, ?, ?, ?, ?, ?)");
        pst5.setInt(1, amount);
        pst5.setString(2, paymentMethod);
        pst5.setString(3, address);
        pst5.setString(4, u);
        pst5.setInt(5, ono);

        // Fix for timestamp: use fully qualified class names to avoid ambiguity
        pst5.setTimestamp(6, new java.sql.Timestamp(new java.util.Date().getTime()));

        pst5.executeUpdate();

        // Commit transaction
        cn.commit();

        out.println("<script>alert('Thank you for your order! Your order has been placed successfully.');window.location='delivery.jsp?ono=" + ono + "'</script>");
    } catch (Exception ex) {
        // Rollback in case of error
        cn.rollback();
        out.println("<script>alert('Error occurred: " + ex.getMessage().replace("'", "\\'") + "');</script>");
    }
}
%>

</body>
</html>