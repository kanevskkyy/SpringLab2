package org.example.sportify.data;

import org.springframework.data.repository.CrudRepository;

public interface MusicRepository extends CrudRepository<Music, Integer> {
}