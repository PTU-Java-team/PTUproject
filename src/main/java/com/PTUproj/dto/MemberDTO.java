package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
    private Long member_id;
    private String member_Email;
    private String member_Password;
    private String member_Name;
    private int member_Age;      // 숫자로 입력하지 않을 경우 400오류 발생
    private String member_Mobile;
    private int isAdmin; // 관리자 여부
}
