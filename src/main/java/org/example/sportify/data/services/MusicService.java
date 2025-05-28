package org.example.sportify.data.services;

import org.example.sportify.data.entites.Music;
import org.example.sportify.data.repository.MusicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MusicService {

    @Autowired
    private MusicRepository musicRepository;

    public List<Music> getAllMusic() {
        return (List<Music>) musicRepository.findAll();
    }

    public Music getMusicById(int id) {
        return musicRepository.findById(id).orElse(null);
    }

    public Music saveMusic(Music music) {
        return musicRepository.save(music);
    }

    public void deleteMusic(int id) {
        musicRepository.deleteById(id);
    }
}