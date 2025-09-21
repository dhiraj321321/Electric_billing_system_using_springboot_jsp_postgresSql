package com.ebs.electricity_billing_system.service;

import com.ebs.electricity_billing_system.model.Bill;
import com.ebs.electricity_billing_system.model.Payment;
import com.ebs.electricity_billing_system.repository.PaymentRepository;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;

@Service
public class PaymentService {

    private final PaymentRepository paymentRepository;
    private final BillService billService;

    public PaymentService(PaymentRepository paymentRepository, BillService billService) {
        this.paymentRepository = paymentRepository;
        this.billService = billService;
    }

    public Payment payBill(Long billId) {
        Bill bill = billService.findById(billId).orElse(null);

        if (bill == null || bill.isPaid()) {
            return null; // Or throw an exception
        }

        Payment payment = new Payment();
        payment.setBill(bill);
        payment.setAmount(bill.getAmount());
        payment.setPaidAt(LocalDateTime.now());

        bill.setPaid(true);
        billService.save(bill);

        return paymentRepository.save(payment);
    }
}