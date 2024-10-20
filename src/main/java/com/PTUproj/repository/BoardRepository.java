package com.PTUproj.repository;

import com.PTUproj.dto.BoardTableDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardRepository {
    // 게시글 추가
    int saveBoard(BoardTableDTO board);

    // 게시글 조회
    BoardTableDTO findBoardById(int boardId);

    // 모든 게시글 조회
    List<BoardTableDTO> findAllBoards();

    // 게시글 수정
    int updateBoard(BoardTableDTO board);

    // 게시글 삭제
    int deleteBoard(int boardId);
}
