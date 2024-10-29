package com.PTUproj.repository;

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

//    public List<ItemDTO> selectProductBySearch(ItemDTO itemDTO) {
//        System.out.println("itenRepository.selectProductBySearch() called");
//
//        String sql = "SELECT * FROM product_table p, member_table m " +
//                    "WHERE p.MEMBER_ID = m.MEMBER_ID and product_name LIKE ? " +
//                    "ORDER BY p.product_id DESC";
//
//        List<ItemDTO> itemDTOS = null;
//
//        try{
//            itemDTOS = jdbcTemplate.query(sql, new RowMapper<ItemDTO>() {
//
//
//                @Override
//                public ItemDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
//
//                    ItemDTO itemDTO = new ItemDTO();
//
//                    itemDTO.setProductId(rs.getInt("product_id"));
//                    itemDTO.setProductName(rs.getString("product_name"));
//                    itemDTO.setProductImg1(rs.getString("product_img1"));
//                    itemDTO.setProductImg2(rs.getString("product_img2"));
//                    itemDTO.setProductDescription(rs.getString("product_description"));
//                    itemDTO.setProductPrice(rs.getDouble("product_price"));
//                    itemDTO.getProductDate(rs.getTimestamp("product_date"));
//                    itemDTO.setCategoryId(rs.getInt("category_id"));
//                    itemDTO.setMemberId(rs.getInt("member_id"));
//                    itemDTO.setMemberEmail(rs.getString("member_email"));
//
//                    return itemDTO;
//                }
//            }, "%" + itemDTO.getProductName() + "%");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return itemDTOS.size() > 0 ? itemDTOS : null;
//    }



}
