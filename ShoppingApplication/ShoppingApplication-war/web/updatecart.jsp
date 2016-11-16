<%-- 
    Document   : checkout
    Created on : 15-Nov-2016, 1:27:49 AM
    Author     : harry
--%>

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

        <title>Update Cart</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">

            <h1>Update Cart</h1>
            <a href="checkout..jsp">Go to Cart</a>

            <%!
                private static final String SESSION_KEY = "products";
                ProductFacadeLocal products;
                ShoppingCart cart;
                int productID=0;
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
                if (request.getParameter("update") != null) {
                    String pid = request.getParameter("pid").trim();
                    productID=Integer.parseInt(pid);
                }
            %>
            <%      if (productID == 0) {
                    out.print("<h3> Your cart is empty<h3>");
                } else {
            %>
            <form action="checkout.jsp">
                <table  cellpadding="2" cellspacing="2" border="1" class="table">
                    <tr>
                        <th>Action</th>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                    </tr>

                    <%  List<ShoppingCartItem> list = cart.getItems();
                        cart.calculateTotal("13");
                        if (list != null) {
                            for (ShoppingCartItem c : list) {
                                Product b = (Product) products.find(c.getProduct().getPid());
                                if(b.getPid()==productID){
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
                            <input type="hidden" name="pid" value=<%out.println(b.getPid());%>>
                            <input type="number" name="quantity" value=<% out.println(c.getQuantity());%> min="1" max="15"/>
                        </td>

                    </tr>

                    <% }}
                        }%>

                    <tr>
                        <td colspan="6" class="text-right">
                            <input type="submit" name="save" id="save" value="Save Changes" class="btn btn-primary"/>
                        </td>
                    </tr>
                </table>

            </form>
            <%
                }%>





        </div>
        <jsp:include page="footer.jsp" />




    </body>
</html>
