package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderlinessTableDTO {
    private int orderId;
    private int orderPrice;
    private String orderImg;
    private int membersId;
    private int productId;
}

