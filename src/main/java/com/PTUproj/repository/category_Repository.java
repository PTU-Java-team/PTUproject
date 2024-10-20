package com.PTUproj.repository;


import com.PTUproj.dto.category_tableDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface category_Repository {

    // 카테고리 저장
    void save(category_tableDTO category);

    // ID로 특정 카테고리 조회
    category_tableDTO findById(int categoryId);

    // 모든 카테고리 조회
    List<category_tableDTO> findAll();

    // 카테고리 삭제
    void delete(int categoryId);
}
