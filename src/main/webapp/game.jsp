<%@ page import="java.util.Random" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        .win{
            color: green;
        }
        h3{
            color: blue;
        }
    </style>
</head>
<body>

    <%
        Integer number = (Integer)session.getAttribute("number");
        if (number == null){
            Random random = new Random();
            number = random.nextInt(10);
            session.setAttribute("number", number);
        }
        String userStr = request.getParameter("num");
        int userNum = 0;
        boolean userSendNumber = false;
        if (userStr != null && !userStr.isEmpty()){
            try {
                userNum = Integer.parseInt(userStr);
                userSendNumber = true;
            }
            catch (NumberFormatException ex) {}
        }
    %>

    <h1>Game, guess the number (0-10)</h1>
    <%
        if (userSendNumber){
            if (userNum == number){
                Random random = new Random();
                number = random.nextInt(10);
                session.setAttribute("number", number);
                out.println("<h3 class=\"win\">You guessed the number! It's " + userNum + " !</h3>");
                out.println("<h3>Number has already changed!</h3>");
            }
            else if (userNum > number){
                out.println("<h3>Less than " + userNum + " </h3>");
            }
            else{
                out.println("<h3>More than " + userNum + " </h3>");
            }
        }
    %>
    <form action="game.jsp" method="get">
        <input name="num" type="number" min="0" max="10">
        <button type="submit">Try</button>
    </form>

</body>
</html>