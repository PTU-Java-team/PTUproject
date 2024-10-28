package com.PTUproj.repository;

import com.PTUproj.dto.ItemDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ItemRepository {


    private final SqlSessionTemplate ssTemplate; // SqlSessionTemplate bean 등록
    private final JdbcTemplate jdbcTemplate; // JdbcTemplate bean 등록

    // mapper.xml namespace 속성 값
    private final String nameSpace = "ItemMapper.";

    // 상품 등록하기 위한 행 수 반환 insertProduct()
    public int insertProduct(ItemDTO itemDTO) {
        System.out.println("ItemRepository.insertProduct() called");
        return ssTemplate.insert(nameSpace + "insertProduct", itemDTO);
        // itemMapper.xml에 있는 값을 insertProduct라는 id를 통해 key값으로 가져오고,
        // itemDTO의 값을 value로 가져온다.
        // insert 메서드는 데이터에 삽입되는 row(행)만큼 int값 반환, 삽입 성공 1, 삽입 실패 0
    }

    // 상품 정보 검색을 위한 selectList 메서드
    public List<ItemDTO> selectProductBySearch(ItemDTO itemDTO) {
        System.out.println("ItemRepository.selectProductBySearch() called");

        List<ItemDTO> itemDTOS = null;

        // null값 처리를 위한 예외처리
        try {
            itemDTOS = ssTemplate.selectList(nameSpace + "selectProductBySearch", itemDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 래코드 행 값이 넘어오지 않으면 null로 표시, 값이 넘어오면 itemDTOS에 저장되어 List로 반환
        return itemDTOS != null && itemDTOS.size() > 0 ? itemDTOS : null;
    }



}
