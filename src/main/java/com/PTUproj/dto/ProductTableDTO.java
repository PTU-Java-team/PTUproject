package com.PTUproj.dto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductTableDTO {
    private int productId;
    private String productName;
    private String productImg1;
    private String productImg2;
    private byte[] productImg3; // BLOB을 byte 배열로 표현
    private String productDescription;
    private int productPrice;
    private String productDate;
    private int categoryId2;
}
