<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Autor> autores = (LinkedList<Autor>)request.getAttribute("Autores");  
%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<%for(Autor aut : autores){ %>
 <tr>
  <td> <%=aut.getId()%></td>
  <td> <%=aut.getNombre()%></td>  
  <td> <%=aut.getApellido()%></td>   
 </tr> 
<%}%>
</table>
</body>
</html>