<%@page import="java.sql.*" %>
<%@include file="../connection.jsp"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrendFurnish - Product Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-bg: #f9fafb;
            --dark-bg: #34495e;
            --text-color: #333;
            --light-text: #ecf0f1;
            --border-radius: 10px;
            --box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e8edf2 100%);
            color: var(--text-color);
            padding-bottom: 50px;
        }
        
        .page-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .section-title {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            margin: 40px 0 30px;
            position: relative;
            padding-bottom: 15px;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, var(--secondary-color), var(--accent-color));
            border-radius: 2px;
        }
        
        /* Upload Form Styling */
        .upload-container {
            background: var(--light-bg);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            margin-bottom: 30px;
            border-top: 5px solid var(--secondary-color);
        }
        
        .upload-title {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .upload-form {
            padding: 20px;
            background: white;
            border-radius: var(--border-radius);
            border: 1px solid #eaeaea;
        }
        
        .custom-file-upload {
            display: block;
            width: 100%;
            padding: 15px;
            background: var(--light-bg);
            border: 2px dashed #ccc;
            border-radius: var(--border-radius);
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .custom-file-upload:hover {
            border-color: var(--secondary-color);
            background: #eef5fd;
        }
        
        .custom-file-upload i {
            font-size: 2rem;
            color: var(--secondary-color);
            margin-bottom: 10px;
        }
        
        input[type="file"] {
            display: none;
        }
        
        /* Product Form Styling */
        .product-form-container {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 30px;
            margin-bottom: 40px;
            border-top: 5px solid var(--primary-color);
        }
        
        .form-group label {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 8px;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #dde2e8;
            background-color: #f8fafc;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            background-color: white;
        }
        
        select.form-control {
            height: 48px;
        }
        
        .btn {
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }
        
        .btn-primary:hover {
            background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
            transform: translateY(-2px);
        }
        
        .btn-danger {
            background: linear-gradient(to right, #e74c3c, #c0392b);
            border: none;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }
        
        .btn-danger:hover {
            background: linear-gradient(to right, #c0392b, #e74c3c);
            transform: translateY(-2px);
        }
        
        .btn-success {
            background: linear-gradient(to right, #2ecc71, #27ae60);
            border: none;
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.3);
        }
        
        .btn-success:hover {
            background: linear-gradient(to right, #27ae60, #2ecc71);
            transform: translateY(-2px);
        }
        
        /* Table Styling */
        .table-container {
            background: white;
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            overflow: hidden;
        }
        
        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table th {
            background: linear-gradient(to right, var(--primary-color), var(--dark-bg));
            color: var(--light-text);
            padding: 15px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
            border: none;
        }
        
        .table th:first-child {
            border-top-left-radius: 8px;
        }
        
        .table th:last-child {
            border-top-right-radius: 8px;
        }
        
        .table td {
            padding: 15px;
            border-top: none;
            border-bottom: 1px solid #eaeaea;
            vertical-align: middle;
        }
        
        .table tbody tr:hover {
            background-color: #f8fafc;
        }
        
        .table img {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            object-fit: cover;
        }
        
        .table img:hover {
            transform: scale(1.1);
        }
        
        .action-links a {
            display: inline-block;
            padding: 8px 15px;
            margin: 2px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s ease;
        }
        
        .delete-link {
            background: var(--accent-color);
        }
        
        .update-link {
            background: var(--secondary-color);
        }
        
        .action-links a:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .product-form-container {
                padding: 20px;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .table-container {
                padding: 15px;
            }
            
            .table th, .table td {
                padding: 10px 8px;
                font-size: 0.9rem;
            }
            
            .action-links a {
                padding: 6px 10px;
                font-size: 0.75rem;
                display: block;
                margin-bottom: 5px;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<div class="page-container">
    <h1 class="section-title">Product Management</h1>
    
    <!-- Upload Image Form -->
    <div class="upload-container">
        <h2 class="upload-title"><i class="fas fa-cloud-upload-alt"></i> Upload Product Image</h2>
        <form action="upload.jsp" method="post" enctype="multipart/form-data" class="upload-form">
            <label for="file" class="custom-file-upload">
                <i class="fas fa-image"></i>
                <div>Select an image to upload</div>
                <small class="text-muted">Click here to browse files</small>
            </label>
            <input type="file" name="file" id="file" onchange="updateFileName(this)">
            
            <div id="file-selected" class="mt-3 text-center" style="display: none;">
                <span class="badge badge-primary p-2"></span>
            </div>
            
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-success">
                    <i class="fas fa-upload mr-2"></i>Upload Image
                </button>
            </div>
        </form>
    </div>
    
    <!-- Add Product Form -->
    <div class="product-form-container">
        <h2 class="upload-title"><i class="fas fa-plus-circle"></i> Add New Product</h2>
        <form id="frmreg" method="post" name="myForm" class="product-form">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="id"><i class="fas fa-fingerprint mr-2"></i>Product ID:</label>
                        <input type="text" name="id" id="id" class="form-control" placeholder="Enter Product ID" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name"><i class="fas fa-tag mr-2"></i>Product Name:</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Enter Product Name" required>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="brand"><i class="fas fa-building mr-2"></i>Brand:</label>
                        <input type="text" name="brand" id="brand" class="form-control" placeholder="Enter Brand" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="color"><i class="fas fa-palette mr-2"></i>Color:</label>
                        <input type="text" name="color" id="color" class="form-control" placeholder="Enter Color" required>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="dimensions"><i class="fas fa-ruler-combined mr-2"></i>Dimensions:</label>
                        <input type="text" name="dimensions" id="dimensions" class="form-control" placeholder="e.g. 120x60x75 cm" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="price"><i class="fas fa-rupee-sign mr-2"></i>Product Price:</label>
                        <input type="text" name="price" id="price" class="form-control" placeholder="Enter Product Price" required>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="type"><i class="fas fa-th-large mr-2"></i>Category:</label>
                <select name="type" id="type" class="form-control" required>
                    <option value="">--Select Category--</option>
                    <option value="Living Room">Living Room</option>
                    <option value="Dining Room">Dining Room</option>
                    <option value="Bed Room">Bed Room</option>
                    <option value="Office Furniture">Office Furniture</option>
                    <option value="Storage & Organization">Storage & Organization</option>
                </select>
            </div>
            
            <div class="form-group text-center mt-4">
                <button type="submit" class="btn btn-primary mr-3" name="btnsub">
                    <i class="fas fa-save mr-2"></i>Save Product
                </button>
                <button type="reset" class="btn btn-danger">
                    <i class="fas fa-undo mr-2"></i>Reset Form
                </button>
            </div>
        </form>
    </div>
    
    <!-- Product Table -->
    <h2 class="section-title">Available Furniture</h2>
    <div class="table-container">
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
                    <td>$<%= price %></td>
                    <td><img src="http://localhost:9090/TrendFurnish/images/<%= image %>" width="100" height="100"></td>
                    <td class="action-links">
                        <a href="up.jsp?id=<%= id %>" class="update-link"><i class="fas fa-edit mr-1"></i>Edit</a>
                        <a href="delete.jsp?id=<%= id %>" class="delete-link" onclick="return confirm('Are you sure you want to delete this product?')"><i class="fas fa-trash-alt mr-1"></i>Delete</a>
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
</div>

<%
if(request.getParameter("btnsub") != null){
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String brand = request.getParameter("brand");
    String color = request.getParameter("color");
    String dimensions = request.getParameter("dimensions");
    String price = request.getParameter("price");
    String cat = request.getParameter("type");
    String fn = (String) session.getAttribute("filepath");

    try {
        String q = "INSERT INTO product(id, name, brand, color, dimensions, price, category, productimg) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, id);
        pst.setString(2, name);
        pst.setString(3, brand);
        pst.setString(4, color);
        pst.setString(5, dimensions);
        pst.setString(6, price);
        pst.setString(7, cat);
        pst.setString(8, fn);
        pst.executeUpdate();

        out.println("<script>alert('Product added to Furniture Gallery Successfully');window.location='../gal.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>

<!-- JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Display file name when selected
    function updateFileName(input) {
        const fileSelected = document.getElementById('file-selected');
        if (input.files && input.files[0]) {
            const fileName = input.files[0].name;
            fileSelected.style.display = 'block';
            fileSelected.querySelector('.badge').textContent = fileName;
        } else {
            fileSelected.style.display = 'none';
        }
    }
    
    // Add row animation
    document.addEventListener('DOMContentLoaded', function() {
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach((row, index) => {
            row.style.opacity = '0';
            row.style.transform = 'translateX(-20px)';
            row.style.transition = `all 0.3s ease ${index * 0.05}s`;
            
            setTimeout(() => {
                row.style.opacity = '1';
                row.style.transform = 'translateX(0)';
            }, 100);
        });
    });
</script>
</body>
</html>