<%-- 
    Document   : checkout
    Created on : 15-Nov-2016, 1:27:49 AM
    Author     : harry
--%>

<%@page import="session.OrdersFacadeLocal"%>
<%@page import="cart.ShoppingCartItem"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="cart.ShoppingCart"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="session.ProductFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">


        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Checkout Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">

            <h1>Checkout</h1>
            <a href="index.jsp">Continue Shopping</a>

            <%!
                private static final String SESSION_KEY = "products";
                ProductFacadeLocal products;
                OrdersFacadeLocal orders;
                ShoppingCart cart;
            %>
            <%
                products = (ProductFacadeLocal) request.getSession().getAttribute(SESSION_KEY);
                if (products == null) {
                    Context ctx = new InitialContext();
                    products = (ProductFacadeLocal) ctx.lookup(ProductFacadeLocal.class.getName());
                    request.getSession().setAttribute(SESSION_KEY, products);
                }

                cart = (ShoppingCart) request.getSession().getAttribute("cart");
                if (cart == null) {
                    cart = new ShoppingCart();
                    session.setAttribute("cart", cart);
                }
            %>
            <%
                if (request.getParameter("add") != null) {
                    String productId = request.getParameter("pid").trim();
                    String quantity = request.getParameter("quantity").trim();

                    if (!productId.isEmpty()) {
                        Product product = products.find(Integer.parseInt(productId));
                        cart.addItem(product, Integer.parseInt(quantity));
                    }
                }
                if (request.getParameter("save") != null) {
                    String productId = request.getParameter("pid").trim();
                    String quantity = request.getParameter("quantity").trim();

                    if (!productId.isEmpty()) {
                        Product product = products.find(Integer.parseInt(productId));
                        //cart.addItem(product, Integer.parseInt(quantity));
                        cart.update(product, Integer.parseInt(quantity));
                    }
                }
                if (request.getParameter("action") != null) {
                    String productId = request.getParameter("pid").trim();

                    if (!productId.isEmpty()) {
                        Product product = products.find(Integer.parseInt(productId));
                        //cart.addItem(product, Integer.parseInt(quantity));
                        cart.remove(product);
                    }
                }

                if (request.getParameter("clear") != null) {
                    cart.clear();
                    request.getSession().removeAttribute("cart");
                }
                if (request.getParameter("pay") != null) {
                    
                    Context ctx = new InitialContext();
                    orders = (OrdersFacadeLocal) ctx.lookup(OrdersFacadeLocal.class.getName());
                    
                    orders.saveOrder(cart);
                    cart.clear();
                    request.getSession().removeAttribute("cart");
                    
                }


            %>
            <%      if (cart.getNumberOfItems() == 0) {
                    out.print("<h3> Your cart is empty<h3>");
                } else {
            %>
            <form action="checkout.jsp" name='abc' method='get'>
               
                <table cellpadding="2" cellspacing="2" border="1" class="table table-responsive ">
                    <tr>
                        <th>Action</th>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Sub Total</th>
                    </tr>

                    <%  List<ShoppingCartItem> list = cart.getItems();
                        cart.calculateTotal("13");
                        if (list != null) {
                            for (ShoppingCartItem c : list) {
                                Product b = (Product) products.find(c.getProduct().getPid());
                    %>
                    <tr>
                        <td><a href="checkout.jsp?pid=<%out.print(b.getPid());%>&action=delete" class="btn btn-danger">Delete</a></td>    
                        <td>
                            <p><% out.println(b.getPid());%><p>
                        </td>
                        <td>
                            <% out.println(b.getName());%>
                        </td>
                        <td>
                            <% out.println(b.getPrice());%>
                        </td>
                        <td>
                            <span> <% out.println(c.getQuantity());%> </span>
                            <span><a href="updatecart.jsp?pid=<%out.print(b.getPid());%>&update=update" class="btn btn-info">Update Quantity</a></span>
                        </td>
                        <td>

                            <% out.println(c.getQuantity() * b.getPrice());%>
                        </td>
                    </tr>

                    <% }
                        }%>
                    <tr>
                        <td colspan="5">
                            <% out.print("Total:"); %>
                        </td>
                        <td>
                            <% out.print("$CAD " + cart.getSubtotal());%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <span> <a href="checkout.jsp?clear=clear" class="btn btn-warning">Clear Cart</a></span>
                        </td>
                    </tr>
                </table>
                        <span> <a href="confirmation.jsp?pay=pay" class="btn btn-primary">Proceed to Payment</a></span>
            </form>
            <%
                }%>
            
        </div>
        <jsp:include page="footer.jsp" />




    </body>
</html>
