<%@page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>
<%@include file="header.jsp"%>
<%
    int amt = 0;
    if (request.getParameter("amount") != null) {
        try {
            amt = Integer.parseInt(request.getParameter("amount"));
        } catch (NumberFormatException e) {
            out.println("<script>alert('Invalid amount format');</script>");
        }
    }
%>

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
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .thead-dark th {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: #fff;
            border: none;
            padding: 15px;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9rem;
        }
        
        .table td {
            padding: 15px;
            vertical-align: middle;
            border-top: 1px solid #f0f0f0;
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
        
        @media print {
            .print-btn, .print-all-btn, form {
                display: none;
            }
            body {
                font-size: 12px;
                margin: 0;
                background: white;
            }
            .container {
                box-shadow: none;
                margin-top: 0;
            }
            .table {
                box-shadow: none;
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
    </style>
</head>
<body>
    <div class="container">
        <h1><img src="images/16.png" alt="Logo" style="height: 35px; margin-right: 10px;"> TrendFurnish - Payment Records</h1>
        
        <!-- Date Filter Form -->
        <div class="d-flex justify-content-center mb-4">
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
                        <button type="submit" name="btnsub" class="btn btn-primary w-100">
                            <i class="fas fa-search"></i> Filter Results
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <button class="btn print-all-btn mb-3">
            <i class="fas fa-print"></i> Print All Records
        </button>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Amount</th>
                    <th>Method</th>
                    <th>Email</th>
                    <th>Order Number</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        String query = "SELECT * FROM payment";
                        if (request.getParameter("btnsub") != null) {
                            query = "SELECT * FROM payment WHERE payment_date BETWEEN ? AND ?";
                        }

                        PreparedStatement pst = cn.prepareStatement(query);

                        if (request.getParameter("btnsub") != null) {
                            pst.setString(1, request.getParameter("startDate"));
                            pst.setString(2, request.getParameter("endDate"));
                        }

                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                            String amount = rs.getString("amount");
                            String method = rs.getString("method");
                            String email = rs.getString("email");
                            String ordno = rs.getString("ordno");
                %>
                <tr>
                    <td><%= amount %></td>
                    <td><%= method %></td>
                    <td><%= email %></td>
                    <td><%= ordno %></td>
                    <td><button class="btn btn-primary print-btn" onclick="printRow(this)"><i class="fas fa-print"></i> Print</button></td>
                </tr>
                <% } } catch (Exception ex) { out.println("<tr><td colspan='6'>" + ex + "</td></tr>"); } %>
            </tbody>
        </table>
    </div>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Fix the print functions to match the new structure
            document.querySelector('.print-all-btn').addEventListener('click', printAll);
            
            // Add animation to table rows
            const tableRows = document.querySelectorAll('tbody tr');
            tableRows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateY(20px)';
                row.style.transition = `all 0.3s ease ${index * 0.05}s`;
                
                setTimeout(() => {
                    row.style.opacity = '1';
                    row.style.transform = 'translateY(0)';
                }, 100);
            });
        });
        
        function printRow(button) {
            var row = button.closest('tr');
            var cells = row.getElementsByTagName('td');

            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write('<html><head><title>Print Payment</title>');
            printWindow.document.write('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">');
            printWindow.document.write('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">');
            printWindow.document.write('<style>');
            printWindow.document.write('body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; padding: 20px; }');
            printWindow.document.write('.container { max-width: 700px; margin: 0 auto; padding: 30px; box-shadow: 0 0 20px rgba(0,0,0,0.1); border-radius: 10px; }');
            printWindow.document.write('h2 { color: #4e54c8; text-align: center; margin-bottom: 30px; padding-bottom: 15px; border-bottom: 2px solid #eee; }');
            printWindow.document.write('table { width: 100%; border-collapse: collapse; }');
            printWindow.document.write('th { background-color: #f8f9fa; text-align: left; padding: 12px; }');
            printWindow.document.write('td { padding: 12px; border-top: 1px solid #eee; }');
            printWindow.document.write('</style>');
            printWindow.document.write('</head><body>');
            printWindow.document.write('<div class="container">');
            printWindow.document.write('<h2><i class="fas fa-file-invoice-dollar"></i> Payment Details</h2>');
            printWindow.document.write('<table class="table table-bordered">');
            printWindow.document.write('<tr><th>Amount</th><td>' + cells[0].innerText + '</td></tr>');
            printWindow.document.write('<tr><th>Method</th><td>' + cells[1].innerText + '</td></tr>');
            printWindow.document.write('<tr><th>Email</th><td>' + cells[2].innerText + '</td></tr>');
            printWindow.document.write('<tr><th>Order Number</th><td>' + cells[3].innerText + '</td></tr>');
            printWindow.document.write('</table>');
            printWindow.document.write('<div class="text-center mt-4" style="color: #999; font-size: 0.9rem;">Generated on ' + new Date().toLocaleString() + '</div>');
            printWindow.document.write('</div></body></html>');
            printWindow.document.close();
            printWindow.print();
        }

        function printAll() {
            var rows = document.querySelectorAll("table tbody tr");
            var printWindow = window.open('', '', 'height=800,width=1000');
            printWindow.document.write('<html><head><title>Print All Payments</title>');
            printWindow.document.write('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">');
            printWindow.document.write('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">');
            printWindow.document.write('<style>');
            printWindow.document.write('body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; padding: 20px; }');
            printWindow.document.write('h2 { color: #4e54c8; text-align: center; margin-bottom: 30px; padding-bottom: 15px; border-bottom: 2px solid #eee; }');
            printWindow.document.write('table { width: 100%; border-collapse: collapse; margin-top: 20px; }');
            printWindow.document.write('th { background: linear-gradient(to right, #4e54c8, #8f94fb); color: white; padding: 12px; text-align: left; }');
            printWindow.document.write('td { padding: 12px; border-top: 1px solid #eee; }');
            printWindow.document.write('tr:nth-child(even) { background-color: #f8f9fa; }');
            printWindow.document.write('</style>');
            printWindow.document.write('</head><body>');
            printWindow.document.write('<div class="container mt-5">');
            printWindow.document.write('<h2><i class="fas fa-file-invoice-dollar"></i> All Payment Records</h2>');
            printWindow.document.write('<table class="table table-bordered">');
            printWindow.document.write('<thead><tr><th>Amount</th><th>Method</th><th>Email</th><th>Order Number</th></tr></thead><tbody>');

            rows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                printWindow.document.write('<tr>');
                for (var i = 0; i < cells.length - 1; i++) {
                    printWindow.document.write('<td>' + cells[i].innerText + '</td>');
                }
                printWindow.document.write('</tr>');
            });

            printWindow.document.write('</tbody></table>');
            printWindow.document.write('<div class="text-center mt-4" style="color: #999; font-size: 0.9rem;">Generated on ' + new Date().toLocaleString() + '</div>');
            printWindow.document.write('</div></body></html>');
            printWindow.document.close();
            printWindow.print();
        }
    </script>
</body>
</html>