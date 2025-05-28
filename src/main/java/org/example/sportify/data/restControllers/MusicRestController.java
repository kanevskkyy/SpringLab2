package org.example.sportify.data.restControllers;

import org.example.sportify.data.entites.Music;
import org.example.sportify.data.entites.Author;
import org.example.sportify.data.entites.Genre;
import org.example.sportify.data.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/music")
public class MusicRestController {

    @Autowired
    private MusicService musicService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private GenreService genreService;

    @GetMapping
    public ResponseEntity<List<Music>> getAllMusic() {
        List<Music> musicList = musicService.getAllMusic();
        return ResponseEntity.ok(musicList);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Music> getMusicById(@PathVariable int id) {
        Music music = musicService.getMusicById(id);
        if (music != null) {
            return ResponseEntity.ok(music);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Music> createMusic(@RequestBody MusicCreateRequest request) {
        Author author = authorService.getAuthorById(request.getAuthorId());
        Genre genre = genreService.getGenreById(request.getGenreId());

        if (author == null || genre == null) {
            return ResponseEntity.badRequest().build();
        }

        Music music = new Music();
        music.setTitle(request.getTitle());
        music.setAuthor(author);
        music.setGenre(genre);
        music.setDuration(request.getDuration());
        music.setLikes(request.getLikes());

        Music savedMusic = musicService.saveMusic(music);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedMusic);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Music> updateMusic(@PathVariable int id, @RequestBody MusicCreateRequest request) {
        Music music = musicService.getMusicById(id);
        if (music == null) {
            return ResponseEntity.notFound().build();
        }

        Author author = authorService.getAuthorById(request.getAuthorId());
        Genre genre = genreService.getGenreById(request.getGenreId());

        if (author == null || genre == null) {
            return ResponseEntity.badRequest().build();
        }

        music.setTitle(request.getTitle());
        music.setAuthor(author);
        music.setGenre(genre);
        music.setDuration(request.getDuration());
        music.setLikes(request.getLikes());

        Music updatedMusic = musicService.saveMusic(music);
        return ResponseEntity.ok(updatedMusic);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMusic(@PathVariable int id) {
        Music music = musicService.getMusicById(id);
        if (music != null) {
            musicService.deleteMusic(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/authors")
    public ResponseEntity<List<Author>> getAllAuthors() {
        List<Author> authors = authorService.getAllAuthors();
        return ResponseEntity.ok(authors);
    }

    @GetMapping("/genres")
    public ResponseEntity<List<Genre>> getAllGenres() {
        List<Genre> genres = genreService.getAllGenres();
        return ResponseEntity.ok(genres);
    }

    public static class MusicCreateRequest {
        private String title;
        private int authorId;
        private int genreId;
        private Integer duration;
        private Integer likes;

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public int getAuthorId() { return authorId; }
        public void setAuthorId(int authorId) { this.authorId = authorId; }

        public int getGenreId() { return genreId; }
        public void setGenreId(int genreId) { this.genreId = genreId; }

        public Integer getDuration() { return duration; }
        public void setDuration(Integer duration) { this.duration = duration; }

        public Integer getLikes() { return likes; }
        public void setLikes(Integer likes) { this.likes = likes; }
    }
}