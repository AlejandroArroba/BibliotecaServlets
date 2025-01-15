<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ page contentType="text/html; charset=UTF-8" %>
    <%@ page pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Principal</title>
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
    </style>
</head>
<body>
<header>
    <h1>Menú Principal</h1>
</header>
<main>
    <h2>Opciones Disponibles</h2>
    <ul>
        <li><a href="buscarLibro.jsp">Buscar Libro</a></li>
        <li><a href="listarLibros.jsp">Leer Todos los Libros</a></li>
        <li><a href="insertarLibro.jsp">Insertar Libro</a></li>
    </ul>
</main>
</body>
</html>