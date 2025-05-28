package org.example.sportify.data.services;

import org.example.sportify.data.entites.Genre;
import org.example.sportify.data.repository.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GenreService {

    @Autowired
    private GenreRepository genreRepository;

    public List<Genre> getAllGenres() {
        return (List<Genre>) genreRepository.findAll();
    }

    public Genre getGenreById(int id) {
        return genreRepository.findById(id).orElse(null);
    }

    public Genre saveGenre(Genre genre) {
        return genreRepository.save(genre);
    }

    public void deleteGenre(int id) {
        genreRepository.deleteById(id);
    }
}
