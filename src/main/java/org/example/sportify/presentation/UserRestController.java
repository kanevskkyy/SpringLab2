package org.example.sportify.presentation;

import org.example.sportify.data.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/api")
public class UserRestController {

    private final UserRegisterRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserRestController(UserRegisterRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/register")
    public void registerUser(RegistrationDTO registrationDto, HttpServletResponse response) throws IOException {
        if (userRepository.existsByUsername(registrationDto.username())) {
            response.sendRedirect("/register?error=username_exists");
            return;
        }

        User newUser = new User();
        newUser.setUsername(registrationDto.username());
        newUser.setPassword(passwordEncoder.encode(registrationDto.password()));

        newUser.setRole("User");
        userRepository.save(newUser);
        response.sendRedirect("/");
    }
}