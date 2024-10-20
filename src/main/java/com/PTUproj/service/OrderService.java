package com.PTUproj.service;

import com.PTUproj.dto.OrderlinessTableDTO;
import com.PTUproj.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    // 주문 저장
    public int saveOrder(OrderlinessTableDTO order) {
        return orderRepository.save(order);
    }

    // 주문 ID로 조회
    public OrderlinessTableDTO getOrderById(int orderId) {
        return orderRepository.findById(orderId);
    }

    // 모든 주문 조회
    public List<OrderlinessTableDTO> getAllOrders() {
        return orderRepository.findAll();
    }

    // 주문 삭제
    public int deleteOrder(int orderId) {
        return orderRepository.delete(orderId);
    }
}
