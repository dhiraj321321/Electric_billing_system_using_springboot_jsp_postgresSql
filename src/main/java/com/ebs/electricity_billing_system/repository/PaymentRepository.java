package com.ebs.electricity_billing_system.repository;

import com.ebs.electricity_billing_system.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentRepository extends JpaRepository<Payment, Long> {}