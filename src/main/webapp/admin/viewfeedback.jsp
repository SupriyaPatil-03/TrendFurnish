<%@include file="header.jsp"%>
<%@include file="../connection.jsp"%>
<!-- Modern Feedback Section with improved responsiveness and design -->
<section class="py-5">
    <!-- Hero Banner with Overlay Text -->
    <div class="container-fluid px-0 mb-5">
        <div class="position-relative">
            <div id="feedbackCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/6.webp" class="d-block w-100" alt="Feedback Banner" style="height: 300px; object-fit: cover;">
                        <div class="carousel-caption d-flex align-items-center justify-content-center h-100">
                            <div class="bg-dark bg-opacity-50 p-4 rounded">
                                <h1 class="display-4 fw-bold text-white">Community Feedback</h1>
                                <p class="lead text-white">See what others are saying about us</p>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#feedbackCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#feedbackCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Feedback Cards Section -->
        <div class="row">
            <div class="col-lg-12 mx-auto" style="max-width: 1200px;">
                <div class="card border-0 shadow mb-4">
                    <div class="card-body text-center p-4">
                        <h2 class="card-title mb-4">What Our Community Says</h2>
                        <div class="feedback-container">
                            <%
                            try {
                                PreparedStatement pst = cn.prepareStatement("select * from feedback");
                                ResultSet rs = pst.executeQuery();
                                while (rs.next()) {
                                    String em = rs.getString("emailid");
                                    String f1 = rs.getString("msg");
                            %>
                            <!-- Individual Feedback Card -->
                            <div class="card mb-4 border-0 shadow-sm hover-shadow">
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="avatar-circle text-white bg-brown">
                                            <%= em.substring(0, 1).toUpperCase() %>
                                        </div>
                                        <div class="ms-3">
                                            <h5 class="mb-0" style="color: brown;"><%= em %></h5>
                                        </div>
                                    </div>
                                    <div class="feedback-content">
                                        <p class="card-text"><%= f1 %></p>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            } catch (Exception ex) {
                                out.println("<div class='alert alert-danger'>Error retrieving feedback: " + ex.getMessage() + "</div>");
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Custom CSS for feedback section -->
<style>
    .avatar-circle {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 18px;
    }

    .bg-brown {
        background-color: #8B4513 !important;
    }

    .hover-shadow {
        transition: all 0.3s ease;
    }

    .hover-shadow:hover {
        transform: translateY(-5px);
        box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
    }

    .feedback-content {
        text-align: left;
        line-height: 1.6;
    }

    @media (max-width: 768px) {
        .display-4 {
            font-size: 2rem;
        }
    }
</style>
