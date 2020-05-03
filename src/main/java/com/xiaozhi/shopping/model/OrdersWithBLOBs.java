package com.xiaozhi.shopping.model;

import lombok.Data;

@Data
public class OrdersWithBLOBs extends Orders {
    private String orderSummary;

    private String customFields;

    public String getOrderSummary() {
        return orderSummary;
    }

    public void setOrderSummary(String orderSummary) {
        this.orderSummary = orderSummary == null ? null : orderSummary.trim();
    }

    public String getCustomFields() {
        return customFields;
    }

    public void setCustomFields(String customFields) {
        this.customFields = customFields == null ? null : customFields.trim();
    }
}