
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- This includes your standard website header --%>
<jsp:include page="header.jsp" />

<%-- 
    We add a little bit of specific style for the FAQ page.
    This doesn't change any other file.
--%>
<style>
    .faq-item {
        margin-bottom: 1.5rem;
        border-bottom: 1px solid #eee;
        padding-bottom: 1.5rem;
    }
    .faq-question {
        font-weight: 600;
        color: #34495e;
        font-size: 1.1rem;
        margin-bottom: 0.5rem;
    }
    .faq-answer {
        color: #555;
        line-height: 1.7;
    }
</style>

<main class="main-content">
    <div class="content-page">
        <h1>Frequently Asked Questions</h1>
        
        <div class="faq-item">
            <h3 class="faq-question">1. How accurate is this college predictor?</h3>
            <p class="faq-answer">
                This predictor uses the official DDCET cutoff data from the previous year. It provides a very strong
                estimate of which colleges you are eligible for based on your rank. However, cutoff ranks can
                change slightly each year based on student demand and exam difficulty.
            </p>
        </div>

        <div class="faq-item">
            <h3 class="faq-question">2. Does this predictor guarantee me a seat?</h3>
            <p class="faq-answer">
                No. This tool is for informational purposes only. It is designed to help you build a smart list of
                choices for the actual counseling process. Admission is only guaranteed by the official admission committee.
            </p>
        </div>

        <div class="faq-item">
            <h3 class="faq-question">3. What does "SFI" vs "GIA" mean?</h3>
            <p class="faq-answer">
                "SFI" stands for Self-Financed Institute, which is a private college. "GIA" stands for 
                Grant-In-Aid, which is a government-aided institute and generally has lower fees.
            </p>
        </div>
        
        <div class="faq-item">
            <h3 class="faq-question">4. My rank is 1600 but I see a college with a 1700 closing rank. Why?</h3>
            <p class="faq-answer">
                That's exactly how it works! The "Closing Rank" is the *last* student (with the highest rank) who was
                admitted. If your rank is 1600 and the closing rank is 1700, you are safely eligible for that seat
                (since 1600 is better than 1700).
            </p>
        </div>

    </div>
</main>

<%-- This includes your standard website footer --%>
<jsp:include page="footer.jsp" />
