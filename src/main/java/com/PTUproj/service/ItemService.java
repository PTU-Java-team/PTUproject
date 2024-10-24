package com.PTUproj.service;

import com.PTUproj.dto.ItemDTO;
import com.PTUproj.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional  //추가된 것
public class ItemService {
    private final ItemRepository itemRepository;


    public void registerItem(ItemDTO dto) {
        itemRepository.insertItem(dto);
    }

    public List<ItemDTO> getAllItems() {
        System.out.println("items: " + itemRepository.selectAllItems());
        return itemRepository.selectAllItems();
    }

    public ItemDTO getItemDetail(int productId) {
        return itemRepository.getItemDetail(productId);
    }

}
