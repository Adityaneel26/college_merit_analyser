<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- This line includes your standard website header --%>
<jsp:include page="header.jsp" />

<main class="main-content">
    <div class="content-page">
        <h1>Get in Touch</h1>
        <p>
            We'd love to hear from you! Whether you have a question about our features, feedback on our predictor, 
            or a suggestion for a new feature, our team is ready to answer all your questions.
        </p>

        <%-- A simple list for contact details --%>
        <h2>Our Contact Information</h2>
        <ul>
            <li><strong>Email:</strong> support@collegepredictor.com</li>
            <li><strong>Phone:</strong> +91 12345 67890</li>
            <li><strong>Address:</strong> Tech Park, Ahmedabad, Gujarat</li>
        </ul>

        <%-- A professional-looking contact form --%>
        <form action="#" method="post" class="contact-form">
            <h2>Send Us a Message</h2>
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" required>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn">Send Message</button>
        </form>
    </div>
</main>

<%-- This line includes your standard website footer --%>
<jsp:include page="footer.jsp" />