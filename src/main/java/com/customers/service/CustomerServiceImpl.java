package com.customers.service;

import com.customers.model.Customer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

public class CustomerServiceImpl implements CustomerService{

    private Logger logger = LoggerFactory.getLogger(getClass());
    private final List<Customer> customers;

    public CustomerServiceImpl(){
        customers = Arrays.asList(
                Customer.builder()
                        .email("doviche@gmail.com").firstname("Douglas").lastname("Oviche").mobilePhone("3884818490")
                        .build(),
                Customer.builder()
                        .email("isabella.dionisi@gmail.com").firstname("Isabella").lastname("Dionisi").mobilePhone("2345666023")
                        .build(),
                Customer.builder()
                        .email("giuseppesette@gmail.com").firstname("Giuseppe").lastname("Sette").mobilePhone("3425656093")
                        .build());
    }

    @Override
    public List<Customer> findAll() {
        logger.info("findAll");
        return customers;
    }

    @Override
    public Optional<Customer> findByEmail(String email) {
        logger.info("findByEmail {}", email);
        Predicate<Customer> customerPredicate = customer -> customer.getEmail().equals(email);
        return this.customers.stream().filter(customerPredicate).findFirst();
    }
}
