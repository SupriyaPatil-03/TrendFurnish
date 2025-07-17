<%@page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Records</title>
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

        .print-btn {
            padding: 8px 15px;
            border-radius: 6px;
            font-size: 0.85rem;
        }

        .print-all-btn {
            margin-bottom: 20px;
            padding: 10px 25px;
            font-size: 0.95rem;
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
        <h1><img src="images/16.png" alt="Logo"> TrendFurnish - Feedback Records</h1>

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

        <button class="btn print-all-btn mb-3" onclick="printAll()"><i class="fas fa-print"></i> Print All Records</button>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Email ID</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        String query = "SELECT * FROM feedback";
                        PreparedStatement pst = cn.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                            String email = rs.getString("emailid");
                            String msg = rs.getString("msg");
                %>
                <tr>
                    <td><%= email %></td>
                    <td><%= msg %></td>
                    <td><button class="btn btn-primary print-btn" onclick="printRow(this)"><i class="fas fa-print"></i> Print</button></td>
                </tr>
                <% } } catch (Exception ex) { out.println("<tr><td colspan='3'>" + ex + "</td></tr>"); } %>
            </tbody>
        </table>
    </div>

    <script>
        function printRow(button) {
            var row = button.closest('tr');
            var cells = row.getElementsByTagName('td');

            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write('<html><head><title>Print Feedback</title>');
            printWindow.document.write('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">');
            printWindow.document.write('</head><body>');
            printWindow.document.write('<div class="container mt-5"><h2>Feedback Details</h2>');
            printWindow.document.write('<table class="table table-bordered">');
            printWindow.document.write('<tr><th>Email ID</th><td>' + cells[0].innerText + '</td></tr>');
            printWindow.document.write('<tr><th>Message</th><td>' + cells[1].innerText + '</td></tr>');
            printWindow.document.write('</table></div></body></html>');
            printWindow.document.close();
            printWindow.print();
        }

        function printAll() {
            var rows = document.querySelectorAll("table tbody tr");
            var printWindow = window.open('', '', 'height=800,width=1000');
            printWindow.document.write('<html><head><title>Print All Feedback</title>');
            printWindow.document.write('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">');
            printWindow.document.write('</head><body>');
            printWindow.document.write('<div class="container mt-5"><h2>All Feedback</h2>');
            printWindow.document.write('<table class="table table-bordered"><thead><tr><th>Email ID</th><th>Message</th></tr></thead><tbody>');

            rows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                printWindow.document.write('<tr>');
                printWindow.document.write('<td>' + cells[0].innerText + '</td>');
                printWindow.document.write('<td>' + cells[1].innerText + '</td>');
                printWindow.document.write('</tr>');
            });

            printWindow.document.write('</tbody></table></div></body></html>');
            printWindow.document.close();
            printWindow.print();
        }
    </script>
</body>
</html>
