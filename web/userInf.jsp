
<%@page import="ge.mziuri.model.Ticket"%>
<%@page import="ge.mziuri.model.Card"%>
<%@page import="ge.mziuri.model.User"%>
<%@page import="ge.mziuri.model.Event"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>My Account</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

       <div class="allForm">
           
        <div  class="dform">
            <div class="newform1">
                <h2>Me</h2>
                <form action="MyAccountServlet" method="post">
                    <%
                        User user = (User) request.getAttribute("User");
                        out.write("Name: <input type=\"text\" name=\"firstname\" value=\"" + user.getName() + "\"><br>");
                        out.write("Surname: <input type=\"text\" name=\"lastname\" value=\"" + user.getSurname() + "\"><br>");
                        out.write("New password: <input type=\"password\" name=\"password\"><br>");

                    %>
                    <input type="submit" value="Submit">
                    <input type="hidden" name = "updateValue" value = "userUpdate">
                    </form>
                  </div>

            <div class="newform1">
                <h2>My Card</h2>
                <form action="MyAccountServlet" method="post">
                    <%                        
                        Card card = (Card) request.getAttribute("Card");
                        if(card != null) {
                        out.write("Card code: <input type=\"text\" name=\"cardcode\" value=\"" + card.getCode() + "\"><br>");
                        out.write("Card passcode: <input type=\"password\" name=\"passcode\" value=\"" + card.getPasscode() + "\"><br>");
                        out.write("Expiration Date: <input type=\"date\" name=\"expDate\" value=\"" + card.getExpDate() + "\"><br>");
                        out.write("<input type=\"submit\" value=\"Submit\"><br>");
                        out.write("<br>");
                        out.write("Money on your card: <input type=\"text\" name = \"money\" value=\"" + card.getMoney() + "\"><br>");
                        }
                        else out.write("Please submit your card first.");
                    %>
                    
                    <input type="hidden" name = "updateValue" value = "cardUpdate">
                    </form>
                  </div>
        </div>

        <div class="dform">   
            <div class="newform1"> 
                <h2>My all tickets</h2>
                
                    <%                       
                        List<Ticket> tickets = (List<Ticket>) request.getAttribute("BoughtTickets");
                        for (Ticket ticket : tickets) {
                            out.write("<h4>" + ticket.getEvent().getName() + "</h4>");
                            out.write("<h5>" + ticket.getEvent().getDate().toString() + "</h5>");

                        }
                    %>                
            </div>
            <div class="newform1"> 
                <h2>My Events</h2>
                
                    <%
                        List<Event> myevents = (List<Event>) request.getAttribute("myEvents");
                        for (Event event : myevents) {
                            out.write("<h4>" + event.getName() + "</h4>");
                            out.write("<h5>" + event.getDate() + "</h5>");

                        }
                    %> 
                    
                    <a href="createE.jsp" class="btnform">
                        <div class="diForm"> 
                            <h5>Create event</h5> 
                        </div> 
                    </a>
            </div> 
        </div>
       </div>
    </body>
</html>
