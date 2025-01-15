package org.example.bibliotecaservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/LibroServlet")
public class LibroServlet extends HttpServlet {

    private final LibroDAO libroDAO = new LibroDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listarLibros(request, response);
            } else {
                switch (action) {
                    case "leer":
                        leerLibro(request, response);
                        break;
                    case "listar":
                        listarLibros(request, response);
                        break;
                    default:
                        listarLibros(request, response);
                        break;
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action != null) {
                switch (action) {
                    case "insertar":
                        insertarLibro(request, response);
                        break;
                    case "actualizar":
                        actualizarLibro(request, response);
                        break;
                    case "borrar":
                        borrarLibro(request, response);
                        break;
                    default:
                        listarLibros(request, response);
                        break;
                }
            } else {
                listarLibros(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void leerLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        Libro libro = libroDAO.obtenerPorTitulo(titulo);
        if (libro != null) {
            request.setAttribute("libro", libro);
            request.getRequestDispatcher("detalleLibro.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se encontró el libro con el título proporcionado.");
            request.getRequestDispatcher("error.jsp").forward(request, response); // Redirigir a una página de error o mostrar mensaje
        }
    }


    private void listarLibros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Libro> libros = libroDAO.obtenerTodos();
        request.setAttribute("libros", libros);
        request.getRequestDispatcher("listaLibros.jsp").forward(request, response);
    }

    private void insertarLibro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");

        Libro libro = new Libro(isbn, titulo, autor);
        libroDAO.insertar(libro);
        response.sendRedirect("LibroServlet?action=listar");
    }

    private void actualizarLibro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");

        Libro libro = new Libro(isbn, titulo, autor);
        libroDAO.actualizar(libro);
        response.sendRedirect("LibroServlet?action=listar");
    }

    private void borrarLibro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String isbn = request.getParameter("isbn");
        libroDAO.borrar(isbn);
        response.sendRedirect("LibroServlet?action=listar");
    }
}