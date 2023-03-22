package com.customers.model;

/**
 * Interfaccia usata come Proiezione da CustomerRepository ed
 * in concomitanza con la annotazione NamedNativeQuery presente in Customer domain model.
 * Impiegata con il solo scopo dimostrativo.
 */
public interface OrderSummary {
    String getDescription();
}
