<%@page import="com.entity.User"%>
<%
User user1 = (User)session.getAttribute("current-user");
%>



<nav class="navbar navbar-expand-lg navbar-dark custom-bg ">
  <div class="container">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-cart-plus m-2"></span>MyCart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="fa fa-home m-1"></span>Home </a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-users m-1"></span>AboutUs </a>
      </li>
      
      
      
    </ul>
    
    <ul class="navbar-nav ml-auto">
    
    <%
         if(user1 == null)
         {
    %>
    <li class="nav-item active">
        <a class="nav-link" href="userlogin.jsp"><span class="fa fa-sign-in m-1"></span>Login</a>
    </li>
    
     <li class="nav-item active">
        <a class="nav-link" href="register.jsp"><span class="fa fa-user-plus m-1"></span>Sign up</a>
    </li>
    <%
    }
    else
    {    
    %>
    <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-user-circle fa-spin m-1"></span><%=user1.getName() %></a>
    </li>
    
     <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out m-1"></span>Logout</a>
    </li>
    <%
    }
    %>
    </ul>
  </div>
  
  </div>
</nav>