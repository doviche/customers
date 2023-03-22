package com.customers.service;

import com.customers.model.Customer;
import com.customers.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService{

    private Logger logger = LoggerFactory.getLogger(getClass());

    private final CustomerRepository customerRepository;

    @Override
    public List<Customer> findAll() {
        logger.info("findAll");
        return customerRepository.findAll();
    }

    @Override
    public Optional<Customer> findByEmail(String email) {
        logger.info("findByEmail {}", email);
        return this.customerRepository.findByEmail(email);
    }

    @Override
    public Optional<Customer> save(Customer customer) {
        logger.info("save {}", customer.toString());
       customer.getOrders().forEach(order -> {
            String id = UUID.randomUUID().toString();
            order.setDescription("Description for ".concat(id));
            order.setId(id);
        });
        return Optional.of(this.customerRepository.save(customer));
    }
}
