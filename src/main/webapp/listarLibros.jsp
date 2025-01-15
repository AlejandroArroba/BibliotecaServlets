<%@ page import="java.util.List" %>
<%@ page import="org.example.bibliotecaservlets.Libro" %>
<%@ page import="org.example.bibliotecaservlets.LibroDAO" %>
<%
  LibroDAO libroDAO = new LibroDAO();
  List<Libro> libros = libroDAO.obtenerTodos();
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Listar Libros</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: #5a67d8;
      color: white;
      padding: 15px;
      text-align: center;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px auto;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    table, th, td {
      border: 1px solid #ddd;
    }
    th, td {
      padding: 12px;
      text-align: left;
    }
    th {
      background-color: #5a67d8;
      color: white;
    }
    td {
      background-color: #fff;
    }
    .button {
      padding: 8px 15px;
      background-color: #5a67d8;
      color: white;
      border: none;
      cursor: pointer;
      border-radius: 4px;
      text-decoration: none;
    }
    .button:hover {
      background-color: #45a049;
    }
    .delete-button {
      background-color: #f44336;
    }
    .delete-button:hover {
      background-color: #d32f2f;
    }
  </style>
</head>
<body>
<header>
  <h1>Listado de Libros</h1>
</header>

<main>
  <table>
    <thead>
    <tr>
      <th>ISBN</th>
      <th>Título</th>
      <th>Autor</th>
      <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (Libro libro : libros) {
    %>
    <tr>
      <td><%= libro.getIsbn() %></td>
      <td><%= libro.getTitulo() %></td>
      <td><%= libro.getAutor() %></td>
      <td>
        <!-- Enlace para actualizar -->
        <a href="actualizarLibro.jsp?isbn=<%= libro.getIsbn() %>">
          <button class="button">Actualizar Libro</button>
        </a>

        <!-- Enlace para borrar -->
        <a href="borrarLibro.jsp?isbn=<%= libro.getIsbn() %>">
          <button class="button delete-button">Borrar Libro</button>
        </a>
      </td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <a href="index.jsp">
    <button class="button">Volver al Inicio</button>
  </a>

</main>

</body>
</html>
