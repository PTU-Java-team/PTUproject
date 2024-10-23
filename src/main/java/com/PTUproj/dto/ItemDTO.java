package com.PTUproj.dto;

import lombok.Data;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1b;

import java.sql.Blob;
import java.sql.Timestamp;

@Data
public class ItemDTO { // 판매자 관련 DTO입니다.
    private int productId; // 상품id
    private int categoryId; // 상품카테고리명
    private String name;
    private String img1;
    private String img2;
    private byte[] img3;
    private String detail;
    private double price;
    private Timestamp date;
}
