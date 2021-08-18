<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Autor autor = (Autor)request.getAttribute("Autor");  
%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
 
<p><%=autor.toString()%> </p>

<table>
 <tr>
  <td> <%=String.valueOf(autor.getId())%></td>
  <td> <%=autor.getNombre()%></td>  
  <td> <%=autor.getApellido()%></td>   
 </tr> 
</table>

</body>
</html>