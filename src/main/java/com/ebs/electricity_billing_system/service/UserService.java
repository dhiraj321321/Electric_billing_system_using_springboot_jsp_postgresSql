package com.ebs.electricity_billing_system.service;

import com.ebs.electricity_billing_system.model.User;
import com.ebs.electricity_billing_system.repository.UserRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User save(User user) {
        return userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    public List<User> findAllCustomers() {
        return userRepository.findAll().stream()
                .filter(user -> "CUSTOMER".equalsIgnoreCase(user.getRole()))
                .collect(Collectors.toList());
    }
}