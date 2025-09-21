package com.ebs.electricity_billing_system.controller;

import com.ebs.electricity_billing_system.model.User;
import com.ebs.electricity_billing_system.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

@Controller
public class AuthController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {
        if (userRepository.findByUsername(user.getUsername()).isPresent()) {
            model.addAttribute("error", "Username already exists!");
            model.addAttribute("user", user);
            return "register";
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("CUSTOMER");
        userRepository.save(user);

        return "redirect:/login?success";
    }

    // ========== TEMPORARY TEST CODE ==========
    @GetMapping("/testadmin")
    @ResponseBody
    public String testAdminPassword() {
        Optional<User> adminUser = userRepository.findByUsername("admin");
        if (adminUser.isEmpty()) {
            return "Test failed: Admin user not found in the database!";
        }

        String storedPasswordHash = adminUser.get().getPassword();
        String plainPasswordToTest = "admin123";

        boolean matches = passwordEncoder.matches(plainPasswordToTest, storedPasswordHash);

        return "Password check for user 'admin' with password 'admin123'. Result: " + matches;
    }
    //
}