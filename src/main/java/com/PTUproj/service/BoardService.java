package com.PTUproj.service;

import com.PTUproj.dto.BoardTableDTO;
import com.PTUproj.repository.BoardRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    private final BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    // 게시글 작성
    public void saveBoard(BoardTableDTO board) {
        boardRepository.saveBoard(board);
    }

    // 특정 게시글 조회
    public BoardTableDTO getBoardById(int boardId) {
        return boardRepository.findBoardById(boardId);
    }

    // 모든 게시글 조회
    public List<BoardTableDTO> getAllBoards() {
        return boardRepository.findAllBoards();
    }

    // 게시글 수정
    public void updateBoard(BoardTableDTO board) {
        boardRepository.updateBoard(board);
    }

    // 게시글 삭제
    public void deleteBoard(int boardId) {
        boardRepository.deleteBoard(boardId);
    }
}
