package com.PTUproj.repository;

import com.PTUproj.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class BoardRepository {

    private final SqlSessionTemplate sql;

    public int saveb(BoardDTO boardDTO) {
        return sql.insert("Board.save", boardDTO);
    }

    public List<BoardDTO> findAllb() {
        return sql.selectList("Board.findAll");
    }

    public BoardDTO findByIdb(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void updateHitsb(Long id) {
        sql.update("Board.updateHits", id);
    }

    public void deleteb(Long id) {
        sql.delete("Board.delete", id);
    }

    public void updateb(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public List<BoardDTO> pagingListb(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

//    public int boardCount() {return sql.selectOne("Board.boardCount");
//    }

}