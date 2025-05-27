package org.example.sportify.data.repository;

import org.example.sportify.data.entites.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
}
