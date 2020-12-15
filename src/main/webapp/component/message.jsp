<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<%
String message = (String)session.getAttribute("message");
%>
<c:if test="${message != null }">

<div class="alert alert-success" role="alert">
  <strong><%=message %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

</c:if>
<c:remove var="message"/>