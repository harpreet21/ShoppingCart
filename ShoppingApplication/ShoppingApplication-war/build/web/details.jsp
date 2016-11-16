<%-- 
    Document   : details
    Created on : Nov 15, 2016, 4:28:30 AM
    Author     : harry
--%>

<%@page import="entity.Product"%>
<%@page import="session.ProductFacadeLocal"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>

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

        <title>Details</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container col-md-8">
            <%!
                private static final String SESSION_KEY = "products";
                ProductFacadeLocal products;
            %>
            <%
                products = (ProductFacadeLocal) request.getSession().getAttribute(SESSION_KEY);
                if (products == null) {
                    Context ctx = new InitialContext();
                    products = (ProductFacadeLocal) ctx.lookup(ProductFacadeLocal.class.getName());
                    request.getSession().setAttribute(SESSION_KEY, products);
                }

                int pid = Integer.parseInt(request.getParameter("pid").toString());
                Product product = (Product) products.find(pid);
            %>
            <h1>Product Description</h1>
            <form action="checkout.jsp" >
                <table cellpadding="0" cellspacing="0" class="table" >
                    <tr class="text-left row">
                        <td class="col-md-2">
                            <div>
                                <img  src="<% out.println(product.getBookimage());%>" title="<% out.println(product.getName());%>" width="200" height="200">
                            </div>
                        </td>
                        <td class="col-md-4">
                            <div class="text-left">
                                <h5>
                                    <%out.println("Name: " + product.getName());%>
                                </h5>
                                <h5>
                                    <%out.println("Price: $CAD " + product.getPrice());%>
                                </h5>
                                <h5>
                                    <%out.println("Description: <br/    >" + product.getDescription());%>
                                </h5>
                                
                            </div>
                        </td>
                        <td class="col-md-2">
                            <span>
                                <input type="hidden" name="pid" value=<%out.println(product.getPid());%>>
                                <div><label>Quantity: </label>
                                    <input type="number" name="quantity" value="1" min="1" max="15"/><br/>
                                    <input type="submit" name="add" id="add" value="Add To Shoppping Cart" class="btn btn-primary"/>
                                </div>
                            </span>
                        </td>

                    </tr>
                    <tr class="text-right row">
                        
                        <td colspan="3">
                            <div>
                                <input type="submit" name="checkout" id="checkout" value="Checkout Now" class="btn btn-primary"/>
                            </div>
                        </td>   
                    </tr>
                </table>
            </form>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
