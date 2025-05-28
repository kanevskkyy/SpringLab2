package org.example.sportify.data.restControllers;

import org.example.sportify.data.entites.Genre;
import org.example.sportify.data.services.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/genres")
public class GenreRestController {

    @Autowired
    private GenreService genreService;

    @GetMapping
    public ResponseEntity<List<Genre>> getAllGenres() {
        List<Genre> genres = genreService.getAllGenres();
        return ResponseEntity.ok(genres);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Genre> getGenreById(@PathVariable int id) {
        Genre genre = genreService.getGenreById(id);
        if (genre != null) {
            return ResponseEntity.ok(genre);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Genre> createGenre(@RequestBody Genre genre) {
        Genre savedGenre = genreService.saveGenre(genre);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedGenre);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Genre> updateGenre(@PathVariable int id, @RequestBody Genre genreDetails) {
        Genre genre = genreService.getGenreById(id);
        if (genre != null) {
            genre.setName(genreDetails.getName());
            Genre updatedGenre = genreService.saveGenre(genre);
            return ResponseEntity.ok(updatedGenre);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteGenre(@PathVariable int id) {
        Genre genre = genreService.getGenreById(id);
        if (genre != null) {
            genreService.deleteGenre(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
