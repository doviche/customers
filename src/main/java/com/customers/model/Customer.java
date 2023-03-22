package com.customers.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.ToString;

import java.util.Set;

@ToString
@Data
@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @Column(name = "email")
    private String email;
    @Column(name = "first_name")
    private String firstname;
    @Column(name = "last_name")
    private String lastname;
    @Column(name = "phone")
    private String mobilePhone;
   @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "customers_pkey")
    private Set<Order> orders;
}
