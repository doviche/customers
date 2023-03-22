package com.customers.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@ToString
@Data
@Entity
@Table(name = "orders")
public class Order {
    @Id
    private String id;
    @Column(name = "description")
    private String description;
}
