<%@ page import="org.example.bibliotecaservlets.LibroDAO" %>
<%
  String isbn = request.getParameter("isbn");
  if (isbn != null && !isbn.trim().isEmpty()) {
    LibroDAO libroDAO = new LibroDAO();
    libroDAO.borrar(isbn);
  }
  response.sendRedirect("listarLibros.jsp");
%>