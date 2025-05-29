package org.example.sportify.presentation.admin;
import org.example.sportify.data.entites.Author;
import org.example.sportify.data.entites.Genre;
import org.example.sportify.data.entites.Music;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.example.sportify.data.repository.AuthorRepository;
import org.example.sportify.data.repository.GenreRepository;
import org.example.sportify.data.repository.MusicRepository;
import org.springframework.stereotype.Controller;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import java.util.ArrayList;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    private final MusicRepository musicRepository;
    private final GenreRepository genreRepository;
    private final AuthorRepository authorRepository;

    public AdminController(MusicRepository musicRepository, GenreRepository genreRepository, AuthorRepository authorRepository) {
        this.musicRepository = musicRepository;
        this.genreRepository = genreRepository;
        this.authorRepository = authorRepository;
    }

    @GetMapping("/dashboard")
    public String adminDashboard(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("username", auth.getName());
        model.addAttribute("roles", auth.getAuthorities());
        model.addAttribute("musicCount", musicRepository.count());
        model.addAttribute("genreCount", genreRepository.count());
        model.addAttribute("authorCount", authorRepository.count());

        return "admin-dashboard";
    }

    @GetMapping("/musics")
    public String manageMusic(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("username", auth.getName());

        var musics = musicRepository.findAllByOrderByIdAsc();
        var authors = authorRepository.findAllByOrderByIdAsc();
        var genres = genreRepository.findAllByOrderByIdAsc();

        model.addAttribute("music", musics != null ? musics : new ArrayList<>());
        model.addAttribute("authors", authors != null ? authors : new ArrayList<>());
        model.addAttribute("genres", genres != null ? genres : new ArrayList<>());
        model.addAttribute("musicCount", musicRepository.count());

        return "admin/manage-music";
    }
}