<%-- 
    Document   : confirmation
    Created on : 15-Nov-2016, 5:52:57 PM
    Author     : harry
--%>

<%@page import="entity.Orders"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="cart.ShoppingCart"%>
<%@page import="session.OrdersFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">


        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Order Confirmation</title>
    </head>
    <body>

        <jsp:include page="header.jsp" />
        <div class="container">

            <h1>Order Confirmed...</h1>

            <%!
                OrdersFacadeLocal orders;
                ShoppingCart cart;
                Orders order;
            %>
            <%
                cart = (ShoppingCart) request.getSession().getAttribute("cart");
                if (cart == null) {
                    cart = new ShoppingCart();
                    session.setAttribute("cart", cart);
                }
                Context ctx = new InitialContext();
                orders = (OrdersFacadeLocal) ctx.lookup(OrdersFacadeLocal.class.getName());
            %>
            <%
                if (request.getParameter("pay") != null) {
            %>
            <div class="text-center row">
                <div class="col-md-4 " style="background-color: rgb(26,198,65)">
                    <h1 >Thank you for shopping with us.</h1><br/>
                    <div class="text-left">
                    <h3>Your Order Details</h3>
                    <h3>Total Number Of Items: <%out.print(cart.getNumberOfItems());%> </h3>
                    <h3>Your Order Total is: $CAD <%out.print(cart.getSubtotal());%></h3>
                </div>
                </div></div>
                <%
                        orders.saveOrder(cart);
                        cart.clear();
                        request.getSession().removeAttribute("cart");
                    }
                %>


    </body>
</html>
