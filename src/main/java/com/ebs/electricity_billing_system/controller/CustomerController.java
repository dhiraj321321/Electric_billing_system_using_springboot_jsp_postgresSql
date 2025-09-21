package com.ebs.electricity_billing_system.controller;

import com.ebs.electricity_billing_system.model.Bill;
import com.ebs.electricity_billing_system.model.User;
import com.ebs.electricity_billing_system.service.BillService;
import com.ebs.electricity_billing_system.service.PaymentService;
import com.ebs.electricity_billing_system.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private final UserService userService;
    private final BillService billService;
    private final PaymentService paymentService;

    public CustomerController(UserService userService, BillService billService, PaymentService paymentService) {
        this.userService = userService;
        this.billService = billService;
        this.paymentService = paymentService;
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        User user = userService.findByUsername(auth.getName()).orElse(null);
        model.addAttribute("user", user);
        return "customer/profile";
    }

    @GetMapping("/bills")
    public String myBills(Authentication auth, Model model) {
        User user = userService.findByUsername(auth.getName()).orElse(null);
        if (user != null) {
            List<Bill> bills = billService.findByCustomerId(user.getId());
            model.addAttribute("bills", bills);
        }
        return "customer/bills";
    }

    @PostMapping("/pay/{billId}")
    public String payBill(@PathVariable Long billId) {
        paymentService.payBill(billId);
        return "redirect:/customer/bills";
    }
}