package org.example.sportify.presentation.login;
import org.example.sportify.data.MusicRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RoleController {
    private final MusicRepository musicRepository;

    public RoleController(MusicRepository musicRepository) {
        this.musicRepository = musicRepository;
    }

    @GetMapping("/music")
    public String musicPage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("username", auth.getName());
        Long musicCount = musicRepository.count();
        var musics = musicRepository.findAll();
        model.addAttribute("musicCount", musicCount);
        model.addAttribute("musics", musics);
        return "music-page";
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("username", auth.getName());
        model.addAttribute("roles", auth.getAuthorities());
        return "admin-dashboard";
    }

    @GetMapping("/")
    public String homePage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !auth.getName().equals("anonymousUser")) {
            model.addAttribute("username", auth.getName());
            model.addAttribute("isAuthenticated", true);
        }
        else model.addAttribute("isAuthenticated", false);
        return "home";
    }
}
