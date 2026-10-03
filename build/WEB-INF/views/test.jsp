<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<% List<String> fruits = (List)request.getAttribute("listeFruits");%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% for (String fruit : fruits) {%>
        <p> <%= fruit %></p>
    <% } %>
</body>
</html>