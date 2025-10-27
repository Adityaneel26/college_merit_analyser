<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- This includes your standard website header --%>
<jsp:include page="header.jsp" />

<%-- We can add a little specific style for this page's list --%>
<style>
    .steps-list {
        list-style-type: none; /* Removes default bullets */
        padding-left: 0;
    }
    .step-item {
        margin-bottom: 2rem;
        padding-left: 3.5rem;
        position: relative;
    }
    /* This creates the cool step number circle */
    .step-item::before {
        content: counter(step-counter);
        counter-increment: step-counter;
        position: absolute;
        left: 0;
        top: 0;
        font-size: 1.2rem;
        font-weight: 700;
        color: white;
        background: #8e44ad; /* Main theme color */
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .step-title {
        font-weight: 600;
        color: #34495e;
        font-size: 1.15rem;
        margin-bottom: 0.3rem;
    }
    .step-description {
        color: #555;
        line-height: 1.7;
    }
</style>

<main class="main-content">
    <div class="content-page">
        <h1>How It Works</h1>
        <p>
            Our predictor makes finding your college simple. We use a smart, 3-step process to give you 
            the most relevant results based on your rank.
        </p>

        <ol class="steps-list">
            <li class="step-item">
                <h3 class="step-title">Enter Your DDCET Rank</h3>
                <p class="step-description">
                    First, you provide your official DDCET merit rank. This is the most important piece 
                    of data we use to find your matching colleges.
                </p>
            </li>
            
            <li class="step-item">
                <h3 class="step-title">Select a Location (Optional)</h3>
                <p class="step-description">
                    Next, you can choose a specific city from the dropdown. Our system dynamically 
                    loads these cities from our database. If you want to see all possibilities 
                    across Gujarat, just leave it as "All Locations".
                </p>
            </li>

            <li class="step-item">
                <h3 class="step-title">Get Filtered, Relevant Results</h3>
                <p class="step-description">
                    We take your rank and find all colleges where you are eligible (your rank is between 
                    the opening and closing ranks). Then, we smartly filter that list to only show 
                    colleges with a closing rank *near* your rank, sorted to show the closest matches first.
                </p>
            </li>
        </ol>

    </div>
</main>

<%-- This includes your standard website footer --%>
<jsp:include page="footer.jsp" />
