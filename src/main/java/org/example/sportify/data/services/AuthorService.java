package org.example.sportify.data.services;

import org.example.sportify.data.entites.Author;
import org.example.sportify.data.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    public List<Author> getAllAuthors() {
        return (List<Author>) authorRepository.findAll();
    }

    public Author getAuthorById(int id) {
        return authorRepository.findById(id).orElse(null);
    }

    public Author saveAuthor(Author author) {
        return authorRepository.save(author);
    }

    public void deleteAuthor(int id) {
        authorRepository.deleteById(id);
    }
}