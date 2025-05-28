package org.example.sportify.data.restControllers;

import org.example.sportify.data.entites.Author;
import org.example.sportify.data.services.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/authors")
public class AuthorRestController {

    @Autowired
    private AuthorService authorService;

    @GetMapping
    public ResponseEntity<List<Author>> getAllAuthors() {
        List<Author> authors = authorService.getAllAuthors();
        return ResponseEntity.ok(authors);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Author> getAuthorById(@PathVariable int id) {
        Author author = authorService.getAuthorById(id);
        if (author != null) {
            return ResponseEntity.ok(author);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Author> createAuthor(@RequestBody Author author) {
        Author savedAuthor = authorService.saveAuthor(author);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedAuthor);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Author> updateAuthor(@PathVariable int id, @RequestBody Author authorDetails) {
        Author author = authorService.getAuthorById(id);
        if (author != null) {
            author.setName(authorDetails.getName());
            Author updatedAuthor = authorService.saveAuthor(author);
            return ResponseEntity.ok(updatedAuthor);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAuthor(@PathVariable int id) {
        Author author = authorService.getAuthorById(id);
        if (author != null) {
            authorService.deleteAuthor(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}