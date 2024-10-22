package com.PTUproj.service;

import com.PTUproj.dto.MemberDTO;
import com.PTUproj.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional  //추가된 것
public class MemberService {
    private final MemberRepository memberRepository;    //의존성 주입

    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }

    public boolean login(MemberDTO memberDTO, HttpSession session) {
        MemberDTO loginMember = memberRepository.login(memberDTO);

        if (loginMember != null) {
            session.setAttribute("loginEmail", loginMember.getMember_Email()); // 이메일 저장
            session.setAttribute("isAdmin", loginMember.getIsAdmin()); // 1이면 true, 0이면 false
            return true;
        } else {
            return false;
        }

        //레파지토리에서 로그인 과정을 수행하고 결과를 DTO 객체로 받음
        //이후 결과가 null인지 판별

    }

    //회원 목록 보기
    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    //회원 목록에서 정보 상세보기
    public MemberDTO findById(Long member_id) {
        return memberRepository.findById(member_id);
    }

    public void delete(Long member_id) {
        memberRepository.delete(member_id);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);

        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public String emailCheak(String member_Email) {
        MemberDTO memberDTO = memberRepository.findByMemberEmail(member_Email);

        if (memberDTO == null) {
            return "ok";
        } else {
            return "no";    //이메일 조회 결과가 있다는 것, 즉 중복된 상황이라는 것
        }
    }

    //이건 중복되면 가입 못하게 막음
    public boolean isEmailTaken(String member_Email) {
        return memberRepository.findByMemberEmail(member_Email) != null;
    }

    public int save(MemberDTO memberDTO, Model model) {
        // 이메일 중복 체크
        if (isEmailTaken(memberDTO.getMember_Email())) {
            return 0; // 이메일이 중복인 경우
        }
        // 중복이 아닐 경우 회원 정보 저장
        return memberRepository.save(memberDTO);
    }


}
