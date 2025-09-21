package com.ebs.electricity_billing_system.controller;

import com.ebs.electricity_billing_system.model.User;
import com.ebs.electricity_billing_system.service.BillService;
import com.ebs.electricity_billing_system.service.UserService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;
    private final BillService billService;
    private final PasswordEncoder passwordEncoder;

    public AdminController(UserService userService, BillService billService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.billService = billService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<User> customers = userService.findAllCustomers();
        model.addAttribute("customers", customers);
        model.addAttribute("bills", billService.findAll());
        return "admin/dashboard";
    }

    @GetMapping("/customers")
    public String customerList(Model model) {
        model.addAttribute("customers", userService.findAllCustomers());
        return "admin/customers";
    }

    @GetMapping("/customers/new")
    public String newCustomerForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/new-customer";
    }

    @PostMapping("/customers")
    public String createCustomer(@ModelAttribute User user) {
        user.setRole("CUSTOMER");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userService.save(user);
        return "redirect:/admin/customers";
    }

    @GetMapping("/generate-bill")
    public String generateBillForm(Model model) {
        model.addAttribute("customers", userService.findAllCustomers());
        return "admin/generate-bill";
    }

    @PostMapping("/generate-bill")
    public String generateBill(@RequestParam Long customerId, @RequestParam int units) {
        User customer = userService.findById(customerId).orElse(null);
        if (customer != null) {
            billService.generateBill(customer, units);
        }
        return "redirect:/admin/bills";
    }

    @GetMapping("/bills")
    public String bills(Model model) {
        model.addAttribute("bills", billService.findAll());
        return "admin/bills";
    }
}