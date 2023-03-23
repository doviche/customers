package com.customers.model;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.Set;

@ToString
@Data
@Builder
public class Customer {
    private String email;
    private String firstname;
    private String lastname;
    private String mobilePhone;
    private Set<Order> orders;
}
