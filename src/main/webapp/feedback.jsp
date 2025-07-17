<%@include file="header.jsp"%>
<%@include file="connection.jsp"%>

<!-- Enhanced Feedback Section with modern design and #4e54c8 color scheme -->
<section class="py-5">
    <!-- Hero Banner with Gradient Overlay -->
    <div class="container-fluid px-0 mb-5">
        <div class="position-relative">
            <div id="feedbackCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/49.jpg" class="d-block w-100" alt="Feedback Banner" style="height: 500px; object-fit: cover;">
                        <div class="carousel-caption d-flex align-items-center justify-content-center h-100">
                            <div style="background: linear-gradient(135deg, rgba(78,84,200,0.85) 0%, rgba(44,48,115,0.9) 100%); padding: 2rem; border-radius: 8px; box-shadow: 0 5px 15px rgba(0,0,0,0.2);">
                                <h1 class="display-4 fw-bold text-white">Community Feedback</h1>
                                <p class="lead text-white mb-0">Discover what our members are saying</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Feedback Card Section with Stats Summary -->
        <div class="row mb-5">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow text-center" style="background-color: #4e54c8; color: white;">
                    <div class="card-body">
                        <i class="fas fa-comments fa-3x mb-3"></i>
                        <h3 class="mb-2">
                            <%
                            try {
                                PreparedStatement countPst = cn.prepareStatement("select count(*) from feedback");
                                ResultSet countRs = countPst.executeQuery();
                                if (countRs.next()) {
                                    out.println(countRs.getInt(1));
                                }
                            } catch (Exception ex) {
                                out.println("--");
                            }
                            %>
                        </h3>
                        <p class="mb-0">Total Reviews</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow text-center" style="background: linear-gradient(135deg, #4e54c8 0%, #8f94fb 100%); color: white;">
                    <div class="card-body">
                        <i class="fas fa-users fa-3x mb-3"></i>
                        <h3 class="mb-2">Community Voice</h3>
                        <p class="mb-0">Authentic Experiences</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow text-center" style="background-color: #4e54c8; color: white;">
                    <div class="card-body">
                        <i class="fas fa-heart fa-3x mb-3"></i>
                        <h3 class="mb-2">Join In</h3>
                        <p class="mb-0"><a href="user/feedback.jsp" class="btn btn-light mt-2">Add Your Feedback</a></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Feedback Cards with Improved Design -->
        <div class="row">
            <div class="col-lg-12 mx-auto">
                <div class="card border-0 shadow mb-4">
                    <div class="card-header bg-white py-3" style="border-left: 5px solid #4e54c8;">
                        <h2 class="card-title m-0 text-center fw-bold" style="color: #4e54c8;">What Our Community Says</h2>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-4 feedback-container">
                            <%
                            try {
                                PreparedStatement pst = cn.prepareStatement("select * from feedback");
                                ResultSet rs = pst.executeQuery();
                                boolean hasData = false;
                                while (rs.next()) {
                                    hasData = true;
                                    String em = rs.getString("emailid");
                                    String f1 = rs.getString("msg");
                                     %>
                            <!-- Individual Feedback Card with Improved Design -->
                            <div class="col-md-6 col-lg-4">
                                <div class="card h-100 border-0 shadow-sm hover-lift transition-300">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center mb-3">
                                            <div class="avatar-circle text-white d-flex align-items-center justify-content-center rounded-circle" 
                                                 style="width: 50px; height: 50px; background-color: #4e54c8; font-weight: bold; font-size: 1.2rem;">
                                                <%= em.substring(0, 1).toUpperCase() %>
                                            </div>
                                        </div>
                                        <div class="feedback-content">
                                            <p class="card-text"><%= f1 %></p>
                                        </div>
                                       </div>
                                </div>
                            </div>
                            <%
                                }
                                if (!hasData) {
                                    out.println("<div class='col-12 text-center py-5'><div class='alert alert-info'>No feedback has been submitted yet. Be the first to share your experience!</div></div>");
                                }
                            } catch (Exception ex) {
                                out.println("<div class='col-12'><div class='alert alert-danger'>Error retrieving feedback: " + ex.getMessage() + "</div></div>");
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Pagination for feedback entries -->
        <div class="row">
            <div class="col-12">
                <nav aria-label="Feedback page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#" style="background-color: #4e54c8; border-color: #4e54c8;">1</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#" style="color: #4e54c8;">2</a></li>
                        <li class="page-item"><a class="page-link" href="#" style="color: #4e54c8;">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" style="color: #4e54c8;">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- Custom Styles for Feedback Page -->
<style>
    .hover-lift {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .hover-lift:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(78, 84, 200, 0.15) !important;
    }
    .transition-300 {
        transition: all 0.3s ease;
    }
    .avatar-circle {
        box-shadow: 0 3px 8px rgba(78, 84, 200, 0.2);
    }
    .feedback-content {
        position: relative;
        padding: 0.5rem 0;
    }
    .feedback-content:before {
        content: "\201C";
        font-size: 3rem;
        position: absolute;
        left: -15px;
        top: -20px;
        color: rgba(78, 84, 200, 0.1);
        font-family: Georgia, serif;
    }
    .card-header {
        position: relative;
    }
    .pagination .page-link:focus {
        box-shadow: 0 0 0 0.25rem rgba(78, 84, 200, 0.25);
    }
</style>

<!-- Add Font Awesome if not already included in header -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>