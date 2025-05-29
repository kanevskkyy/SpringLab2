package org.example.sportify.data.repository;

import org.example.sportify.data.entites.Music;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MusicRepository extends CrudRepository<Music, Integer> {
    List<Music> findAllByOrderByIdAsc();
}