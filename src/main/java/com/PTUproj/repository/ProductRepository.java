package com.PTUproj.repository;

import com.PTUproj.dto.ProductTableDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ProductRepository {

    // 전체 제품 목록 조회
    List<ProductTableDTO> getAllProducts();

    // 특정 제품 조회 (ID로 조회)
    ProductTableDTO getProductById(int productId);

    // 새로운 제품 추가
    int addProduct(ProductTableDTO product);

    // 제품 정보 업데이트
    int updateProduct(ProductTableDTO product);

    // 제품 삭제
    int deleteProduct(int productId);

    // 카테고리 ID로 제품 목록 조회
    List<ProductTableDTO> getProductsByCategoryId(int categoryId);

    // 제품 이름으로 검색
    List<ProductTableDTO> searchProductsByName(String productName);

    // 특정 제품의 가격 업데이트
    int updateProductPrice(int productId, int newPrice);

    // 제품의 이미지 업데이트
    int updateProductImage(int productId, byte[] productImg);

    // 제품 재고 추가 (추가 기능 예시)
    int addProductStock(int productId, int quantity);

    // 특정 제품의 날짜 업데이트
    int updateProductDate(int productId, String newDate);

    // 상품 저장
    void save(ProductTableDTO product);

    // ID로 특정 상품 조회
    ProductTableDTO findById(int productId);

    // 모든 상품 조회
    List<ProductTableDTO> findAll();
}

