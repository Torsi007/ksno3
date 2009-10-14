<jsp:include page="../nd/Heading.jsp" ></jsp:include>
<title>kitesurfing.no - last opp video</title>
</head>
<body>
    <form action="<%= request.getParameter("url")%>?nexturl=http://example.com" method ="post" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="hidden" name="token" value="token_value"/>
        <input type="submit" value="go" />
    </form>
</body>
<jsp:include page="../nd/Ending.jsp" ></jsp:include>




