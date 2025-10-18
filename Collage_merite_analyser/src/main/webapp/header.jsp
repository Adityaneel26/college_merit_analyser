<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Predictor</title>
    <%-- Link to our new central stylesheet --%>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Add this to your style.css file */
.logo-img {
  height: 50px;  /* Adjust this height as needed */
  width: auto;   /* This keeps the image's aspect ratio */
  display: block; /* Helps with layout */
}
.header {
  /* This is crucial for positioning the logo correctly */
  position: relative;
  
  /* Set a fixed height for your header */
  /* Adjust this '80px' to whatever height you want your header to be */
  height: 80px; 
  
  /* This helps align the navbar links vertically */
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px; /* Add some padding */
}

.logo {
  /* This div will act as the "anchor" for our image */
  /* It won't have a size itself, but it's needed for positioning */
  position: static;
}

.logo-img {
  /* This takes the image OUT of the page flow */
  position: absolute; 
  
  /* Set your desired height */
  height: 139px; 
  width: auto;   /* Keep assspect ratio */

  /* Position the image:
    'top: -50px' means it starts 50px ABOVE the header's top edge.
    'left: 20px' means it's 20px from the left side.
    
    ** YOU WILL NEED TO CHANGE -50px and 20px TO LOOK GOOD! **
  */
  top: -31px;  /* Adjust this negative value to move the logo up/down */
  left: 37px; /* Adjust this to move the logo left/right */

  /* This makes sure your logo appears on top of other elements */
  z-index: 100; 
}

.navbar {
  /* This ensures the navbar stays on the right side */
  margin-left: auto; 
}
    </style>
</head>
<body>

<header class="header">
    <div class="logo">
        <%-- 
          This now points to your logo image.
          I've also made it a link to home.jsp.
        --%>
        <a href="home.jsp">
            <img src="assets/Gemini_Generated_Image_vz49m4vz49m4vz49-removebg-preview.png" alt="College Predictor Logo" class="logo-img">
        </a>
    </div>
    <nav class="navbar">
        <%-- The link to Home MUST go to "/home" to run the servlet that loads locations --%>
        <%-- 
          NOTE: Your comment says to use "/home" but your link uses "home.jsp".
          I kept the logo link as "home.jsp" to match your navigation link.
          You might want to change BOTH links to "/home" if that servlet is required.
        --%>
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="contact.jsp">Contact</a>
    </nav>
</header>
