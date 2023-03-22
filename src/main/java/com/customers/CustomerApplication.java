package com.customers;

import com.customers.repository.CustomerRepository;
import com.customers.service.CustomerService;
import com.customers.service.CustomerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.function.Function;

@SpringBootApplication
public class CustomerApplication{
	public static void main(String[] args) {
		SpringApplication.run(CustomerApplication.class, args);
	}

	@Bean
	public Function<String, String> uppercase() {
		return value -> value.toUpperCase();
	}

	@Autowired
	CustomerRepository customerRepository;

	@Bean
	CustomerService customerService(CustomerRepository customerRepository){
		return new CustomerServiceImpl(customerRepository);
	}
}
