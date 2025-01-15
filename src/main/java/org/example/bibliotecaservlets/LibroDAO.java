package org.example.bibliotecaservlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class LibroDAO {

    private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("unidad-biblioteca");

    public Libro obtenerPorTitulo(String titulo) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Libro> query = em.createQuery("SELECT l FROM Libro l WHERE l.titulo = :titulo", Libro.class);
            query.setParameter("titulo", titulo);
            List<Libro> resultados = query.getResultList();

            if (!resultados.isEmpty()) {
                return resultados.get(0);
            } else {
                return null;
            }
        } finally {
            em.close();
        }
    }

    public List<Libro> obtenerTodos() {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Libro> query = em.createQuery("SELECT l FROM Libro l", Libro.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public void insertar(Libro libro) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(libro);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void actualizar(Libro libro) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(libro);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void borrar(String isbn) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Libro libro = em.find(Libro.class, isbn);
            if (libro != null) {
                em.remove(libro);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Libro obtenerPorISBN(String isbn) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Libro> query = em.createQuery("SELECT l FROM Libro l WHERE l.isbn = :isbn", Libro.class);
            query.setParameter("isbn", isbn);
            List<Libro> resultados = query.getResultList();
            return resultados.isEmpty() ? null : resultados.get(0);
        } finally {
            em.close();
        }
    }

}