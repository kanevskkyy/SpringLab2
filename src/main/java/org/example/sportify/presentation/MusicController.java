package org.example.sportify.presentation;

import org.example.sportify.data.Music;
import org.example.sportify.data.MusicRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MusicController {
    private final MusicRepository musicRepository;

    public MusicController(MusicRepository musicRepository) {
        this.musicRepository = musicRepository;
    }

    @GetMapping("/")
    public String showMusics(Model model) {
        Long musicCount = musicRepository.count();
        var musics = musicRepository.findAll();
        model.addAttribute("musicCount", musicCount);
        model.addAttribute("musics", musics);
        return "music";
    }
}