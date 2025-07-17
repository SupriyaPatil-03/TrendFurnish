<%@include file="header.jsp"%>
<%@include file="connection.jsp"%>

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
        min-height: 100vh;
    }

    .login-section {
        min-height: 100vh;
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .login-container {
        background: #fff;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        overflow: hidden;
        max-width: 1000px;
        width: 100%;
        position: relative;
    }

    .login-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 7px;
        background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
    }

    .login-image {
        background: linear-gradient(135deg, var(--light-color), #ffffff);
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 500px;
    }

    .login-image img {
        border-radius: var(--border-radius);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .login-form-section {
        padding: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .login-form-container {
        width: 100%;
        max-width: 400px;
    }

    .login-title {
        color: var(--dark-color);
        font-size: 1.8rem;
        font-weight: 600;
        margin-bottom: 30px;
        text-align: center;
        letter-spacing: 1px;
    }

    .form-group {
        margin-bottom: 25px;
    }

    .form-label {
        color: var(--dark-color);
        font-weight: 500;
        margin-bottom: 8px;
        display: block;
    }

    .form-control {
        width: 100%;
        padding: 12px 15px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s ease;
        background: #f8f9fa;
    }

    .form-control:focus {
        outline: none;
        border-color: var(--primary-color);
        background: #fff;
        box-shadow: 0 0 10px rgba(78, 84, 200, 0.1);
    }

    .btn-login {
        background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        border: none;
        padding: 12px 30px;
        border-radius: 8px;
        color: #fff;
        font-weight: 500;
        font-size: 16px;
        width: 100%;
        transition: 0.3s ease;
        cursor: pointer;
    }

    .btn-login:hover {
        background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
    }

    .forgot-password {
        color: #666;
        text-decoration: none;
        font-size: 14px;
        transition: 0.3s ease;
    }

    .forgot-password:hover {
        color: var(--primary-color);
        text-decoration: underline;
    }

    .register-link {
        text-align: center;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #e0e0e0;
    }

    .register-link p {
        color: #666;
        margin: 0;
    }

    .register-link a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 500;
        transition: 0.3s ease;
    }

    .register-link a:hover {
        color: var(--secondary-color);
        text-decoration: underline;
    }

    .error-message {
        background: #ffe6e6;
        color: #d8000c;
        padding: 10px;
        border-radius: 8px;
        text-align: center;
        margin-bottom: 20px;
        border: 1px solid #ffb3b3;
    }

    @media (max-width: 768px) {
        .login-image {
            display: none;
        }
        
        .login-form-section {
            padding: 30px 20px;
        }
        
        .login-title {
            font-size: 1.5rem;
        }
    }
</style>

<!-- Login Section -->
<section class="login-section">
    <div class="login-container">
        <div class="row g-0 h-100">
            <!-- Image Section -->
            <div class="col-md-6 login-image">
                <img src="<%=request.getContextPath()%>/images/5.jpg"
                     alt="login form"
                     class="img-fluid"
                     style="max-width: 80%; height: auto;" />
            </div>

            <!-- Form Section -->
            <div class="col-md-6 login-form-section">
                <div class="login-form-container">
                    <h2 class="login-title">Sign into your account</h2>

                    <%
                    // Display error message if login failed
                    if(request.getParameter("btnsub") != null) {
                        String email = request.getParameter("email");
                        String pass = request.getParameter("pass");
                        try {
                            PreparedStatement pst = cn.prepareStatement("select * from register where emailid=? and password=?");
                            pst.setString(1, email);
                            pst.setString(2, pass);
                            ResultSet result = pst.executeQuery();
                            if(result.next()) {
                                session.setAttribute("email", email);
                                out.println("<script>window.location='user/index.jsp'</script>");
                            } else {
                                out.println("<div class='error-message'><strong>Incorrect email or password</strong></div>");
                            }
                        } catch(Exception ex) {
                            out.println("<div class='error-message'><strong>Error: " + ex.getMessage() + "</strong></div>");
                        }
                    }
                    %>

                    <form method="post">
                        <!-- Email input -->
                        <div class="form-group">
                            <label class="form-label" for="email">Email address</label>
                            <input type="email" 
                                   name="email" 
                                   id="email" 
                                   class="form-control" 
                                   placeholder="Enter your email address" 
                                   required />
                        </div>

                        <!-- Password input -->
                        <div class="form-group">
                            <label class="form-label" for="pass">Password</label>
                            <input type="password" 
                                   id="pass" 
                                   class="form-control" 
                                   placeholder="Enter password" 
                                   name="pass" 
                                   required />
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn-login" name="btnsub">Login</button>
                        </div>

                        <div class="text-center">
                            <a class="forgot-password" href="#!">Forgot password?</a>
                        </div>

                        <div class="register-link">
                            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>