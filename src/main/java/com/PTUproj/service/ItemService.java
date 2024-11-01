package com.PTUproj.service;

import com.PTUproj.dto.BoardDTO;
import com.PTUproj.dto.ItemDTO;
import com.PTUproj.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Base64;
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

    public ItemDTO findById(int productId) {
        return itemRepository.findProductById(productId);
    }

    public List<ItemDTO> findAllp() {
        List<ItemDTO> items = itemRepository.findAllp();
//        for (ItemDTO item : items) {
//            if (item.getProductImg3() != null) {
//                // BLOB 데이터를 Base64로 인코딩하여 문자열로 설정
//                String encodedImage = Base64.getEncoder().encodeToString(item.getProductImg3());
////                System.out.println("Encoded Base64 Image: " + encodedImage); // 콘솔에 출력
//                item.setProductImg3(encodedImage.getBytes());
//            }
//        }
        return items;
    }


}