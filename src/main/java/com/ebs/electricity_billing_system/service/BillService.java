package com.ebs.electricity_billing_system.service;

import com.ebs.electricity_billing_system.model.Bill;
import com.ebs.electricity_billing_system.model.User;
import com.ebs.electricity_billing_system.repository.BillRepository;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class BillService {

    private final BillRepository billRepository;

    public BillService(BillRepository billRepository) {
        this.billRepository = billRepository;
    }

    public Bill generateBill(User customer, int units) {
        double amount = calculateAmount(units);
        Bill bill = new Bill();
        bill.setCustomer(customer);
        bill.setUnits(units);
        bill.setAmount(amount);
        bill.setBillingDate(LocalDate.now());
        bill.setPaid(false);
        return billRepository.save(bill);
    }

    public double calculateAmount(int units) {
        double amount = 0;
        if (units <= 100) {
            amount = units * 1.5;
        } else if (units <= 300) {
            amount = (100 * 1.5) + ((units - 100) * 2.5);
        } else {
            amount = (100 * 1.5) + (200 * 2.5) + ((units - 300) * 4.0);
        }
        return Math.round(amount * 100.0) / 100.0;
    }

    public List<Bill> findByCustomerId(Long customerId) {
        return billRepository.findByCustomerId(customerId);
    }

    public List<Bill> findAll() {
        return billRepository.findAll();
    }

    public Optional<Bill> findById(Long id) {
        return billRepository.findById(id);
    }

    public Bill save(Bill bill) {
        return billRepository.save(bill);
    }
}