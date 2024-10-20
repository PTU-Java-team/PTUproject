package com.PTUproj.repository;

import com.PTUproj.dto.CommentTableDTO;
import java.util.List;

public interface CommentRepository {
    // 댓글 저장
    int save(CommentTableDTO comment);

    // 댓글 ID로 댓글 조회
    CommentTableDTO findById(int commentId);

    // 모든 댓글 조회
    List<CommentTableDTO> findAll();

    // 댓글 삭제
    int delete(int commentId);
}
