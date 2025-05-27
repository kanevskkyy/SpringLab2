package org.example.sportify.data.entites;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "users")
@Getter
@Setter
@EqualsAndHashCode
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long Id;

    @Column(name = "username")
    public String username;

    @Column(name = "password")
    public String password;

    @Column(name = "role")
    public String role;
}