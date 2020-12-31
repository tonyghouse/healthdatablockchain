<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE HTML>
<html>

<head>
  <title>Members page</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="../css/menu.css" />
  <link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">Hospital<span class="logo_colour">...care</span></a></h1>
          <h2>We Care About You...</h2>
       
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
         <li><a href="success.jsp">Home</a></li>
          <li><a href="adddoctor.jsp">Add Doctor</a></li>
          <li><a href="addpatient.jsp">Add Patient</a></li>
          <li><a href="addstore.jsp">Add Stores</a></li>
          <li><a href="addbed.jsp">Add Bed</a></li>
          <li class="selected"><a href="showmember.jsp">Member</a></li> 
        </ul>
      </div>
    </div>
   
    <div id="content_header"></div>
    
    <div id="site_content">
    
	  <div id="sidebar_container">
        <div class="sidebar">
        
          <div class="sidebar_top"></div>
     
          
          
           <div class="sidebar_item">
            <!-- insert your sidebar items here -->
           <h6><font color="blue"><b>Welcome To Admin Account:</b></font></h6>
            
                            <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="adminlogin.jsp">Please Login</a>
<%} else {
%>
<h6><strong>Admin User Name:<%=session.getAttribute("userid")%><br>
<a href='logout.jsp'>Log out</a></strong></h6>
<%
    }
%>
          </div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Useful Links</h3>
            <ul>
              <li><a href="doctorsed.jsp">Please Add Doctor Schedule</a></li>
              <li><a href="#">link 2</a></li>
              <li><a href="#">link 3</a></li>
              <li><a href="#">link 4</a></li>
            </ul>
          </div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Search</h3>
            <form method="post" action="#" id="search_form">
              <p>
                <input class="search" type="text" name="search_field" value="Enter keywords....." />
                <input name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;" src="../images/search.png" alt="Search" title="Search" />
              </p>
            </form>
          </div>
          <div class="sidebar_base"></div>
        </div>
      </div>
      <div id="content">
    
        <h1 align="left"><font color="blue"><b>Total Members Information:</b></font></h1>
          <% 
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/name","root","");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from members") ; 
        %>
      

        <table border="" style="width:600px">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Types</th>
                <th>Email</th>
                <th>User Name</th>
                
                  
            </tr>
            <% while(resultset.next()){ %>
            <tr>
                <td> <%= resultset.getString(1) %></td>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(3) %></td>
                <td> <%= resultset.getString(4) %></td>
                <td> <%= resultset.getString(5) %></td>
               
           
            </tr>
            <% } %>
        </table>
        
      
    
      </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
      <p><a href="success.jsp">Home</a> | <a href="doctor.jsp">Doctor</a> | <a href="patient.jsp">Patient</a> |<a href="stores.jsp">Stores</a></p>
      <p>Copyright &copy; Hospital ...Care | <a href="success.jsp">Ismail</a></p>
    </div>
  </div>
</body>
</html>
    