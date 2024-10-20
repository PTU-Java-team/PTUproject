package com.PTUproj.service;


import com.PTUproj.dto.category_tableDTO;
import com.PTUproj.repository.category_Repository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class category_Service {

    private final category_Repository categoryRepository;

    // 카테고리 저장
    public void saveCategory(category_tableDTO category) {
        categoryRepository.save(category);
    }

    // ID로 특정 카테고리 조회
    public category_tableDTO findCategoryById(int categoryId) {
        return categoryRepository.findById(categoryId);
    }

    // 모든 카테고리 조회
    public List<category_tableDTO> findAllCategories() {
        return categoryRepository.findAll();
    }

    // 카테고리 삭제
    public void deleteCategory(int categoryId) {
    }
}