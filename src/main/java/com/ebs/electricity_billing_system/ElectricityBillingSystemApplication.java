package com.ebs.electricity_billing_system;

import com.ebs.electricity_billing_system.model.User;
import com.ebs.electricity_billing_system.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class ElectricityBillingSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(ElectricityBillingSystemApplication.class, args);
    }

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    public CommandLineRunner initAdminUser() {
        return args -> {
            // Check if admin user already exists
            if (userRepository.findByUsername("admin").isEmpty()) {
                System.out.println("Admin user not found. Creating one...");
                User admin = new User();
                admin.setUsername("admin");
                admin.setPassword(passwordEncoder.encode("admin123")); // Use the encoder to create the hash
                admin.setRole("ADMIN");
                admin.setFullName("Administrator");
                admin.setEmail("admin@example.com");
                admin.setMeterNumber("ADMIN001");
                admin.setAddress("1 Admin Way");
                userRepository.save(admin);
                System.out.println("Admin user created successfully.");
            } else {
                System.out.println("Admin user already exists.");
            }
        };
    }
}