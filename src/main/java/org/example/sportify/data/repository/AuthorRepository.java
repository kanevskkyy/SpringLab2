package org.example.sportify.data.repository;

import org.example.sportify.data.entites.Author;
import org.springframework.data.repository.CrudRepository;

public interface AuthorRepository extends CrudRepository<Author, Integer> {
}
