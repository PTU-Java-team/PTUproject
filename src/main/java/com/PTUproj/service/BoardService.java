package com.PTUproj.service;

import com.PTUproj.repository.BoardRepository;
import com.PTUproj.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;


    public int save(BoardDTO boardDTO) {
        return boardRepository.saveb(boardDTO);
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAllb();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findByIdb(id);
    }

    public void updateHits(Long id) {
        boardRepository.updateHitsb(id);
    }

    public void delete(Long id) {
        boardRepository.deleteb(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.updateb(boardDTO);
    }
    int pageLimit = 500;
    public List<BoardDTO> pagingList(int page) {
//        오라클 내용에 있는것을 이해해야한다. 이해 완
//        구현 페이지당 몇개씩 넣을지 난 10개씩 넣을것
//                ex)1page =>10개
        //최대 페이지의 게시물 갯수
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        List<BoardDTO> pagingList = boardRepository.pagingListb(pagingParams);

        return boardRepository.pagingListb(pagingParams);
    }
    //지피티
//    int blockLimit=10;
//    public PageDTO pagingParam(int page) {
//        // 오류 발생 가능성 체크
//        int boardCount = boardRepository.boardCount();
//        if (boardCount <= 0) {
//            throw new RuntimeException("게시글의 개수가 0입니다.");
//        }
//
//        int maxPage = (int) (Math.ceil((double) boardCount / pageLimit));
//
//        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
//        int endPage = startPage + blockLimit - 1;
//        if (endPage > maxPage) {
//            endPage = maxPage;
//        }
//
//        // 디버깅용으로 값들을 출력해보기
//        System.out.println("pageLimit: " + pageLimit);
//        System.out.println("blockLimit: " + blockLimit);
//        System.out.println("boardCount: " + boardCount);
//        System.out.println("maxPage: " + maxPage);
//        System.out.println("startPage: " + startPage);
//        System.out.println("endPage: " + endPage);
//
//        PageDTO pageDTO = new PageDTO();
//        pageDTO.setPage(page);
//        pageDTO.setMaxPage(maxPage);
//        pageDTO.setStartPage(startPage);
//        pageDTO.setEndPage(endPage);
//        return pageDTO;
//    }
    /*

    public PageDTO pagingParam(int page) {
       //10개씩 마진 남기는 구간
        int boardCount = boardRepository.boardCount();

        int maxPage = (int) (Math.ceil((double) boardCount / pageLimit));


        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }*/
}
