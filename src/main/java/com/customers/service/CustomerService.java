package com.customers.service;

import com.customers.model.Customer;

import java.util.List;
import java.util.Optional;

public interface CustomerService {

    List<Customer> findAll();
    Optional<Customer> findByEmail(String email);
    Optional<Customer> save(Customer customer);
}
