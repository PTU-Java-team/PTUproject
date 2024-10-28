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
    private String productName; // 상품명
    private String productImg1; // 상품 대표이미지
    private String productImg2; // 상품 상세이미지
    private String productDescription; // 상품 설명
    private int productPrice; // 상품 가격
    private Timestamp productDate; // 상품 등록일
    private int categoryId; // 상품카테고리명
    private int memberId; // 판매자 회원 ID
    private String memberEmail; // 판매자 회원 이메일
    private String categoryName; // 카테고리명

}
