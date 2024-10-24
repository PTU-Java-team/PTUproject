package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class ItemDTO { // 판매자 관련 DTO입니다.
    private int productId; // 상품id
    private String productName;
    private String productImg1;
    private String productImg2;
    private byte[] productImg3;
    private String productDescription;
    private double productPrice;
    private Timestamp productDate;
    private int categoryId; // 상품카테고리명
}
