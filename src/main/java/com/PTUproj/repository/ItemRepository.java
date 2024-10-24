package com.PTUproj.repository;

import com.PTUproj.dto.ItemDTO;
import lombok.RequiredArgsConstructor;
import oracle.ucp.common.FailoverStats;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
public class ItemRepository {

    @Autowired
    SqlSessionTemplate sql; // SqlSessionTemplate bean 등록

//    private final String namespace = "ItemMapper.";
    // mapper.xml namespace 속성 값

    public void insertItem(ItemDTO dto) {
        sql.insert("ItemMapper.insertItem", dto);
    }

    public List<ItemDTO> selectAllItems() {
        return sql.selectList("ItemMapper.selectAllItems");
    }

    public ItemDTO getItemDetail(int productId) {
        return sql.selectOne("ItemMapper.getItemDetail", productId);
    }
}
