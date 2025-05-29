package org.example.sportify.data.repository;

import org.example.sportify.data.entites.Author;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AuthorRepository extends CrudRepository<Author, Integer> {
    List<Author> findAllByOrderByIdAsc();
}
