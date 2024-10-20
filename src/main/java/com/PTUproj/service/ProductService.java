package com.PTUproj.service;

import com.PTUproj.dto.ProductTableDTO;
import com.PTUproj.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    // 전체 제품 목록 가져오기
    public List<ProductTableDTO> getAllProducts() {
        return productRepository.getAllProducts();
    }

    // 특정 제품 정보 가져오기
    public ProductTableDTO getProductById(int productId) {
        return productRepository.getProductById(productId);
    }

    // 새로운 제품 추가
    public boolean addProduct(ProductTableDTO product) {
        return productRepository.addProduct(product) > 0;
    }

    // 제품 정보 수정
    public boolean updateProduct(ProductTableDTO product) {
        return productRepository.updateProduct(product) > 0;
    }

    // 제품 삭제
    public boolean deleteProduct(int productId) {
        return productRepository.deleteProduct(productId) > 0;
    }

    // 특정 카테고리의 제품 목록 가져오기
    public List<ProductTableDTO> getProductsByCategoryId(int categoryId) {
        return productRepository.getProductsByCategoryId(categoryId);
    }

    // 제품 이름으로 검색
    public List<ProductTableDTO> searchProductsByName(String productName) {
        return productRepository.searchProductsByName(productName);
    }

    // 특정 제품의 가격 수정
    public boolean updateProductPrice(int productId, int newPrice) {
        return productRepository.updateProductPrice(productId, newPrice) > 0;
    }

    // 특정 제품의 이미지 업데이트
    public boolean updateProductImage(int productId, byte[] productImg) {
        return productRepository.updateProductImage(productId, productImg) > 0;
    }

    // 제품 재고 추가 (추가 기능 예시)
    public boolean addProductStock(int productId, int quantity) {
        return productRepository.addProductStock(productId, quantity) > 0;
    }

    // 특정 제품의 날짜 업데이트
    public boolean updateProductDate(int productId, String newDate) {
        return productRepository.updateProductDate(productId, newDate) > 0;
    }
    // 상품 저장
    public void saveProduct(ProductTableDTO product) {
        productRepository.save(product);
    }

    // ID로 특정 상품 조회
    public ProductTableDTO findProductById(int productId) {
        return productRepository.findById(productId);
    }

    // 모든 상품 조회
    public List<ProductTableDTO> findAllProducts() {
        return productRepository.findAll();
    }


}
