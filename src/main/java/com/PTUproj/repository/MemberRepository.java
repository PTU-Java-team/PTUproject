package com.PTUproj.repository;

import com.PTUproj.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemberRepository {
    //여기는 DB와 연관있음. mybatis

    private final SqlSessionTemplate sql;
    //음.....

    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        return sql.insert("Member.save", memberDTO);
        //memberMapper.xml을 보면 namespace가 Member로 되어있는거와 연관있음, save는 id와 연결
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
        //로그인 객체를 호출하고 DTO객체로 넘긴다
        //selectOne은 조회한 결과가 1개라는 것을 의미
        //System.out.println("Logging in with email: " + memberDTO.getMemberEmail());
        //return sql.selectOne("Member.login", memberDTO);

    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");    //회원정보 출력
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }


    public MemberDTO findByMemberEmail(String loginEmail) {
        return sql.selectOne("Member.findByMemberEmail", loginEmail);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);
    }
}
