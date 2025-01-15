<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="org.example.bibliotecaservlets.LibroDAO" %>
<%@ page import="org.example.bibliotecaservlets.Libro" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Libro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #5a67d8;
            color: #fff;
            padding: 15px 20px;
            text-align: center;
        }
        main {
            margin: 20px auto;
            max-width: 500px;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            margin: 10px 0;
        }
        ul li a {
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            color: #fff;
            background-color: #5a67d8;
            border-radius: 4px;
            text-align: center;
            transition: background-color 0.3s;
        }
        ul li a:hover {
            background-color: #434190;
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
    <h1>Buscar Libro por Título</h1>
</header>

<main>
    <form method="get" action="buscarLibro.jsp">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required>
        <button type="submit">Buscar</button>
    </form>

    <%
        String titulo = request.getParameter("titulo");
        if (titulo != null && !titulo.trim().isEmpty()) {
            LibroDAO libroDAO = new LibroDAO();
            Libro libro = libroDAO.obtenerPorTitulo(titulo);

            if (libro != null) {
    %>
    <h2>Detalles del Libro</h2>
    <ul>
        <li><strong>ISBN:</strong> <%= libro.getIsbn() %></li>
        <li><strong>Título:</strong> <%= libro.getTitulo() %></li>
        <li><strong>Autor:</strong> <%= libro.getAutor() %></li>
    </ul>
    <%
    } else {
    %>
    <p>No se encontró ningún libro con ese título.</p>
    <%
            }
        }
    %>

    <a href="index.jsp">
        <button class="button">Volver al Inicio</button>
    </a>
</main>

</body>
</html>