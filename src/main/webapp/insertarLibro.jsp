<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertar Libro</title>
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
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #5a67d8;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #434190;
        }
        .error {
            color: red;
            font-size: 14px;
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
    <h1>Insertar Libro</h1>
</header>
<main>
    <form action="insertarLibroServlet" method="POST">
        <label for="isbn">ISBN:</label>
        <input type="text" id="isbn" name="isbn" required>

        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required>

        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required>

        <input type="submit" value="Insertar Libro">
    </form>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <a href="index.jsp">
        <button class="button">Volver al Inicio</button>
    </a>
</main>
</body>
</html>