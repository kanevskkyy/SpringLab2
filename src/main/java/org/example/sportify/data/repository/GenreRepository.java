package org.example.sportify.data.repository;
import org.example.sportify.data.entites.Genre;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepository extends CrudRepository<Genre, Integer> {
}
