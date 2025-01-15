<%@ page import="org.example.bibliotecaservlets.Libro" %>
<%@ page import="org.example.bibliotecaservlets.LibroDAO" %>
<%
    String isbn = request.getParameter("isbn");
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");

    Libro libro = new Libro();
    libro.setIsbn(isbn);
    libro.setTitulo(titulo);
    libro.setAutor(autor);

    LibroDAO libroDAO = new LibroDAO();
    libroDAO.actualizar(libro);

    response.sendRedirect("listarLibros.jsp");
%>
