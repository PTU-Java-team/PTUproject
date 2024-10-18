package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private int memberAge;      // 숫자로 입력하지 않을 경우 400오류 발생
    private String memberMobile;
}
