<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="connection.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us - TrendFurnish</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
<style>
  :root {
    --primary: #4e54c8;
    --secondary: #adc178;
    --light:  #FFFFFF;
    --dark: #432818;
    --accent: #d4a373;
  }

  body {
    font-family: 'Poppins', sans-serif;
    background-color: var(--light);
    color: #333;
  }

  .hero-section {
    background-color: var(--primary);
    color: white;
    padding: 100px 0;
    margin-bottom: 40px;
    text-align: center;
  }

  .form-section {
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    padding: 50px;
  }

  .form-control:focus {
    border-color: var(--secondary);
    box-shadow: 0 0 0 0.25rem rgba(173, 193, 120, 0.25);
  }

  .btn-primary {
    background-color: var(--primary);
    border-color: var(--primary);
  }

  .btn-primary:hover,
  .btn-primary:focus {
    background-color: var(--dark);
    border-color: var(--dark);
  }

  @media (min-width: 992px) {
    .col-lg-10 {
      max-width: 900px;
      margin: auto;
    }
  }

  .form-title {
    font-size: 2.2rem;
    font-weight: 600;
    color: var(--primary);
    margin-bottom: 30px;
    text-align: center;
  }
</style>

</head>
<body>

  <!-- Hero Section -->
  <div class="hero-section">
    <div class="container">
      <h1 class="display-4 fw-bold">Get In Touch</h1>
      <p class="lead">We're here to help you create the perfect living space</p>
    </div>
  </div>

  <!-- Contact Form Section -->
  <section class="bg-light py-3 py-md-4">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-10">
          <div class="form-section">
            <h2 class="form-title">Contact Us</h2>
            <form method="post">
              <div class="row gy-4 gy-xl-5">
                <div class="col-12">
                  <label for="fullname" class="form-label">Name <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="fullname" name="fullname" required>
                </div>
                <div class="col-12 col-md-6">
                  <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                    <input type="email" class="form-control" id="email" name="email" required>
                  </div>
                </div>
                <div class="col-12 col-md-6">
                  <label for="phone" class="form-label">Phone Number</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-phone"></i></span>
                    <input type="tel" class="form-control" id="phone" name="phone">
                  </div>
                </div>
                <div class="col-12">
                  <label for="message" class="form-label">Message <span class="text-danger">*</span></label>
                  <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                </div>
                <div class="col-12">
                  <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg" name="btnsub">Submit</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

<%
  if(request.getParameter("btnsub") != null){
    String nm = request.getParameter("fullname");
    String eml = request.getParameter("email");
    String pn = request.getParameter("phone");
    String d = request.getParameter("message");

    try {
      PreparedStatement pst = cn.prepareStatement("INSERT INTO contact VALUES(?,?,?,?)");
      pst.setString(1, nm);
      pst.setString(2, eml);
      pst.setString(3, pn);
      pst.setString(4, d);
      pst.executeUpdate();
      out.println("<script>alert('Thank you for contacting TrendFurnish! Our team will get back to you within 24 hours.')</script>");
    } catch(Exception ex) {
      ex.printStackTrace();
    }
  }
%>

</body>
</html>
