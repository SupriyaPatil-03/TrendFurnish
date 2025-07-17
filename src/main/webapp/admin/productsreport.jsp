<%@include file="../connection.jsp" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Report</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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
            background: linear-gradient(135deg, var(--light-color), #ffffff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #444;
            padding-bottom: 40px;
        }

        .container {
            max-width: 1100px;
            background: #fff;
            padding: 35px;
            margin-top: 50px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
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

        h3 {
            color: var(--dark-color);
            font-size: 2.2rem;
            text-align: center;
            font-weight: 600;
            margin-bottom: 30px;
            position: relative;
        }

        h3 img {
            height: 40px;
            margin-right: 10px;
            vertical-align: middle;
        }

        form {
            background: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .form-select {
            width: 300px;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            color: #fff;
            transition: 0.3s ease;
            font-weight: 500;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
        }

        .table {
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .thead-dark th {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: #fff;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
            padding: 15px;
            font-size: 0.95rem;
        }

        .table tbody tr:hover {
            background-color: #f8f9ff;
        }

        .total-count {
            font-weight: bold;
            text-align: right;
            padding: 15px;
            color: var(--dark-color);
        }

        .btn-secondary {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 10px 25px;
            font-weight: 500;
            border: none;
            border-radius: 8px;
            transition: 0.3s ease;
            display: block;
            margin: 20px auto 0 auto;
        }

        .btn-secondary:hover {
            background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
        }

        @media print {
            .btn, form {
                display: none;
            }
            .table td, .table th {
                font-size: 12px;
                padding: 8px;
            }
            body {
                background: #fff;
                font-size: 12px;
            }
        }
    </style>
    <script>
        function printReport() {
            var printContent = document.getElementById('printableArea').innerHTML;
            var originalContent = document.body.innerHTML;
            document.body.innerHTML = printContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>
</head>
<body>
    <div class="container">
        <div id="printableArea">
            <h3><img src="images/16.png" alt="Logo"> TrendFurnish - Products Report</h3>

            <!-- Filter Form -->
            <form method="post" class="d-flex justify-content-center align-items-center gap-3 flex-wrap">
                <select name="category" id="category" class="form-select" required>
                    <option value="">-- Select Category --</option>
                    <option value="All">All Products</option>
                    <option value="Living Room">Living Room</option>
                    <option value="Dining Room">Dining Room</option>
                    <option value="Bed Room">Bed Room</option>
                    <option value="Office Furniture">Office Furniture</option>
                    <option value="Storage & Organization">Storage & Organization</option>
                </select>
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>

            <% 
            String categoryFilter = request.getParameter("category");
            String name, price, category, image;
            int totalCount = 0;

            if (request.getMethod().equalsIgnoreCase("post") && categoryFilter != null) {
                try {
                    PreparedStatement pst;
                    if ("All".equals(categoryFilter)) {
                        pst = cn.prepareStatement("SELECT * FROM product");
                    } else {
                        pst = cn.prepareStatement("SELECT * FROM product WHERE category = ?");
                        pst.setString(1, categoryFilter);
                    }
                    ResultSet rs = pst.executeQuery();
            %>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Sr No.</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Category</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int srNo = 1;
                        while (rs.next()) {
                            name = rs.getString("name");
                            price = rs.getString("price");
                            category = rs.getString("category");
                            image = rs.getString("productimg");
                            totalCount++;
                        %>
                        <tr>
                            <td><%= srNo++ %></td>
                            <td><%= name %></td>
                            <td><%= price %></td>
                            <td><%= category %></td>
                            <td><img src="http://localhost:9090/TrendFurnish/images/<%= image %>" width="50" height="50"></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <div class="total-count">Total Products: <%= totalCount %></div>
            </div>

            <button onclick="printReport()" class="btn btn-secondary"><i class="fas fa-download"></i> Download PDF</button>

            <% 
                } catch (Exception ex) {
                    out.println("<div class='alert alert-danger'>Error: " + ex.getMessage() + "</div>");
                }
            }
            %>
        </div>
    </div>
</body>
</html>
