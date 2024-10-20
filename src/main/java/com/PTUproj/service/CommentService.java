package com.PTUproj.service;

import com.PTUproj.dto.CommentTableDTO;
import com.PTUproj.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    // 댓글 저장
    public int saveComment(CommentTableDTO comment) {
        return commentRepository.save(comment);
    }

    // 댓글 ID로 댓글 조회
    public CommentTableDTO getCommentById(int commentId) {
        return commentRepository.findById(commentId);
    }

    // 모든 댓글 조회
    public List<CommentTableDTO> getAllComments() {
        return commentRepository.findAll();
    }

    // 댓글 삭제
    public int deleteComment(int commentId) {
        return commentRepository.delete(commentId);
    }



}
