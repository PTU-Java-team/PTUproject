package com.PTUproj.service;

import com.PTUproj.repository.CommentRepository;
import com.PTUproj.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.savec(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAllc(boardId);
    }
}



