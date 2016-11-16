<%-- 
    Document   : index
    Created on : 14-Nov-2016, 9:36:45 PM
    Author     : harry
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="session.ProductFacadeLocal"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="session.ProductFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!--Optional theme--> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <!--Latest compiled and minified JavaScript--> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Shopping website</title>
    </head>
    <body>


        <jsp:include page="header.jsp"/>

        <div class="wrapper container">
            <div class="row">
            <%!
                private static final String SESSION_KEY = "products";
                List<Product> productList;
                ProductFacadeLocal products;
            %>

            <%
                products = (ProductFacadeLocal) request.getSession().getAttribute(SESSION_KEY);
                if (products == null) {
                    Context ctx = new InitialContext();
                    products = (ProductFacadeLocal) ctx.lookup(ProductFacadeLocal.class.getName());
                    request.getSession().setAttribute(SESSION_KEY, products);
                }
                productList = products.findAll();
            %>

            <h2>Our Best Selling Products</h2>
            <div class="table-responsive">
            <table class="table text-center">
                <tr>
                    <%for (Product product : productList) { %>
                    <td>
                        <a href="details.jsp?pid=<%out.println(product.getPid());%>">
                            <div>
                                <img src="<% out.println(product.getBookimage());%>" title="<% out.println(product.getName());%>" width="200" height="200" >
                            </div>
                            <div>
                                <p>
                                    <%out.println(product.getName());%>
                                </p>
                            </div>
                        </a>

                        <%
                            }
                        %>
                       
                    </td>
                </tr>
            </table>
            </div>

        </div>
        </div>



        <jsp:include page="footer.jsp"/>

    </body>
</html>
