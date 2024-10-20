package com.PTUproj.repository;

import com.PTUproj.dto.OrderlinessTableDTO;
import java.util.List;

public interface OrderRepository {
    // 주문 저장
    int save(OrderlinessTableDTO order);

    // 주문 ID로 조회
    OrderlinessTableDTO findById(int orderId);

    // 모든 주문 조회
    List<OrderlinessTableDTO> findAll();

    // 주문 삭제
    int delete(int orderId);
}
