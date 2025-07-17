<%@page import="java.sql.*" %>
<%@include file="../connection.jsp" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e54c8;
            --secondary-color: #8f94fb;
            --light-color: #f5f7ff;
            --dark-color: #2c3e50;
            --box-shadow: 0 8px 20px rgba(78, 84, 200, 0.15);
            --border-radius: 12px;
        }
        
        body {
            background: linear-gradient(135deg, var(--light-color) 0%, #ffffff 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #444;
            min-height: 100vh;
            padding-bottom: 40px;
        }
        
        .container {
            max-width: 1100px;
            background: #fff;
            padding: 35px;
            margin-top: 50px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
            overflow: hidden;
        }
        
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 7px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        }
        
        h1 {
            color: var(--dark-color);
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 35px;
            position: relative;
            font-weight: 600;
            padding-bottom: 15px;
        }
        
        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border-radius: 2px;
        }
        
        h1 img {
            height: 40px;
            margin-right: 15px;
            vertical-align: middle;
        }
        
        .form-inline {
            background: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .form-control {
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            padding: 10px 15px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(78, 84, 200, 0.25);
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary, .print-btn, .print-all-btn {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
            box-shadow: 0 4px 10px rgba(78, 84, 200, 0.3);
        }
        
        .btn-primary:hover, .print-btn:hover, .print-all-btn:hover {
            background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
        }
        
        .table {
            border-collapse: collapse;
            border: 2px solid #000000;
            border-spacing: 0;
            border-radius: 0;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .thead-dark th {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: #fff;
            border: 1px solid #000000;
            padding: 15px;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9rem;
        }
        
        .table td {
            padding: 15px;
            vertical-align: middle;
            border: 1px solid #000000;
            font-size: 0.95rem;
        }
        
        .table tbody tr:hover {
            background-color: #f8f9ff;
        }
        
        .table tbody tr:last-child td {
            border-bottom: none;
        }
        
        .print-btn {
            padding: 8px 15px;
            border-radius: 6px;
            font-size: 0.85rem;
        }
        
        .print-btn i {
            margin-right: 5px;
        }
        
        .print-all-btn {
            margin-bottom: 20px;
            padding: 10px 25px;
            font-size: 0.95rem;
        }
        
        .print-all-btn i {
            margin-right: 8px;
        }
        
        /* Modified print styles to hide date filter section */
        @media print {
            .print-btn, 
            .print-all-btn, 
            .date-filter-section,
            .filter-results-btn {
                display: none !important;
            }
            
            body {
                font-size: 12px;
                margin: 0;
                background: white;
            }
            
            .container {
                box-shadow: none;
                margin-top: 0;
                padding-top: 10px;
            }
            
            .table {
                box-shadow: none;
                border: 2px solid #000000 !important;
                border-collapse: collapse !important;
            }
            
            .table th, .table td {
                border: 1px solid #000000 !important;
            }
            
            /* Add margin for better spacing in print */
            h1 {
                margin-top: 10px;
            }
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin-top: 20px;
            }
            h1 {
                font-size: 1.8rem;
            }
            .form-inline {
                flex-direction: column;
                align-items: stretch;
            }
            .form-inline .form-control {
                margin-right: 0;
                margin-bottom: 10px;
            }
            .table td, .table th {
                padding: 10px;
            }
        }
        
        .total-count {
            font-weight: bold;
            margin-top: 20px;
            font-size: 1.1rem;
            text-align: right;
        }
    </style>
    <script>
        function printReport() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="container" id="printableArea">
        <h1><img src="images/16.png" alt="Logo"> TrendFurnish - Registration Report</h1>
        
         <!-- Date Filter Form - Added class to target in print CSS -->
        <div class="d-flex justify-content-center mb-4 date-filter-section">
            <form method="post" class="form-inline w-100">
                <div class="row w-100 align-items-center">
                    <div class="col-md-4 mb-2 mb-md-0">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                            </div>
                            <input type="date" name="startDate" class="form-control" required placeholder="From Date">
                        </div>
                    </div>
                    <div class="col-md-4 mb-2 mb-md-0">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                            </div>
                            <input type="date" name="endDate" class="form-control" required placeholder="To Date">
                        </div>
                    </div>
                    <div class="col-md-4 text-center text-md-right">
                        <button type="submit" name="btnsub" class="btn btn-primary w-100 filter-results-btn">
                            <i class="fas fa-search"></i> Filter Results
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <button onclick="printReport()" class="btn print-all-btn mb-3">
            <i class="fas fa-print"></i> Print All Records
        </button>
        
        <%
            String n, a, g, con, e;
            int totalCount = 0;
            try {
                PreparedStatement pst = cn.prepareStatement("SELECT * FROM register");
                ResultSet rs = pst.executeQuery();
        %>
        <table class="table" style="border: 2px solid #000000; border-collapse: collapse;">
            <thead class="thead-dark">
                <tr>
                    <th style="border: 1px solid #000000;">Sr No.</th>
                    <th style="border: 1px solid #000000;">Name</th>
                    <th style="border: 1px solid #000000;">Address</th>
                    <th style="border: 1px solid #000000;">Gender</th>
                    <th style="border: 1px solid #000000;">Contact No</th>
                    <th style="border: 1px solid #000000;">Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int srNo = 1;
                    while (rs.next()) {
                        n = rs.getString("name");
                        a = rs.getString("address");
                        g = rs.getString("gender");
                        con = rs.getString("contact");
                        e = rs.getString("emailid");
                        totalCount++;
                %>
                <tr>
                    <td style="border: 1px solid #000000;"><%= srNo++ %></td>
                    <td style="border: 1px solid #000000;"><%= n %></td>
                    <td style="border: 1px solid #000000;"><%= a %></td>
                    <td style="border: 1px solid #000000;"><%= g %></td>
                    <td style="border: 1px solid #000000;"><%= con %></td>
                    <td style="border: 1px solid #000000;"><%= e %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="total-count">Total Registered Users: <%= totalCount %></div>

        <%
            } catch (Exception ex) {
                out.println("<div class='text-danger'>Error: " + ex.getMessage() + "</div>");
            }
        %>
    </div>
</body>
</html>