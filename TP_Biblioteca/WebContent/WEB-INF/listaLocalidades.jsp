<%@page import="java.util.LinkedList" %>
<%@page import="entities.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Localidad> localidades = (LinkedList<Localidad>)request.getAttribute("Localidades");  
%>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<%for(Localidad loc : localidades){ %>
 <tr>
  <td> <%=loc.getId()%></td>
  <td> <%=loc.getNombre()%></td>   
 </tr> 
<%}%>
</table>
</body>
</html>