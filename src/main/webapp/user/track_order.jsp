<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Your Order - TrendFurnish</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Roboto', sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        
        .main-content {
            padding: 2rem 0;
            min-height: calc(100vh - 100px);
        }
        
        .page-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: #4e54c8;
            text-transform: uppercase;
            letter-spacing: 2px;
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
            background: #4e54c8;
            border-radius: 2px;
        }
        
        .tracking-form-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
            border: #4e54c8;
        }
        
        .form-row {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            font-weight: 600;
            color: #4e54c8;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 0.75rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #f39c12;
            box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25);
        }
        
        .track-btn {
            background: #4e54c8;
            border: none;
            color: white;
            padding: 0.75rem 2rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: #4e54c8;
        }
        
        .track-btn:hover {
            background: #4e54c8;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(243, 156, 18, 0.4);
        }
        
        /* Order Tracking Results */
        .order-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 2rem;
            border: 1px solid #e9ecef;
            animation: slideIn 0.6s ease-out;
        }
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .order-header {
            background: #4e54c8;
            color: white;
            padding: 1.5rem;
            font-size: 1.2rem;
            font-weight: 600;
        }
        
        .order-details {
            padding: 2rem;
        }
        
        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid #f8f9fa;
        }
        
        .detail-row:last-child {
            border-bottom: none;
        }
        
        .detail-label {
            font-weight: 600;
            color: #2c3e50;
            font-size: 0.95rem;
        }
        
        .detail-value {
            color: #555;
            font-weight: 500;
        }
        
        /* Tracking Timeline */
        .tracking-timeline {
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 0 0 15px 15px;
        }
        
        .timeline-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #4e54c8;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .timeline {
            position: relative;
            padding-left: 2rem;
        }
        
        .timeline::before {
            content: '';
            position: absolute;
            left: 15px;
            top: 0;
            bottom: 0;
            width: 3px;
            background: #4e54c8;
            border-radius: 2px;
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 2rem;
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-left: 4px solid #4e54c8;
        }
        
        .timeline-item::before {
            content: '';
            position: absolute;
            left: -31px;
            top: 50%;
            transform: translateY(-50%);
            width: 15px;
            height: 15px;
            background: #4e54c8;
            border: 3px solid white;
            border-radius: 50%;
            box-shadow: 0 0 0 3px #f39c12;
        }
        
        .timeline-item.completed::before {
            background: #c58c47;
            box-shadow: 0 0 0 3px #c58c47; 
        }
        
        .timeline-item.pending::before {
            background: #f39c12;
            box-shadow: 0 0 0 3px #f39c12;
        }
        
        .timeline-location {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }
        
        .timeline-status {
            color: #6c757d;
            margin-bottom: 0.5rem;
            text-transform: capitalize;
        }
        
        .timeline-date {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            text-transform: uppercase;
        }
        
        .status-pending {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffefc7;
        }
        
        .status-completed {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .status-shipped {
            background: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }
        
        /* Alert Messages */
        .alert-custom {
            border-radius: 10px;
            border: none;
            padding: 1.5rem;
            margin-top: 2rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            animation: slideIn 0.5s ease-out;
        }
        
        .alert-warning {
            background: #2fa5bd;
            color: white;
        }
        
        .alert-danger {
            background: #2fa5bd;
            color: white;
        }
        
        .alert-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
        }
        
        /* Loading Spinner */
        .loading-container {
            display: none;
            text-align: center;
            padding: 2rem;
        }
        
        .loading-spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #f39c12;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 0 auto 1rem;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .page-title {
                font-size: 2rem;
            }
            
            .tracking-form-card,
            .order-card {
                margin: 1rem;
            }
            
            .timeline {
                padding-left: 1.5rem;
            }
            
            .timeline::before {
                left: 10px;
            }
            
            .timeline-item::before {
                left: -26px;
            }
            
            .detail-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="container">
            <h1 class="page-title">Track My Order</h1>
            
            <!-- Tracking Form -->
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="tracking-form-card">
                        <form method="post" id="trackingForm">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="order_id">Order Number</label>
                                        <input type="number" 
                                               name="order_id" 
                                               id="order_id"
                                               class="form-control" 
                                               required
                                               placeholder="Enter order number">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email Address</label>
                                        <input type="email" 
                                               name="email" 
                                               id="email"
                                               class="form-control" 
                                               required
                                               placeholder="Enter your email">
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn track-btn">
                                    <i class="fas fa-search"></i> Track Order
                                </button>
                            </div>
                        </form>
                        
                        <div class="loading-container">
                            <div class="loading-spinner"></div>
                            <p>Searching for your order...</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <%
            String orderId = request.getParameter("order_id");
            String email = request.getParameter("email");
            
            if (orderId != null && email != null) {
                try {
                    int orderIDInt = Integer.parseInt(orderId);
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendfurnish", "root", "root");
                    PreparedStatement pst = con.prepareStatement("SELECT * FROM tracking WHERE order_id=? AND user_email=?");
                    pst.setInt(1, orderIDInt);
                    pst.setString(2, email);
                    ResultSet rs = pst.executeQuery();
                    
                    if (rs.next()) {
            %>
                        <!-- Order Found - Display Tracking Information -->
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <div class="order-card">
                                    <div class="order-header">
                                        <i class="fas fa-box"></i> Order No: <%= orderIDInt %>
                                    </div>
                                    
                                    <div class="order-details">
                                        <div class="detail-row">
                                            <span class="detail-label">Product Name:</span>
                                            <span class="detail-value"><%= rs.getString("product_name") %></span>
                                        </div>
                                        <div class="detail-row">
                                            <span class="detail-label">Order Date:</span>
                                            <span class="detail-value"><%= rs.getString("order_date") %></span>
                                        </div>
                                    </div>
                                    
                                    <div class="tracking-timeline">
                                        <h3 class="timeline-title">Tracking History</h3>
                                        <div class="timeline">
                                            <div class="timeline-item completed">
                                                <div class="timeline-location">
                                                    <i class="fas fa-map-marker-alt"></i> <%= rs.getString("location") %>
                                                </div>
                                                <div class="timeline-status">
                                                    Status: <span class="status-badge status-<%= rs.getString("status_title").toLowerCase() %>">
                                                        <%= rs.getString("status_title") %>
                                                    </span>
                                                </div>
                                                <div class="timeline-description">
                                                    <%= rs.getString("description") %>
                                                </div>
                                                <div class="timeline-date">
                                                    Updated: <%= rs.getString("updated_at") != null ? rs.getString("updated_at") : "N/A" %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            <%
                    } else {
            %>
                        <!-- No Order Found -->
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="alert alert-warning alert-custom text-center">
                                    <div class="alert-icon">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </div>
                                    <h4>Order Not Found</h4>
                                    <p class="mb-0">No tracking information found for Order #<%= orderIDInt %> with the provided email address. Please verify your order number and email, then try again.</p>
                                </div>
                            </div>
                        </div>
            <%
                    }
                    con.close();
                } catch (NumberFormatException nfe) {
            %>
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="alert alert-danger alert-custom text-center">
                                <div class="alert-icon">
                                    <i class="fas fa-times-circle"></i>
                                </div>
                                <h4>Invalid Order Number</h4>
                                <p class="mb-0">Please enter a valid numeric order number.</p>
                            </div>
                        </div>
                    </div>
            <%
                } catch (Exception e) {
            %>
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="alert alert-danger alert-custom text-center">
                                <div class="alert-icon">
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <h4>System Error</h4>
                                <p class="mb-0">An error occurred while processing your request: <%= e.getMessage() %></p>
                            </div>
                        </div>
                    </div>
            <%
                }
            }
            %>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Show loading spinner on form submit
        document.getElementById('trackingForm').addEventListener('submit', function() {
            document.querySelector('.loading-container').style.display = 'block';
        });
        
        // Add smooth scroll to results
        if (window.location.search.includes('order_id')) {
            setTimeout(() => {
                const orderCard = document.querySelector('.order-card, .alert-custom');
                if (orderCard) {
                    orderCard.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }, 300);
        }
    </script>
</body>
</html>