Ethoca Shopping Cart Challenge

------Technology Stack Used: 
J2EE, EJB, JPA, JSP, HTML, BootStrap, MySQL, Glassfish Server

------Before Running Application-------
1. MySQL database server is required. Then execute sql scripts in setup folder.
2. Run database schema file to create database i.e. mysqlschema.sql 
3. Run sample data dump sql file. i.e. sampledata.sql
4. Glassfish server is required to run this application.
5. MySQL JDBC Drivers are along with project.

-------Application Architecture:
1. Enterprise Application Project
2. EJB Module project
3. Web Module Project

--------Application Features:
1. list of products
2. add products to cart
3. change quantity or remove
4. go back and add new products
5. submit order and confirmation page and data is stored in database along with all cart details and order details.
6. User session is managed. Cart state is stored even if you loose browser or tab.
