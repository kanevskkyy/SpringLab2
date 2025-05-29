package org.example.sportify.data.repository;
import org.example.sportify.data.entites.Genre;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface GenreRepository extends CrudRepository<Genre, Integer> {
    List<Genre> findAllByOrderByIdAsc();
}
