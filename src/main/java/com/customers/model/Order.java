package com.customers.model;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Order {
    private String id;
    private String description;
}
