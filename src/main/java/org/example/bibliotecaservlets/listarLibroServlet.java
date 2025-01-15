package org.example.bibliotecaservlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/listarLibros")
public class listarLibroServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LibroDAO libroDAO = new LibroDAO();
        List<Libro> libros = libroDAO.obtenerTodos();

        request.setAttribute("libros", libros);
        RequestDispatcher dispatcher = request.getRequestDispatcher("borrarLibro.jsp");
        dispatcher.forward(request, response);
    }
}
