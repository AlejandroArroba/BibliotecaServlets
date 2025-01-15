<%@ page import="org.example.bibliotecaservlets.Libro" %>
<%@ page import="org.example.bibliotecaservlets.LibroDAO" %>
<%
    String isbn = request.getParameter("isbn");
    LibroDAO libroDAO = new LibroDAO();
    Libro libro = libroDAO.obtenerPorISBN(isbn);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Libro</title>
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
        main {
            margin: 20px auto;
            max-width: 400px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        label, input {
            display: block;
            margin: 10px 0;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .button {
            padding: 10px 20px;
            background-color: #5a67d8;
            color: white;
            border: none;
            cursor: pointer;
            text-align: center;
            display: inline-block;
            text-decoration: none;
            border-radius: 4px;
        }
        .button:hover {
            background-color: #434190;
        }
    </style>
</head>
<body>

<header>
    <h1>Actualizar Libro</h1>
</header>

<main>
    <% if (libro != null) { %>
    <form action="procesarActualizarLibro.jsp" method="post">
        <input type="hidden" name="isbn" value="<%= libro.getIsbn() %>">
        <label for="titulo">Título</label>
        <input type="text" name="titulo" value="<%= libro.getTitulo() %>" required>
        <label for="autor">Autor</label>
        <input type="text" name="autor" value="<%= libro.getAutor() %>" required>
        <input type="submit" value="Actualizar Libro">
    </form>
    <% } else { %>
    <p>El libro con el ISBN proporcionado no existe.</p>
    <% } %>

    <a href="index.jsp">
        <button class="button">Volver al Inicio</button>
    </a>
</main>

</body>
</html>