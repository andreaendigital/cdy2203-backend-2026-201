package com.duoc.backend;
import com.duoc.backend.User;
import com.duoc.backend.JWTAuthenticationConfig;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;


@RestController
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    JWTAuthenticationConfig jwtAuthenticationConfig;

   

    @PostMapping("/login")
    public ResponseEntity<String> login(
            @RequestParam("user") String username,
            @RequestParam("encryptedPass") String password) {

        User user = userRepository.findByUsername(username);
       

        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
           return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Credenciales inválidas");
        }

        String token = jwtAuthenticationConfig.getJWTToken(username);
        return ResponseEntity.ok(token);
    }

}