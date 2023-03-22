package com.customers.controller;

import com.customers.model.Customer;
import com.customers.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;


@RequiredArgsConstructor
@RequestMapping("api/v0/customers")
@RestController
public class CustomerController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private final CustomerService customerService;
    private final Function<String, String> uppercase;

    @GetMapping("/")
    public List<Customer> findAll(){
        List<Customer> customers = customerService.findAll();
        customers.forEach(customer -> {
            customer.setFirstname(uppercase.apply(customer.getFirstname()));
            customer.setLastname(uppercase.apply(customer.getLastname()));
        });
        return customers;
    }

    @GetMapping("/{email}/email")
    public ResponseEntity<Customer> findByEmail(@PathVariable("email") String email){
        logger.info("email {}", email);
        Optional<Customer> optionalCustomer =  customerService.findByEmail(email);
        if(optionalCustomer.isPresent()){
            return ResponseEntity.of(Optional.of(optionalCustomer.get()));
        }

        return ResponseEntity.of(Optional.empty());
    }

    @PostMapping("/")
    public ResponseEntity<Customer> save(@RequestBody Customer customer){
        Optional<Customer> optionalCustomer = customerService.save(customer);
        if(optionalCustomer.isPresent()){
            return ResponseEntity.of(optionalCustomer);
        }

        return ResponseEntity.of(Optional.empty());
    }
}
