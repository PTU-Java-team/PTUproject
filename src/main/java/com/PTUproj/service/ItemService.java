package com.PTUproj.service;

import com.PTUproj.dto.BoardDTO;
import com.PTUproj.dto.ItemDTO;
import com.PTUproj.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class ItemService {

    private final ItemRepository itemRepository;

    public int registerProductConfirm(ItemDTO dto) {
        System.out.println("itemservice registerProductConfirm() called");

        System.out.println("result : " + itemRepository);

        return itemRepository.insertProduct(dto);
    }

    public List<ItemDTO> searchProductConfirm(ItemDTO itemDTO) {
        System.out.println("itemservice searchProductConfirm() called");

        return itemRepository.selectProductBySearch(itemDTO);
    }

    public List<ItemDTO> findAllp() {
        return itemRepository.findAllp();
    }
}

