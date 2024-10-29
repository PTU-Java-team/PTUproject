package com.PTUproj.repository;

import com.PTUproj.dto.BoardDTO;
import com.PTUproj.dto.ItemDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ItemRepository {


    private final SqlSessionTemplate ssTemplate; // SqlSessionTemplate bean 등록
    private final JdbcTemplate jdbcTemplate; // JdbcTemplate bean 등록

    // mapper.xml namespace 속성 값
    private final String nameSpace = "ItemMapper.";


    public int insertProduct(ItemDTO itemDTO) {
        System.out.println("ItemRepository.insertProduct() called");
        return ssTemplate.insert(nameSpace + "insertProduct", itemDTO);
    }

    public List<ItemDTO> selectProductBySearch(ItemDTO itemDTO) {
        System.out.println("ItemRepository.selectProductBySearch() called");

        List<ItemDTO> itemDTOS = null;

        try {
            itemDTOS = ssTemplate.selectList(nameSpace + "selectProductBySearch", itemDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return itemDTOS != null && itemDTOS.size() > 0 ? itemDTOS : null;
    }

    public List<ItemDTO> findAllp() {
        return ssTemplate.selectList(nameSpace + "findAll");
    }

}
