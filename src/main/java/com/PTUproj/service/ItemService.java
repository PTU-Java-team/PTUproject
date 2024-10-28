package com.PTUproj.service;

import com.PTUproj.dto.ItemDTO;
import com.PTUproj.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class ItemService {

    private final ItemRepository itemRepository; // 의존성 주입

    // 상품등록을 위한 ItemRepository의 insertProduct() 메서드 호출
    public int registerProductConfirm(ItemDTO dto) {
        System.out.println("itemservice registerProductConfirm() called");

        System.out.println("result : " + itemRepository);

        return itemRepository.insertProduct(dto);
    }

    // 상품검색을 위한 ItemRepository의 selectProductBySearch() 메서드 호출
    public List<ItemDTO> searchProductConfirm(ItemDTO itemDTO) {
        System.out.println("itemservice searchProductConfirm() called");

        return itemRepository.selectProductBySearch(itemDTO);
    }
}
