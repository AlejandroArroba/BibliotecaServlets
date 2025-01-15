package org.example.bibliotecaservlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/insertarLibroServlet")
public class insertarLibroServlet extends HttpServlet {

    private LibroDAO libroDAO = new LibroDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");

        if (libroDAO.obtenerPorISBN(isbn) != null) {
            request.setAttribute("error", "El ISBN ya existe.");
            request.getRequestDispatcher("insertarLibro.jsp").forward(request, response);
            return;
        }

        if (libroDAO.obtenerPorTitulo(titulo) != null) {
            request.setAttribute("error", "El título ya existe.");
            request.getRequestDispatcher("insertarLibro.jsp").forward(request, response);
            return;
        }

        Libro nuevoLibro = new Libro();
        nuevoLibro.setIsbn(isbn);
        nuevoLibro.setTitulo(titulo);
        nuevoLibro.setAutor(autor);

        libroDAO.insertar(nuevoLibro);

        response.sendRedirect("listarLibros.jsp");
    }
}
